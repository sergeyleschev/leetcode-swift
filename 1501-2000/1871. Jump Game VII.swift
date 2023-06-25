class Solution {

    // Solution @ Sergey Leschev

    // 1871. Jump Game VII
    // You are given a 0-indexed binary string s and two integers minJump and maxJump. In the beginning, you are standing at index 0, which is equal to '0'. You can move from index i to index j if the following conditions are fulfilled:
    // i + minJump <= j <= min(i + maxJump, s.length - 1), and
    // s[j] == '0'.
    // Return true if you can reach index s.length - 1 in s, or false otherwise.

    // Example 1:
    // Input: s = "011010", minJump = 2, maxJump = 3
    // Output: true
    // Explanation:
    // In the first step, move from index 0 to index 3. 
    // In the second step, move from index 3 to index 5.

    // Example 2:
    // Input: s = "01101110", minJump = 2, maxJump = 3
    // Output: false

    // Constraints:
    // 2 <= s.length <= 10^5
    // s[i] is either '0' or '1'.
    // s[0] == '0'
    // 1 <= minJump <= maxJump < s.length

    func canReach(_ s: String, _ minJump: Int, _ maxJump: Int) -> Bool {
        let chars = [Character](s)
        let length = s.count
        guard chars[length - 1] == "0" else { return false }
        let target = length - 1
        var queue = [0]
        var l = -1
        var r = -1

        while !queue.isEmpty {
            var nextLevel = [Int]()
            for idx in queue {
                l = max(r, idx + minJump)
                r = max(r, min(length - 1, idx + maxJump))
                if target >= l && target <= r { return true }
                if l <= r {
                    for i in l...r where chars[i] == "0" { nextLevel.append(i) }
                }
                
            }
            queue = nextLevel
        }
        return false
    }
    
}