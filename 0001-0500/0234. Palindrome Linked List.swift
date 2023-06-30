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

    // Solution by Sergey Leschev

    // 234. Palindrome Linked List
    // Given the head of a singly linked list, return true if it is a palindrome.

    // Example 1:
    // Input: head = [1,2,2,1]
    // Output: true

    // Example 2:
    // Input: head = [1,2]
    // Output: false
     
    // Constraints:
    // The number of nodes in the list is in the range [1, 10^5].
    // 0 <= Node.val <= 9
 
    // Follow up: Could you do it in O(n) time and O(1) space?

    func isPalindrome(_ head: ListNode?) -> Bool {
        var tail: ListNode?
        var count = 0
        var curr = head
        var prev: ListNode?
        var next: ListNode?
        var index = 0
        
        while curr != nil {
            count += 1
            if curr?.next == nil { tail = curr }
            curr = curr?.next
        }
        
        curr = head
        while curr != nil {
            if index >= count / 2 {
                next = curr?.next
                curr?.next = prev
                prev = curr
                curr = next
            } else {
                curr = curr?.next
            }
            index += 1
        }
        
        var head = head
        while head != nil && tail != nil {
            if head!.val != tail!.val { return false }
            head = head?.next
            tail = tail?.next
        }
        
        return true
    }
    
}