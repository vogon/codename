import std.file;
import std.stdio;
import lua;

int main(string[] args)
{
	LuaState state = new LuaState();

	auto scripts = dirEntries("scripts", "*.lua", SpanMode.depth);

	foreach (script; scripts)
	{
		try 
		{
			state.load(script.name);
			writeln("loaded " ~ script.name);
		}
		catch (LuaException e)
		{
			writeln("error loading " ~ script.name ~ ": " ~ e.msg);
		}
	}

	return 0;
}