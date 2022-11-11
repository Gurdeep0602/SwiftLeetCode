
//1. Two Sum
//
//Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//You can return the answer in any order.
//
// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var map = [Int: Int]()
        
//        for i in 0..<nums.count {
//            map[nums[i]] = i
//        }
        
        for i in 0..<nums.count {
            
            let complement = target - nums[i]
            if let cIndex = map[complement] {
                return [i, cIndex]
            }
            map[nums[i]] = i
        }
        
        return []
    }
}

let result = Solution().twoSum([3,2,4], 6)
print(result)
