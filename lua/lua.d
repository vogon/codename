import std.conv;
import std.stdio;
import std.string;
import std.c.string;
import core.memory;
import c_api;

class LuaException : object.Exception
{
	this(string message)
	{
		super(message, "blah", 0);
	}
}

class LuaState
{
private:
	lua_State *_state;

	char *malloc_readChunk;
	File readFile;

	extern (C) static const(char) *read_chunk(lua_State *L, void *data, size_t *size)
	{
		LuaState *state = cast(LuaState *)data;
		char[1024] buffer;
		char[] read = state.readFile.rawRead(buffer);

		if (read.length > 0)
		{
			*size = read.length;
			memcpy(state.malloc_readChunk, cast(void *)read, read.length);
		}
		else
		{
			*size = 0;
		}

		return state.malloc_readChunk;
	}

	void _call(int nargs, int nresults, int errfunc)
	{
		int callResult = lua_pcall(_state, nargs, nresults, errfunc);

		if (callResult != LUA_OK)
		{
			size_t strLength;
			int top = lua_gettop(_state);
			auto errMsg = lua_tolstring(_state, top, &strLength);

			lua_pop(_state, 1);

			throw new LuaException(to!string(errMsg[0..strLength]));
		}
	}

public:
	this()
	{
		_state = luaL_newstate();
		luaL_openlibs(_state);
	}

	~this()
	{
		lua_close(_state);
	}

	void load(string filename)
	{
		malloc_readChunk = cast(char *)GC.malloc(1024);
		scope (exit) GC.free(malloc_readChunk);

		readFile = File(filename, "r");

		int loadResult =
			lua_load(_state, &read_chunk, &this, toStringz("@" ~ filename), null);

		_call(0, 0, 0);
	}
}