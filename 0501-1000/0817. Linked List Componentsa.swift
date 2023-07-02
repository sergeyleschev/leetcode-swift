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

    // 817. Linked List Components
    // We are given head, the head node of a linked list containing unique integer values.
    // We are also given the list nums, a subset of the values in the linked list.
    // Return the number of connected components in nums, where two values are connected if they appear consecutively in the linked list.

    // Example 1:
    // Input:
    // head: 0->1->2->3
    // nums = [0, 1, 3]
    // Output: 2
    // Explanation:
    // 0 and 1 are connected, so [0, 1] and [3] are the two connected components.

    // Example 2:
    // Input:
    // head: 0->1->2->3->4
    // nums = [0, 3, 1, 4]
    // Output: 2
    // Explanation:
    // 0 and 1 are connected, 3 and 4 are connected, so [0, 1] and [3, 4] are the two connected components.

    // Note:
    // If n is the length of the linked list given by head, 1 <= n <= 10000.
    // The value of each node in the linked list will be in the range [0, n - 1].
    // 1 <= nums.length <= 10000.
    // nums is a subset of all values in the linked list.

    func numComponents(_ head: ListNode?, _ G: [Int]) -> Int {
        var pre = head
        var g = Set(G)
        var ans = 0
        var flag = false

        while let node = pre {
            if !g.contains(node.val) {
                ans += flag ? 1 : 0
                flag = false
            } else {
                g.remove(node.val)
                flag = true
            }
            pre = pre?.next
        }

        return flag ? ans + 1 : ans
    }

}
