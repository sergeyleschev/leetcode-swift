/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 142. Linked List Cycle II
    // Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
    // There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
    // Notice that you should not modify the linked list.

    // Finds the node where the cycle begins.

    // - Parameter head: Linked list head.
    // - Returns: The node where the cycle begins, if the cycle doesn't exist returns nil.

    // Example 1:
    // Input: head = [3,2,0,-4], pos = 1
    // Output: tail connects to node index 1
    // Explanation: There is a cycle in the linked list, where tail connects to the second node.

    // Example 2:
    // Input: head = [1,2], pos = 0
    // Output: tail connects to node index 0
    // Explanation: There is a cycle in the linked list, where tail connects to the first node.

    // Example 3:
    // Input: head = [1], pos = -1
    // Output: no cycle
    // Explanation: There is no cycle in the linked list.

    // Constraints:
    // The number of the nodes in the list is in the range [0, 10^4].
    // -10^5 <= Node.val <= 10^5
    // pos is -1 or a valid index in the linked-list.

    // Follow up: Can you solve it using O(1) (i.e. constant) memory?

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return nil }
        var slow = head
        var fast = head

        while slow?.next != nil || fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            guard slow !== fast else { break }
        }

        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }

        return slow
    }

}