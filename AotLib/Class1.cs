using System.Runtime.InteropServices;

namespace AotLib;

public static class NativeEntryPoints
{

    [UnmanagedCallersOnly(EntryPoint = "add")]
    public static int Add(int x, int y)
    {
        return x + y;
    }

}
