#include "erl_nif.h"
#include <unistd.h>

static ERL_NIF_TERM detect(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    if(isatty(STDOUT_FILENO)) {
        return enif_make_int(env, 0);
    } else {
        return enif_make_int(env, 1);
    }
}
static ErlNifFunc nif_funcs[] =
{
    {"detect", 0, detect}
};
ERL_NIF_INIT(detect, nif_funcs, NULL, NULL, NULL, NULL)
