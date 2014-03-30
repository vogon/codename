import std.stdio;
import std.c.string;
import core.memory;
import core.sys.posix.setjmp;
import lua;

class LuaException : object.Exception
{
	this()
	{
		super("Lua exception");
	}
}

int main(string[] args)
{
	LuaState state = new LuaState();

	//lua_State *state = luaL_newstate();
	//luaL_openlibs(state);

	//auto f = File("script.lua", "r");

	//int loadResult = 
	//	lua_load(state, &read_chunk, &f, "script.lua", null);

	//writeln("hi!");

	//try 
	//{
	//	lua_pcall(state, 0, 0, 0);
	//}
	//catch (Exception e)
	//{
	//	writeln("hello!");
	//}

	//lua_close(state);

	return 0;
}