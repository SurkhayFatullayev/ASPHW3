# Part 2: Dynamic and Static Binding in C#

## What we do?

In this task we writе a C# program to dеmonstratе dynamic and static binding in OOP. Dеmonstratе thе usagе of virtual, nеw and ovеrridе kеywords

Both examples contain a `Superclass` and a `Subclass`. Each class has a `Print` method that writes messages to the console.

In both codes result is same but the way of getting it is different
![output example](./img/output.png)

The purpose is to understand how C# selects a method when a base class and a derived class contain methods with the same name.

The `new` keyword hides a base-class method, while `override` replaces a virtual base-class method and enables runtime polymorphism.

## Dynamic Binding

Dynamic binding is also called runtime binding. The method to call is selected at runtime according to the actual type of the object.

the base class method is marked with `virtual`, allowing a derived class to replace its implementation:

```csharp
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
```

The method is called through a base-class reference:

```csharp
Superclass A = new Superclass();
Superclass B = new Subclass();

A.Print();
B.Print();
```

even tho we call to object overwrite helps us get already changed value

```text
superclass is called
subclass is called
```

## Static Binding

In static or early binding the binding of all the static, private, and final methods is done at compile-time by the compiler. 

In code for static code we see that `Subclass` tries to hide its Parent's `Print()` method using `new` keyword. 
```csharp
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
```

The methods are called through their class names:

```csharp
Superclass.Print();
Subclass.Print();
```

unlike in Java we cannot call static through an object reference
```java
Superclass A = new Superclass();
Superclass B = new Subclass();

A.Print();
B.Print();
```

C# doesnt allow that since you are calling an instance method, which could change the state of the object or work on/with the object data in some way. A static method is not working with/on the object instance a, so purely from a code readibility/maintainablity perspective, what you want just makes things more error-prone since it goes against intuition/expectations when reading the code

```csharp
Superclass B = new Subclass();
B.Print(); // Compile-time error
```

in case it would be possible we would get 
```cmd
superclass is called
superclass is called
```
as result