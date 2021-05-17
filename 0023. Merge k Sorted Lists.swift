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

    // 23. Merge k Sorted Lists
    // You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
    // Merge all the linked-lists into one sorted linked-list and return it.

    // - Parameter lists: An array of linked-lists.
    // - Returns: One sorted linked-list.

    // Example 1:
    // Input: lists = [[1,4,5],[1,3,4],[2,6]]
    // Output: [1,1,2,3,4,4,5,6]
    // Explanation: The linked-lists are:
    // [
    //   1->4->5,
    //   1->3->4,
    //   2->6
    // ]
    // merging them into one sorted list:
    // 1->1->2->3->4->4->5->6

    // Example 2:
    // Input: lists = []
    // Output: []

    // Example 3:
    // Input: lists = [[]]
    // Output: []

    // Constraints:
    // k == lists.length
    // 0 <= k <= 10^4
    // 0 <= lists[i].length <= 500
    // -10^4 <= lists[i][j] <= 10^4
    // lists[i] is sorted in ascending order.
    // The sum of lists[i].length won't exceed 10^4.

    // - Complexity:
    //   - time: O(n log(k)), where n is the total number of nodes in two linked
    //     lists, and k is the number of linked lists.
    //   - space: O(k), where k is the number of linked l43q   QAists.
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        let n = lists.count
        var lists = lists
        var interval = 1
        
        while interval < n {
            var i = 0
            while i + interval < n {
                lists[i] = mergeTwoLists(lists[i], lists[i + interval])
                i += interval * 2
            }
            interval *= 2
        }
        
        return lists[0]
    }
    
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var cur: ListNode? = dummy
        var l1 = l1
        var l2 = l2
        
        while l1 != nil || l2 != nil {
            if let l1Val = l1?.val, let l2Val = l2?.val {
                if l1Val < l2Val {
                    cur?.next = l1
                    l1 = l1?.next
                } else {
                    cur?.next = l2
                    l2 = l2?.next
                }
                
            } else if l1 != nil {
                cur?.next = l1
                l1 = l1?.next
            } else if l2 != nil {
                cur?.next = l2
                l2 = l2?.next
            }

            cur = cur?.next
        }
        
        return dummy.next
    }

}