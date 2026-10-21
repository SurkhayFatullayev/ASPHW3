
using System;

class NewClass
{
    public class Superclass
    {
        public static void Print()
        {
            Console.WriteLine("superclass is called");
        }
    }

    public class Subclass : Superclass
        {
        public new static void Print()
        {
            Console.WriteLine("subclass is called");
        }
    }

    static void Main()
    {
        Superclass.Print();
        Subclass.Print();
    }
}
