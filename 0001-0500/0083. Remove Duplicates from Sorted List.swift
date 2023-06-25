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

    // 83. Remove Duplicates from Sorted List
    // Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

    // Deletes all duplicates such that each element appears only once.

    // - Parameter head: The head of the sorted linked list.
    // - Returns: The head of the sorted linked list without duplicates.

    // Example 1:
    // Input: head = [1,1,2]
    // Output: [1,2]

    // Example 2:
    // Input: head = [1,1,2,3,3]
    // Output: [1,2,3]
     
    // Constraints:
    // The number of nodes in the list is in the range [0, 300].
    // -100 <= Node.val <= 100
    // The list is guaranteed to be sorted in ascending order.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        var last: ListNode?
        
        while current != nil {
            if last != nil && current!.val == last!.val {
                last?.next = current?.next
            
            } else {
                last = current
            }
            
            current = current?.next
        }
        
        return head
    }

}