
using System;

class GFG
{
    public class Superclass
    {
        public virtual void Print()
        {
            Console.WriteLine("superclass is called");
        }
    }

    public class Subclass : Superclass
    {
        public override void Print()
        {
            Console.WriteLine("subclass is called");
        }
    }

    static void Main()
    {
        Superclass A = new Superclass();
        Superclass B = new Subclass();

        A.Print();
        B.Print();
    }
}
