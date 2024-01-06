class Solution {

    // Solution by Sergey Leschev
    // 2937. Make Three Strings Equal

    func findMinimumOperations(_ s1: String, _ s2: String, _ s3: String) -> Int {
        var i = 0
        let sz = min(s1.count, s2.count, s3.count)

        while i < sz
            && s1[s1.index(s1.startIndex, offsetBy: i)] == s2[s2.index(s2.startIndex, offsetBy: i)]
            && s2[s2.index(s2.startIndex, offsetBy: i)] == s3[s3.index(s3.startIndex, offsetBy: i)]
        {
            i += 1
        }

        return i == 0 ? -1 : s1.count + s2.count + s3.count - i * 3
    }
}
