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

    // Solution @ Sergey Leschev, Belarusian State University

    // 25. Reverse Nodes in k-Group
    // Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
    // k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.
    // You may not alter the values in the list's nodes, only nodes themselves may be changed.

    // Example 1:
    // Input: head = [1,2,3,4,5], k = 2
    // Output: [2,1,4,3,5]

    // Example 2:
    // Input: head = [1,2,3,4,5], k = 3
    // Output: [3,2,1,4,5]

    // Example 3:
    // Input: head = [1,2,3,4,5], k = 1
    // Output: [1,2,3,4,5]

    // Example 4:
    // Input: head = [1], k = 1
    // Output: [1]
     
    // Constraints:
    // The number of nodes in the list is in the range sz.
    // 1 <= sz <= 5000
    // 0 <= Node.val <= 1000
    // 1 <= k <= sz
     
    // Follow-up: Can you solve the problem in O(1) extra memory space?

    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var tmp1: ListNode? = head
        
        for _ in 0..<k - 1 { tmp1 = tmp1?.next }

        if tmp1 == nil {
            return head
        } else {
            var current: ListNode?
            var tmp2: ListNode?
            
            for _ in 0..<k {
                if current == nil {
                    current = head?.next
                    head?.next = reverseKGroup(tmp1?.next, k)
                    tmp1 = head
                } else {
                    tmp2 = current?.next
                    current?.next = tmp1
                    tmp1 = current
                    current = tmp2
                }
            }
            return tmp1
        }

    }

}