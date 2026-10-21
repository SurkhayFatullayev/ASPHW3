# Part 2: Dynamic and Static Binding in C#

## What we do?

In this task we writе a C# program to dеmonstratе dynamic and static binding in OOP. Dеmonstratе thе usagе of virtual, nеw and ovеrridе kеywords

Both examples contain a `Superclass` and a `Subclass`. Each class has a
`Print` method that writes messages to the console.

![output example](./img/output.png)

The purpose is to understand how C# selects a method when a base class and a
derived class contain methods with the same name.

## Static Binding

In static or early binding the binding of all the static, private, and final methods is done at compile-time by the compiler. 

In [Part2static.cs](./Part2static.cs), the `Subclass` declares another static
`Print` method using the `new` keyword:

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

The `new` keyword hides the method inherited from `Superclass`. Since both
methods are static, no object is required and the calls are resolved at
compile time.

## Dynamic Binding

Dynamic binding is also called runtime binding. The method to call is selected
at runtime according to the actual type of the object.

In [Part2dynamic.cs](./Part2dynamic.cs), the base class method is marked with
`virtual`, allowing a derived class to replace its implementation:

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

Although `B` has the compile-time type `Superclass`, it refers to a
`Subclass` object. Therefore, the overridden method in `Subclass` is selected
at runtime:

```text
superclass is called
subclass is called
```

## Difference Between the Examples

| Binding type | Keywords | Method selection |
| --- | --- | --- |
| Static binding | `new`, `static` | At compile time |
| Dynamic binding | `virtual`, `override` | At runtime |

The `new` keyword hides a base-class method, while `override` replaces a
virtual base-class method and enables runtime polymorphism.

## Java and C# Comparison

Java allows a static method to be called through an object reference:

```java
Superclass A = new Superclass();
Superclass B = new Subclass();

A.Print();
B.Print();
```

However, these calls are still resolved using the reference type, not the
actual object type. Therefore, both calls invoke `Superclass.Print()`. Java
allows this syntax, but it is usually discouraged because it can be
misleading. The recommended syntax is:

```java
Superclass.Print();
Subclass.Print();
```

C# does not allow a static method to be called through an object reference:

```csharp
Superclass B = new Subclass();
B.Print(); // Compile-time error
```

In C#, static methods must be called through the class name:

```csharp
Superclass.Print();
Subclass.Print();
```

This makes it clear that static binding is being used. For runtime
polymorphism, both Java and C# use instance methods. In C#, this is achieved
with `virtual` and `override`:

```csharp
Superclass B = new Subclass();
B.Print(); // subclass is called
```
