-module(special).

-compile({parse_transform, my_parse}).

-export([ping/0]).

ping() -> pong.
