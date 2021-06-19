class Solution {

    // 771. Jewels and Stones
    // You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have. Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.
    // Letters are case sensitive, so "a" is considered a different type of stone from "A".

    // Return how many of your stones are also jewels.

    // - Parameters:
    //   - J: Representing the types of stones that are jewels.
    //   - S: Representing the stones you have.
    //
    // - Returns: How many of your stones are jewels.

    // Example 1:
    // Input: jewels = "aA", stones = "aAAbbbb"
    // Output: 3

    // Example 2:
    // Input: jewels = "z", stones = "ZZ"
    // Output: 0

    // Constraints:
    // 1 <= jewels.length, stones.length <= 50
    // jewels and stones consist of only English letters.
    // All the characters of jewels are unique.

    // - Complexity:
    //   - time: O(j + s), where j is the length of the J, and s is the length of the S.
    //   - space: O(j), where j is the length of the J.
    
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var jewels = Set<Character>()
        for jewel in J { jewels.insert(jewel) }

        var ans = 0
        for stone in S {
            guard jewels.contains(stone) else { continue }
            ans += 1
        }

        return ans
    }

}