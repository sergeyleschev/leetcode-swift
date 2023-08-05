class Solution {

    // Solution by Sergey Leschev
    // 2745. Construct the Longest New String
    // O(1)

    func longestString(_ x: Int, _ y: Int, _ z: Int) -> Int {
        let mn = min(x, y)
        if x == y {
            return (4 * x + z * 2)
        } else {
            return (2 * mn + (mn + 1) * 2 + z * 2)
        }
    }
}
