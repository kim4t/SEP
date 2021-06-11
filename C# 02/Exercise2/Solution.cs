using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace Exercise2
{
    
    class Solution
    {
        public int solution(int [] arr)
        {
            Dictionary<int, int> map = new Dictionary<int,int>();
            foreach (int num in arr)
            {
                if (map.ContainsKey(num))
                    map[num]++;
                else
                    map.Add(num, 1);
            }

            var list = map.ToList();
            int mostCommonNum = 0;
            int maxOccurrence = 0;
            foreach (var item in map)
            {
                if(item.Value > maxOccurrence)
                {
                    maxOccurrence = item.Value;
                    mostCommonNum = item.Key;
                }
            }
            return mostCommonNum;
        }
    }
    
}
