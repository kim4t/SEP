using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise4
{
    class Student : Person
    {
        public void GoToClass()
        {
            Console.WriteLine("I'm going to class");
        }
        public void ShowAge()
        {
            Console.WriteLine($"My age is: {getAge()} years old.");
        }
    }
}
