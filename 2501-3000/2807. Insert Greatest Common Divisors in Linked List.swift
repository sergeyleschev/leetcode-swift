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
    // 2807. Insert Greatest Common Divisors in Linked List

    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        var ptr = head

        while ptr?.next != nil {
            let gcdValue = gcd(ptr!.val, ptr!.next!.val)
            let newNode = ListNode(gcdValue, ptr!.next)
            ptr!.next = newNode
            ptr = newNode.next
        }

        return head
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        } else {
            return gcd(b, a % b)
        }
    }
}
