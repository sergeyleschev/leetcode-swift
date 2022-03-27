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

    // 82. Remove Duplicates from Sorted List II
    // Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.

    // Deletes all nodes that have duplicate numbers, leaving only distinct numbers
    // from the original list.

    // - Parameter head: Linked list head.
    // - Returns: Linked list head.

    // Example 1:
    // Input: head = [1,2,3,3,4,4,5]
    // Output: [1,2,5]

    // Example 2:
    // Input: head = [1,1,1,2,3]
    // Output: [2,3]
     
    // Constraints:
    // The number of nodes in the list is in the range [0, 300].
    // -100 <= Node.val <= 100
    // The list is guaranteed to be sorted in ascending order.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.

    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(-1)
        dummy?.next = head

        var curr = dummy
        while let nextVal = curr?.next?.val, let nextNextVal = curr?.next?.next?.val {
            if nextVal == nextNextVal {
                let duplicate = nextVal
                while curr?.next != nil, curr?.next?.val == duplicate {
                    curr?.next = curr?.next?.next
                }
            } else {
                curr = curr?.next
            }
        }

        return dummy?.next
    }

}