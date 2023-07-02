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

    // 143. Reorder List
    // You are given the head of a singly linked-list. The list can be represented as:
    // L0 → L1 → … → Ln - 1 → Ln
    // Reorder the list to be on the following form:
    // L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
    // You may not modify the values in the list's nodes. Only nodes themselves may be changed.

    // Reorder linked list.
    // - Parameter head: Linked list head.

    // Example 1:
    // Input: head = [1,2,3,4]
    // Output: [1,4,2,3]

    // Example 2:
    // Input: head = [1,2,3,4,5]
    // Output: [1,5,2,4,3]

    // Constraints:
    // The number of nodes in the list is in the range [1, 5 * 10^4].
    // 1 <= Node.val <= 1000

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.

    func reorderList(_ head: ListNode?) {
        guard head != nil else { return }

        var slow = head
        var fast = head

        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        let reversedList = reverseList(slow)
        mergeLists(head, reversedList)
    }

    private func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        var next: ListNode? = nil

        while curr != nil {
            next = curr?.next

            curr?.next = prev
            prev = curr
            curr = next
        }

        return prev
    }

    private func mergeLists(_ first: ListNode?, _ second: ListNode?) {
        var first = first
        var second = second
        var tmp: ListNode? = nil

        while second?.next != nil {
            tmp = first?.next
            first?.next = second
            first = tmp

            tmp = second?.next
            second?.next = first
            second = tmp
        }
    }

}
