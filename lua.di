
struct lua_State {};

extern (C) void lua_close(lua_State *L);
extern (C) lua_State *luaL_newstate();
extern (C) void luaL_openlibs(lua_State *L);

extern (C) alias lua_Reader = 
	const char * function(lua_State *L, void *data, size_t *size);
extern (C) alias lua_CFunction = int function(lua_State *L);

extern (C) int lua_load(lua_State *L, lua_Reader reader, void *data,
	const char *source, const char *mode);

extern (C) int lua_callk(lua_State *L, int nargs, int nresults, int ctx,
	lua_CFunction k);