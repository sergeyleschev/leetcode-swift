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

    // 725. Split Linked List in Parts
    // Given the head of a singly linked list and an integer k, split the linked list into k consecutive linked list parts.
    // The length of each part should be as equal as possible: no two parts should have a size differing by more than one. This may lead to some parts being null.
    // The parts should be in the order of occurrence in the input list, and parts occurring earlier should always have a size greater than or equal to parts occurring later.
    // Return an array of the k parts.

    // Example 1:
    // Input: head = [1,2,3], k = 5
    // Output: [[1],[2],[3],[],[]]
    // Explanation:
    // The first element output[0] has output[0].val = 1, output[0].next = null.
    // The last element output[4] is null, but its string representation as a ListNode is [].

    // Example 2:
    // Input: head = [1,2,3,4,5,6,7,8,9,10], k = 3
    // Output: [[1,2,3,4],[5,6,7],[8,9,10]]
    // Explanation:
    // The input has been split into consecutive parts with size difference at most 1, and earlier parts are a larger size than the later parts.

    // Constraints:
    // The number of nodes in the list is in the range [0, 1000].
    // 0 <= Node.val <= 1000
    // 1 <= k <= 50

    func splitListToParts(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        let counts = findListLength(length: findlength(root: root))
        var list = root
        var ans = [ListNode?]()

        
        func findlength(root: ListNode?) -> Int {
            var list = root
            var length = 0
            while list != nil {
                length += 1
                list = list?.next
            }
            return length
        }
        
        
        func findListLength(length: Int) -> [Int] {
            let num = length / k
            let r = length % k
            let counts: [Int]
            if r > 0 && r < length { counts = Array(repeating: num + 1, count: r) + Array(repeating: num, count: k - r) } 
            else if r == length { counts = Array(repeating: 1, count: length) + Array(repeating: -1, count: k - length) } 
            else { counts = Array(repeating: num, count: k) }
            return counts
        }
        
        
        for count in counts {
            var node = list
            if count == -1 { ans.append(nil); continue }
            for _ in 0..<count - 1 { node = node?.next }            
            ans.append(list)
            list = node?.next
            node?.next = nil
        }
        
        return ans
    }

}