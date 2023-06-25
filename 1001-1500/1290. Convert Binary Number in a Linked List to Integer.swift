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

    // 1290. Convert Binary Number in a Linked List to Integer
    // Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number.
    // Return the decimal value of the number in the linked list.

    // Converts the binary number in the linked list in decimal representation.
    // - Parameter head: Linked list head.
    // - Returns: The decimal value of the number in the linked list.

    // Example 1:
    // Input: head = [1,0,1]
    // Output: 5
    // Explanation: (101) in base 2 = (5) in base 10

    // Example 2:
    // Input: head = [0]
    // Output: 0

    // Example 3:
    // Input: head = [1]
    // Output: 1

    // Example 4:
    // Input: head = [1,0,0,1,0,0,1,1,1,0,0,0,0,0,0]
    // Output: 18880

    // Example 5:
    // Input: head = [0,0]
    // Output: 0

    // Constraints:
    // The Linked List is not empty.
    // Number of nodes will not exceed 30.
    // Each node's value is either 0 or 1.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.
    
    func getDecimalValue(_ head: ListNode?) -> Int {
        var ans = 0
        var cur = head

        while let node = cur {
            ans = ans * 2 + node.val
            cur = node.next
        }

        return ans
    }

}