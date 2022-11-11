//3. Longest Substring Without Repeating Characters
//
//Given a string s, find the length of the longest substring without repeating characters.
//
//https://leetcode.com/problems/longest-substring-without-repeating-characters/

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    func firstIntIndex(of ele: Element) -> Int? {
        self.firstIndex(of: ele)?.utf16Offset(in: self)
    }
    
    func lastIntIndex(of ele: Element) -> Int? {
        self.lastIndex(of: ele)?.utf16Offset(in: self)
    }
}

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        var start = 0
        var end = 0
        
//        let s : [Character] = Array(s)
        var substring = String()
        var output = String()

        for ch in s {
            
            if substring.contains(ch) {
                
                let sub = s[start...end]
                start = sub.firstIntIndex(of: ch)! + 1
                if substring.count > output.count {
                    output = substring
                }
                
                substring = s[start..<end]
            }
            
            substring.append(ch)
            end += 1
            
            print("substring = \(substring)")
            print("start = \(start)")
            print("end = \(end)")
        }
        
        output = substring.count > output.count ? substring : output
        print(output)
        return output.count
    }
}

Solution().lengthOfLongestSubstring("dvdf")

//" "
//"dvdf"
//"au"
//"aaub"
