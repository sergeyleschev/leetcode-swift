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

    // Solution @ Sergey Leschev, Belarusian State University

    // 1669. Merge In Between Linked Lists
    // You are given two linked lists: list1 and list2 of sizes n and m respectively.
    // Remove list1's nodes from the ath node to the bth node, and put list2 in their place.
    // The blue edges and nodes in the following figure incidate the result:
    // Build the result list and return its head.

    // Example 1:
    // Input: list1 = [0,1,2,3,4,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]
    // Output: [0,1,2,1000000,1000001,1000002,5]
    // Explanation: We remove the nodes 3 and 4 and put the entire list2 in their place. The blue edges and nodes in the above figure indicate the result.

    // Example 2:
    // Input: list1 = [0,1,2,3,4,5,6], a = 2, b = 5, list2 = [1000000,1000001,1000002,1000003,1000004]
    // Output: [0,1,1000000,1000001,1000002,1000003,1000004,6]
    // Explanation: The blue edges and nodes in the above figure indicate the result.

    // Constraints:
    // 3 <= list1.length <= 10^4
    // 1 <= a <= b < list1.length - 1
    // 1 <= list2.length <= 10^4

    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var cnt = -1
        var node = list1
        var aNodePre: ListNode? = nil
        var bNodeNext: ListNode? = nil
        let list1Head: ListNode? = ListNode()
        var temp = list1Head
        
        list1Head?.next = list1

        while let n = node, cnt <= b {
            cnt += 1
            if cnt == a { aNodePre = temp }
            if cnt == b { bNodeNext = node?.next }
            node = n.next
            temp = temp?.next
        }
        var list2Tail = list2
        while let n = list2Tail?.next { list2Tail = n }
        aNodePre?.next = list2
        list2Tail?.next = bNodeNext
        return list1Head?.next
    }

}