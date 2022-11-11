
//4. Median of Two Sorted Arrays
//
//Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
//
//The overall run time complexity should be O(log (m+n)).
//
//https://leetcode.com/problems/median-of-two-sorted-arrays/

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var newArr = [Int]()
        var i = 0, j = 0
        
        while i < nums1.count && j < nums2.count {
            if (nums1[i] < nums2[j]) {
                newArr.append(nums1[i])
                i += 1
            }
            else {
                newArr.append(nums2[j])
                j += 1
            }
        }
        
        newArr.append(contentsOf: nums1[i..<nums1.endIndex])
        newArr.append(contentsOf: nums2[j..<nums2.endIndex])

        let medianIndex = newArr.count/2
        print(medianIndex)
        
        if newArr.count%2  == 1 {
            return Double(newArr[medianIndex])
        } else {
            return Double(newArr[medianIndex] + newArr[medianIndex-1])/2.0
        }
    }
}

Solution().findMedianSortedArrays([1,2], [3,4])
