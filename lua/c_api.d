struct lua_State {};

const LUA_OK = 0;
const LUA_YIELD = 1;
const LUA_ERRRUN = 2;
const LUA_ERRSYNTAX = 3;
const LUA_ERRMEM = 4;
const LUA_ERRGCMM = 5;
const LUA_ERRERR = 6;

extern (C) lua_State *luaL_newstate();

extern (C) alias lua_Reader = 
	const(char) * function(lua_State *L, void *data, size_t *size);
extern (C) alias lua_CFunction = int function(lua_State *L);

extern (C) void lua_close(lua_State *L);
extern (C) void luaL_openlibs(lua_State *L);
extern (C) lua_CFunction lua_atpanic(lua_State *L, lua_CFunction panicf);

extern (C) int lua_load(lua_State *L, lua_Reader reader, void *data,
	const(char) *source, const(char) *mode);

extern (C) int lua_pcallk(lua_State *L, int nargs, int nresults, 
	int errfunc, int ctx, lua_CFunction k);

int lua_pcall(lua_State *L, int nargs, int nresults, int errfunc)
{
	return lua_pcallk(L, nargs, nresults, errfunc, 0, null);
}

extern (C) int lua_gettop(lua_State *L);

extern (C) const char *lua_tolstring(lua_State *L, int index, size_t *len);

extern (C) void lua_settop(lua_State *L, int idx);

void lua_pop(lua_State *L, int n)
{
	lua_settop(L, -(n) - 1);
}