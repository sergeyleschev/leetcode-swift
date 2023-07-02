/// Definition for a Node.
/// public class Node {
///     public var val: Int
///     public var prev: Node?
///     public var next: Node?
///     public var child: Node?
///     public init(_ val: Int) {
///         self.val = val
///         self.prev = nil
///         self.next = nil
///         self.child  = nil
///     }
/// }

class Solution {

    // Solution by Sergey Leschev

    // 430. Flatten a Multilevel Doubly Linked List
    // You are given a doubly linked list which in addition to the next and previous pointers, it could have a child pointer, which may or may not point to a separate doubly linked list. These child lists may have one or more children of their own, and so on, to produce a multilevel data structure, as shown in the example below.
    // Flatten the list so that all the nodes appear in a single-level, doubly linked list. You are given the head of the first level of the list.

    // Flattens the list so that all the nodes appear in a single-level, doubly linked list.

    // - Parameter head: Multilevel doubly linked list head.
    // - Returns: Single-level doubly linked list head.

    // Example 1:
    // Input: head = [1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
    // Output: [1,2,3,7,8,11,12,9,10,4,5,6]
    // Explanation:
    // The multilevel linked list in the input is as follows:

    // Example 2:
    // Input: head = [1,2,null,3]
    // Output: [1,3,2]
    // Explanation:
    // The input multilevel linked list is as follows:
    //   1---2---NULL
    //   |
    //   3---NULL

    // Example 3:
    // Input: head = []
    // Output: []

    // How multilevel linked list is represented in test case:
    // We use the multilevel linked list from Example 1 above:
    //  1---2---3---4---5---6--NULL
    //          |
    //          7---8---9---10--NULL
    //              |
    //              11--12--NULL
    // The serialization of each level is as follows:
    // [1,2,3,4,5,6,null]
    // [7,8,9,10,null]
    // [11,12,null]
    // To serialize all levels together we will add nulls in each level to signify no node connects to the upper node of the previous level. The serialization becomes:
    // [1,2,3,4,5,6,null]
    // [null,null,7,8,9,10,null]
    // [null,11,12,null]
    // Merging the serialization of each level and removing trailing nulls we obtain:
    // [1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]

    // - Complexity:
    //   - time: O(n), where n is the number of elements in multilevel linked list.
    //   - space: O(1), only constant space is used.

    func flatten(_ head: Node?) -> Node? {
        let dummy = Node(-1)
        dummy.next = head
        var cur = dummy.next

        while cur != nil {
            if cur?.child == nil {
                cur = cur?.next
                continue
            }

            var tmp = cur?.child

            while tmp?.next != nil { tmp = tmp?.next }

            tmp?.next = cur?.next
            cur?.next?.prev = tmp

            cur?.next = cur?.child
            cur?.child?.prev = cur
            cur?.child = nil
        }

        return dummy.next
    }

}
