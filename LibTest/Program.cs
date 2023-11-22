using System.Runtime.InteropServices;

namespace LibTest
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("$Starting up the DLL interop");
            var result = add(1, 8);
            Console.WriteLine($"The sume of 1 and 8 is {result}");
        }

        [DllImport("aotlib.so")]
        public static extern int add(int x, int y);
    }
}
