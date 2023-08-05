class Solution {

    // Solution by Sergey Leschev
    // 2522. Partition String Into Substrings With Values at Most K

    func minimumPartition(_ s: String, _ k: Int) -> Int {
        var n: Int64 = 0
        var res: Int = 1
        for char in s {
            let digit = Int64(String(char))!
            n = n * 10 + digit
            if n > Int64(k) {
                res += 1
                n = digit
            }
            if n > Int64(k) {
                return -1
            }
        }
        return res
    }
}
