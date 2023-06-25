/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {

    // Solution @ Sergey Leschev

    // 2. Add Two Numbers
    // You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
    // You may assume the two numbers do not contain any leading zero, except the number 0 itself.

    // Example 1:
    // Input: l1 = [2,4,3], l2 = [5,6,4]
    // Output: [7,0,8]
    // Explanation: 342 + 465 = 807.
    
    // Example 2:
    // Input: l1 = [0], l2 = [0]
    // Output: [0]

    // Example 3:
    // Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
    // Output: [8,9,9,9,0,0,0,1]
     
    // Constraints:
    // The number of nodes in each linked list is in the range [1, 100].
    // 0 <= Node.val <= 9
    // It is guaranteed that the list represents a number that does not have leading zeros.

    // - Parameters:
    //   - l1: Linked list representing non-negative integer. The digits are stored in reverse
    //     order and each of nodes contain a single digit.
    //   - l2: Linked list representing non-negative integer. The digits are stored in reverse
    //     order and each of nodes contain a single digit.
    // - Returns: Sum of l1 and l2 represented as linked list.
    //
    // - Complexity:
    //   - time: O(max(n, m)), where n is the length of the l1 and m is the length of the l2.
    //   - space: O(max(n, m)), where n is the length of the l1 and m is the length of the l2.
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let dummyHead = ListNode(-1)
        var tail: ListNode? = dummyHead
        var carry = 0
        
        while l1 != nil || l2 != nil || carry != 0 {
            var value = carry
            
            if let l1Val = l1?.val {
                value += l1Val
                l1 = l1?.next
            }
            
            if let l2Val = l2?.val {
                value += l2Val
                l2 = l2?.next
            }
            
            let digit = value % 10
            carry = value / 10
            tail?.next = ListNode(digit)
            tail = tail?.next
        }
        
        return dummyHead.next
    }

}