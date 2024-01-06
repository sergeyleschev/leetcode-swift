class Solution {

    // Solution by Sergey Leschev
    // 2935. Maximum Strong Pair XOR II

    class TrieNode {
        var children: [TrieNode?] = [nil, nil]
        var count: Int = 0
    }

    class Trie {
        var root: TrieNode

        init() {
            root = TrieNode()
        }

        func insert(_ value: Int) {
            traverseAndApply(value, increment: 1)
        }

        func delete(_ value: Int) {
            traverseAndApply(value, increment: -1)
        }

        func traverseAndApply(_ value: Int, increment: Int) {
            let bitString = convert(value)
            var currNode = root

            for bit in bitString {
                let bitInt = Int(String(bit))!

                if currNode.children[bitInt] == nil {
                    currNode.children[bitInt] = TrieNode()
                }

                currNode = currNode.children[bitInt]!
                currNode.count += increment
            }
        }

        func findMax(_ value: Int) -> Int {
            let bitString = convert(value)
            var currNode = root
            var result = 0

            for bit in bitString {
                let bitInt = Int(String(bit))!
                let complement = currNode.children[1 - bitInt]

                if complement != nil && complement!.count > 0 {
                    currNode = complement!
                    result = 2 * result + 1
                } else if currNode.children[bitInt] != nil && currNode.children[bitInt]!.count > 0 {
                    currNode = currNode.children[bitInt]!
                    result = 2 * result
                }
            }

            return result
        }

        func convert(_ value: Int) -> String {
            var bitString = String(value, radix: 2)
            while bitString.count < 20 {
                bitString = "0" + bitString
            }
            return bitString
        }
    }

    func maximumStrongPairXor(_ nums: [Int]) -> Int {
        var nums = nums
        nums.sort()
        var i = 0
        var j = 0
        var result = 0
        let trie = Trie()

        for j in 0..<nums.count {
            trie.insert(nums[j])

            while i < j && nums[j] - nums[i] > nums[i] {
                trie.delete(nums[i])
                i += 1
            }

            result = max(result, trie.findMax(nums[j]))
        }

        return result
    }
}
