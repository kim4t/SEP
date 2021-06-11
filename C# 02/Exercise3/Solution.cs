using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise3
{
    class Solution
    {
        public int solution(int a, int b)
        {
            int numOfPerpectSqure = 0;
            var hashSet = new HashSet<int>();
            for (int i = 0; Math.Pow(i, 2) <= 10000; i++)
                hashSet.Add((int)Math.Pow(i, 2));
            for(int i =a;i<=b;i++)
            {
                if (hashSet.Contains(i))
                    numOfPerpectSqure++;
            }
            return numOfPerpectSqure;
        }
    }
}
