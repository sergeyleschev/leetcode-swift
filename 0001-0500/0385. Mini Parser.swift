/// // This is the interface that allows for creating nested lists.
/// // You should not implement it, or speculate about its implementation
/// class NestedInteger {
///     // Return true if this NestedInteger holds a single integer, rather than a nested list.
///     public func isInteger() -> Bool
///
///     // Return the single integer that this NestedInteger holds, if it holds a single integer
///     // The result is undefined if this NestedInteger holds a nested list
///     public func getInteger() -> Int
///
///     // Set this NestedInteger to hold a single integer.
///     public func setInteger(value: Int)
///
///     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
///     public func add(elem: NestedInteger)
///
///     // Return the nested list that this NestedInteger holds, if it holds a nested list
///     // The result is undefined if this NestedInteger holds a single integer
///     public func getList() -> [NestedInteger]
/// }
class Solution {

    // Solution by Sergey Leschev

    // 385. Mini Parser
    // Given a string s represents the serialization of a nested list, implement a parser to deserialize it and return the deserialized NestedInteger.
    // Each element is either an integer or a list whose elements may also be integers or other lists.

    // Example 1:
    // Input: s = "324"
    // Output: 324
    // Explanation: You should return a NestedInteger object which contains a single integer 324.

    // Example 2:
    // Input: s = "[123,[456,[789]]]"
    // Output: [123,[456,[789]]]
    // Explanation: Return a NestedInteger object containing a nested list with 2 elements:
    // 1. An integer containing value 123.
    // 2. A nested list containing two elements:
    //     i.  An integer containing value 456.
    //     ii. A nested list with one element:
    //          a. An integer containing value 789

    // Constraints:
    // 1 <= s.length <= 5 * 10^4
    // s consists of digits, square brackets "[]", negative sign '-', and commas ','.
    // s is the serialization of valid NestedInteger.

    func deserialize(_ s: String) -> NestedInteger {
        var stack = [NestedInteger]()
        let nestedInteger = NestedInteger()
        var value: Int? = nil
        var symbol = 1

        for char in s {
            let num = Int(String(char)) ?? -1
            if num >= 0 && num <= 9 {
                value = 10 * (value ?? 0) + num
            } else if char == "-" {
                symbol = -1
            } else if char == "[" {
                stack.append(NestedInteger())
            } else {

                if value != nil {
                    let nestedInteger = NestedInteger()
                    nestedInteger.setInteger(value! * symbol)
                    stack.last?.add(nestedInteger)
                    symbol = 1
                    value = nil
                }

                if char == "]" {
                    let last = stack.removeLast()
                    if stack.isEmpty {
                        return last
                    } else {
                        stack.last?.add(last)
                    }
                }
            }
        }

        nestedInteger.setInteger((value ?? 0) * symbol)
        return nestedInteger
    }

}
