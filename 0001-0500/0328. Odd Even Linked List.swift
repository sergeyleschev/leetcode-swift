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

    // 328. Odd Even Linked List
    // Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.
    // The first node is considered odd, and the second node is even, and so on.
    // Note that the relative order inside both the even and odd groups should remain as it was in the input.

    // Example 1:
    // Input: head = [1,2,3,4,5]
    // Output: [1,3,5,2,4]

    // Example 2:
    // Input: head = [2,1,3,5,6,4,7]
    // Output: [2,3,6,7,1,5,4]

    // Constraints:
    // The number of nodes in the linked list is in the range [0, 10^4].
    // -10^6 <= Node.val <= 10^6

    // Follow up: Could you solve it in O(1) space complexity and O(nodes) time complexity?

    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var list = head
        var oddArr = [Int]()
        var evenArr = [Int]()
        var count = 1
        
        while list != nil {
            if count % 2 == 1 {
                oddArr.append((list?.val)!)
            } else {
                evenArr.append((list?.val)!)
            }
            list = list?.next
            count += 1
        }

        list = head
        var index = 0
        let oddCount = oddArr.count
        
        while list != nil {
            if index < oddCount {
                list?.val = oddArr[index]
            } else {
                list?.val = evenArr[index - oddCount]
            }
            index += 1
            list = list?.next
            
        }
        
        return head
    }
    
}