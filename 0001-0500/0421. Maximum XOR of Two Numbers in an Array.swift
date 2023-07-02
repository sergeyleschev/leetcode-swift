class Solution {

    // Solution by Sergey Leschev

    // 421. Maximum XOR of Two Numbers in an Array
    // Given an integer array nums, return the maximum result of nums[i] XOR nums[j], where 0 <= i ≤ j < n.
    // Follow up: Could you do this in O(n) runtime?

    // Finds the maximum XOR of two numbers in a given array.

    // - Parameter nums: A non-empty array of numbers.
    // - Returns: The maximum XOR of two numbers.

    // Example 1:
    // Input: nums = [3,10,5,25,2,8]
    // Output: 28
    // Explanation: The maximum result is 5 XOR 25 = 28.

    // Example 2:
    // Input: nums = [0]
    // Output: 0

    // Example 3:
    // Input: nums = [2,4]
    // Output: 6

    // Example 4:
    // Input: nums = [8,10,2]
    // Output: 10

    // Example 5:
    // Input: nums = [14,70,53,83,49,91,36,80,92,51,66,70]
    // Output: 127

    // Constraints:
    // 1 <= nums.length <= 2 * 10^4
    // 0 <= nums[i] <= 2^31 - 1

    // - Complexity:
    //   - time: O(n), where n is the length of `nums`.
    //   - space: O(n), where n is the length of `nums`.

    func findMaximumXOR(_ nums: [Int]) -> Int {
        guard let maxNum = nums.max() else { return 0 }
        let L = String(maxNum, radix: 2).count
        let n = nums.count
        let bitmask = 1 << L
        var strNums = [String](repeating: "", count: n)
        let trie = TrieNode()
        var ans = 0

        for (i, num) in nums.enumerated() {
            var str = String(bitmask | num, radix: 2)
            str.removeFirst()
            strNums[i] = str
        }

        for num in strNums {
            var node = trie
            var xorNode: TrieNode? = trie
            var currXor = 0

            for bit in num {
                if let child = node.children[bit] {
                    node = child
                } else {
                    let newNode = TrieNode()
                    node.children[bit] = newNode
                    node = newNode
                }

                let toggledBit: Character = bit == "1" ? "0" : "1"
                if let xNode = xorNode?.children[toggledBit] {
                    currXor = (currXor << 1) | 1
                    xorNode = xNode
                } else {
                    currXor = currXor << 1
                    xorNode = xorNode?.children[bit]
                }
            }

            ans = max(ans, currXor)
        }

        return ans
    }

}

final class TrieNode {
    var children: [Character: TrieNode]

    init() {
        children = [Character: TrieNode]()
    }

}
