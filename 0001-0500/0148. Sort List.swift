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

    // 148. Sort List
    // Given the head of a linked list, return the list after sorting it in ascending order.
    // Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?

    // Sorts linked list in ascending order.

    // - Parameter head: Head of the linked list.
    // - Returns: Head of the linked list after sorting.

    // Example 1:
    // Input: head = [4,2,1,3]
    // Output: [1,2,3,4]

    // Example 2:
    // Input: head = [-1,5,3,4,0]
    // Output: [-1,0,3,4,5]

    // Example 3:
    // Input: head = []
    // Output: []

    // Constraints:
    // The number of nodes in the list is in the range [0, 5 * 10^4].
    // -10^5 <= Node.val <= 10^5

    // - Complexity:
    //   - time: O(n log(n)), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.

    private var tail = ListNode(-1)
    private var nextSublist: ListNode? = ListNode(-1)


    func sortList(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }

        var start = head
        let dummy = ListNode(-1)

        var size = 1
        let n = getCount(head)

        while size < n {
            tail = dummy
            while start != nil {
                guard start?.next != nil else {
                    tail.next = start
                    break
                }

                var mid = split(start, size)
                merge(&start, &mid)
                start = nextSublist
            }
            start = dummy.next

            size *= 2
        }

        return dummy.next
    }


    private func split(_ start: ListNode?, _ size: Int) -> ListNode? {
        var start = start
        var end = start?.next

        for _ in 1..<size {
            if let endNext = end?.next { end = endNext.next ?? endNext }
            if let startNext = start?.next { start = startNext }
        }
        let mid = start?.next
        start?.next = nil
        nextSublist = end?.next
        end?.next = nil

        return mid
    }


    private func merge(_ list1: inout ListNode?, _ list2: inout ListNode?) {
        let dummy = ListNode(-1)
        var newTail: ListNode? = dummy

        while let list1Val = list1?.val, let list2Val = list2?.val {
            if list1Val < list2Val {
                newTail?.next = list1
                list1 = list1?.next
            } else {
                newTail?.next = list2
                list2 = list2?.next
            }
            newTail = newTail?.next
        }
        newTail?.next = list1 != nil ? list1 : list2
        while newTail?.next != nil { newTail = newTail?.next }

        tail.next = dummy.next
        if let newTail = newTail { tail = newTail }
    }


    private func getCount(_ head: ListNode?) -> Int {
        var count = 0
        var cur = head

        while cur != nil {
            cur = cur?.next
            count += 1
        }

        return count
    }

}