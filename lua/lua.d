import std.stdio;
import std.c.string;
import core.memory;
import c_api;

class LuaState
{
private:
	lua_State *_state;
	char *malloc_lastChunk;

	extern (C) const(char) *read_chunk(lua_State *L, void *data, size_t *size)
	{
		if (malloc_lastChunk != null)
		{
			GC.free(malloc_lastChunk);
			malloc_lastChunk = null;
		}

		File *f = cast(File *)data;
		char[1024] buffer;
		char[] read = f.rawRead(buffer);

		if (read.length > 0)
		{
			*size = read.length;
			malloc_lastChunk = cast(char *)GC.malloc(read.length);
			memcpy(malloc_lastChunk, cast(void *)read, read.length);
		}
		else
		{
			*size = 0;
		}

		return malloc_lastChunk;
	}

public:
	this()
	{
		_state = luaL_newstate();
	}
}