ERL_ROOT=$(shell erl -noshell -eval 'io:format("~n~s~n", [code:root_dir()]).' -s erlang halt | tail -n 1)

compile:
	@gcc -fPIC -shared -o priv/detect.so include/detect.c -I $(ERL_ROOT)/usr/include/
	erl -make

sample:
	@ERL_LIBS=.. erl -noshell -pa demo/ebin -s sample run -s init stop

clean: 
	rm -rf ebin/*
	rm -rf demo/ebin/*
	rm -rf priv/detect.so
	rm -rf erl_crash.dump
