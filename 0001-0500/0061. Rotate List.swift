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

    // 61. Rotate List
    // Given the head of a linked list, rotate the list to the right by k places.

    // Rotates the list to the right by k places.

    // - Parameters:
    //   - head: Head of the linked list.
    //   - k: A number of rotation steps.
    // - Returns: The new head of the linked list.

    // Example 1:
    // Input: head = [1,2,3,4,5], k = 2
    // Output: [4,5,1,2,3]

    // Example 2:
    // Input: head = [0,1,2], k = 4
    // Output: [2,0,1]

    // Constraints:
    // The number of nodes in the list is in the range [0, 500].
    // -100 <= Node.val <= 100
    // 0 <= k <= 2 * 10^9

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.

    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head?.next != nil else { return head }

        var curr = head
        var len = 1

        while curr?.next != nil {
            curr = curr?.next
            len += 1
        }
        curr?.next = head

        for _ in 0..<(len - k % len) { curr = curr?.next }

        var newHead = curr?.next
        curr?.next = nil

        return newHead
    }
    
}