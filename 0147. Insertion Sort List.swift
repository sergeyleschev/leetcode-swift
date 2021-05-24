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

    // 147. Insertion Sort List
    // Given the head of a singly linked list, sort the list using insertion sort, and return the sorted list's head.

    // The steps of the insertion sort algorithm:
    // Insertion sort iterates, consuming one input element each repetition and growing a sorted output list.
    // At each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list and inserts it there.
    // It repeats until no input elements remain.
    // The following is a graphical example of the insertion sort algorithm. The partially sorted list (black) initially contains only the first element in the list. One element (red) is removed from the input data and inserted in-place into the sorted list with each iteration.

    // Sorts a linked list using insertion sort.

    // - Parameter head: Linked list head.
    // - Returns: Sorted linked list head.

    // Example 1:
    // Input: head = [4,2,1,3]
    // Output: [1,2,3,4]

    // Example 2:
    // Input: head = [-1,5,3,4,0]
    // Output: [-1,0,3,4,5]

    // Constraints:
    // The number of nodes in the list is in the range [1, 5000].
    // -5000 <= Node.val <= 5000

    // - Complexity:
    //   - time: O(n log n), where n is the number of nodes in the linked list.
    //   - space: O(n)
    
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var nodes: [ListNode] = []
        var curr = head
        
        while curr != nil {
            nodes.append(curr!)
            curr = curr?.next
        }
        
        nodes.sort(by: { $0.val < $1.val })
        
        var newHead: ListNode?
        var prev: ListNode?
        
        for node in nodes {
            if newHead == nil {
                newHead = node
            }
            
            prev?.next = node
            prev = node
        }
        
        prev?.next = nil
        return newHead
    }


    // - Complexity:
    //   - time: O(n^2), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.
    /*
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var curr = head
        var prevNode: ListNode?
        var nextNode: ListNode?

        while curr != nil {
            prevNode = dummy
            nextNode = dummy.next

            while nextNode != nil {
                guard
                    let currVal = curr?.val,
                    let nextVal = nextNode?.val,
                    currVal >= nextVal
                else { break }
                prevNode = nextNode
                nextNode = nextNode?.next
            }

            let tmp = curr?.next
            curr?.next = nextNode
            prevNode?.next = curr

            curr = tmp
        }

        return dummy.next
    }
    */

}