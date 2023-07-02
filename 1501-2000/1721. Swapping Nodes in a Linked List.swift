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

    // 1721. Swapping Nodes in a Linked List
    // You are given the head of a linked list, and an integer k.
    // Return the head of the linked list after swapping the values of the kth node from the beginning and the kth node from the end (the list is 1-indexed).

    // Swaps nodes in a linked list.

    // - Parameters:
    //   - head: Linked list head.
    //   - k: An integer.
    // - Returns: Linked list head.

    // Example 1:
    // Input: head = [1,2,3,4,5], k = 2
    // Output: [1,4,3,2,5]

    // Example 2:
    // Input: head = [7,9,6,6,7,8,3,0,9,5], k = 5
    // Output: [7,9,6,6,8,7,3,0,9,5]

    // Example 3:
    // Input: head = [1], k = 1
    // Output: [1]

    // Example 4:
    // Input: head = [1,2], k = 1
    // Output: [2,1]

    // Example 5:
    // Input: head = [1,2,3], k = 2
    // Output: [1,2,3]

    // Constraints:
    // The number of nodes in the list is n.
    // 1 <= k <= n <= 10^5
    // 0 <= Node.val <= 100

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the list.
    //   - space: O(1), only constant space is used.

    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var listLength = 0
        var frontNode: ListNode? = nil
        var endNode: ListNode? = nil
        var currentNode = head

        while currentNode != nil {
            listLength += 1
            if endNode != nil { endNode = endNode?.next }

            if listLength == k {
                frontNode = currentNode
                endNode = head
            }

            currentNode = currentNode?.next
        }

        guard let frontVal = frontNode?.val, let endVal = endNode?.val else { return head }

        frontNode?.val = endVal
        endNode?.val = frontVal

        return head
    }

}
