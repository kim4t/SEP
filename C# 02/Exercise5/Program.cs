using System;

namespace Exercise5
{
    class Program
    {
        static void Main(string[] args)
        {
            Box box1 = new Box();
            Box box2 = new Box();
            Box box3 = new Box();

            box1.setLength(1);
            box1.setHeight(2);
            box1.setBreadth(3);

            box2.setLength(4);
            box2.setHeight(5);
            box2.setBreadth(6);

            box3.setLength(7);
            box3.setHeight(8);
            box3.setBreadth(9);

            Console.WriteLine($"Volume of Box1 : {box1.getVolume()}");
            Console.WriteLine($"Volume of Box2 : {box2.getVolume()}");
            Console.WriteLine($"Volume of Box3 : {box3.getVolume()}");
        }
    }
}
