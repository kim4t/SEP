using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise4
{
    class Person
    {
        int age;
        public Person()
        {
            Console.WriteLine("Hello");
        }
        public void setAge(int age)
        {
            this.age = age;
        }
        public int getAge()
        {
            return age;
        }
    }
}
