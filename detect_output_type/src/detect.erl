-module(detect).
-export([init/0, detect/0]).

init() ->
    case code:priv_dir(detect_output_type) of
        {error, _} -> io:format("Error: driver not found");
        Path       -> erlang:load_nif(Path ++ "/detect", 0)
    end.

detect() ->
    "NIF library not loaded".
