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

    // 86. Partition List
    // Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
    // You should preserve the original relative order of the nodes in each of the two partitions.

    // Example 1:
    // Input: head = [1,4,3,2,5,2], x = 3
    // Output: [1,2,2,4,3,5]

    // Example 2:
    // Input: head = [2,1], x = 2
    // Output: [1,2]
     
    // Constraints:
    // The number of nodes in the list is in the range [0, 200].
    // -100 <= Node.val <= 100
    // -200 <= x <= 200

    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var current = head
        var left_nodes: [ListNode?] = []
        var right_nodes: [ListNode?] = []
        var head: ListNode?
        var prev: ListNode?
        
        while current != nil {
            if current!.val < x {
                left_nodes.append(current)
            } else {
                right_nodes.append(current)
            }
            
            current = current?.next
        }
        
        for node in left_nodes + right_nodes {
            node?.next = nil
            
            if head == nil {
                head = node
            } else {
                prev?.next = node
            }
            
            prev = node
        }
        
        return head
    }

}