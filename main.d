import std.stdio;
import std.c.string;
import core.memory;
import core.sys.posix.setjmp;
import lua;

int main(string[] args)
{
	LuaState state = new LuaState();

	try 
	{
		state.load("script.lua");
	}
	catch (LuaException e)
	{
		writeln("error loading script: " ~ e.msg);
	}

	return 0;
}