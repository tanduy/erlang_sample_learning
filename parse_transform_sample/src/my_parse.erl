-module(my_parse).
-export([parse_transform/2]).

%% This function is auto called if your modules embed the template
%% -compile({parse_transform, my_parse}).
parse_transform(Form, _Opt) ->
    % Create Tokens from string
    {ok, ExportTokens, _} = erl_scan:string("-export([greeting/0])."),
    {ok, FunTokens, _}    = erl_scan:string("greeting() -> 'Hello World'."),
    % Create Form from Tokens
    {ok, ExportForm} = erl_parse:parse_form(ExportTokens),
    {ok, FunForm}    = erl_parse:parse_form(FunTokens),
    
    % Embed the export of function greeting/0 to Form
    {_Part1, _Part2} = lists:splitwith(fun(Element) ->
        case element(1, Element) == attribute of
            false -> true;

            true  ->
                case element(3, Element) == export of
                    false -> true;
                    true  -> false
                end
        end
    end, Form),
    Part1 = lists:append(_Part1, [ExportForm]),
    % Embed the function greeting/0 to Form
    {_Part21, Part22} = lists:splitwith(fun(Element) ->
        case element(1, Element) == function of
            false -> true;

            true  -> false
        end
    end, _Part2),
    Part21 = lists:append(_Part21, [FunForm]),
    Part2 = lists:append(Part21, Part22),
    lists:append(Part1, Part2).

