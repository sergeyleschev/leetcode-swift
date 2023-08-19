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
    // 2816. Double a Number Represented as a Linked List

    // Time complexity: O(n)
    // Space complexity: O(1)

    func doubleIt(_ head: ListNode?) -> ListNode? {
        var head = head

        if head!.val > 4 {
            head = ListNode(0, head)
        }

        var node: ListNode? = head
        while node != nil {
            node!.val = (node!.val * 2) % 10
            if node!.next != nil && node!.next!.val > 4 {
                node!.val += 1
            }
            node = node!.next
        }

        return head
    }
}
