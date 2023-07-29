class Solution {

    // Solution by Sergey Leschev
    // 2683. Neighboring Bitwise XOR
    // Time Complexity: O(n)
    // Space Complexity: O(1)

    func doesValidArrayExist(_ derived: [Int]) -> Bool {
        let sum = derived.reduce(0, +)
        return sum % 2 == 0
    }
}
