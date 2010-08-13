-module(sample).
-compile(export_all).

run() ->
    detect:init(),
    case detect:detect() of
        0 -> io:format("~s~s~s~n",["\e[31m","Hello world!","\e[0m"]);
        1 -> io:format("Hello world!")
    end.
