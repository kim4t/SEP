using System;

namespace Exercise3
{
    class MainClass
    {
        static  void f(ref string s)
              {
            s += " world";
        }
        [STAThread]
        static void Main (string[] args)
       {
            String s = "Hello";
            f(ref s);
            Console.WriteLine(s);
        }
    }

}
