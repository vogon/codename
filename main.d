import std.stdio;

struct lua_State {};
extern (C) void lua_close(lua_State *L);
extern (C) lua_State *luaL_newstate();

int main(string[] args) 
{
	lua_State *state = luaL_newstate();

	writeln("hi!");

	lua_close(state);

	return 0;
}