
//2. Add Two Numbers
//
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
// https://leetcode.com/problems/add-two-numbers/

import Foundation
 
public class ListNode : CustomStringConvertible {

    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public var description: String {
                
        var output = String()

        var l : ListNode? = self
        repeat {
            output.append("\(l!.val)" + "->")
            l = l!.next
        } while l != nil

        output.removeLast()
        output.removeLast()
        
        return output
    }
 }

class Solution {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int = 0) -> ListNode? {
        
        var head : ListNode?
        if l1 == nil && l2 == nil { return carry == 0 ? nil : ListNode(carry) }
        else {
            var sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            let newCarry = sum > 9 ? 1 : 0
            sum = sum%10
            head = ListNode(sum)
            head?.next = addTwoNumbers(l1?.next, l2?.next, newCarry)
        }
         
        return head
    }
}

Solution().addTwoNumbers([9,9,9,9,9,9,9].toLinkedList(),
                         [9,9,9,9].toLinkedList())


extension Array where Element == Int {
    
    func toLinkedList() -> ListNode? {
            
        var head : ListNode
        
        if let first = self.first {
            head = ListNode(first)
        } else {
            return nil
        }
        
        var l : ListNode? = head
        for (i, ele) in self.enumerated() {
            if i == 0 { continue }
            l?.next = ListNode(ele)
            l = l?.next
        }
        
        return head
    }
}
