/// Definition for singly-linked list.
/// public class ListNode {
///     public var val: Int
///     public var next: ListNode?
///     public init() { self.val = 0; self.next = nil; }
///     public init(_ val: Int) { self.val = val; self.next = nil; }
///     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
/// }
class Solution {

    // Solution by Sergey Leschev

    // 876. Middle of the Linked List
    // Given a non-empty, singly linked list with head node head, return a middle node of linked list.
    // If there are two middle nodes, return the second middle node.

    // Finds middle node of the Linked List.

    // - Parameter head: Non-empty linked list.
    // - Returns: A middle node of the linked list.

    // Example 1:
    // Input: [1,2,3,4,5]
    // Output: Node 3 from this list (Serialization: [3,4,5])
    // The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
    // Note that we returned a ListNode object ans, such that:
    // ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.

    // Example 2:
    // Input: [1,2,3,4,5,6]
    // Output: Node 4 from this list (Serialization: [4,5,6])
    // Since the list has two middle nodes with values 3 and 4, we return the second one.

    // Note:
    // The number of nodes in the given list will be between 1 and 100.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.

    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head

        while let fastNext = fast?.next {
            slow = slow?.next
            fast = fastNext.next
        }

        return slow
    }

}
