class Solution {

    // 1054. Distant Barcodes
    // In a warehouse, there is a row of barcodes, where the ith barcode is barcodes[i].
    // Rearrange the barcodes so that no two adjacent barcodes are equal. You may return any answer, and it is guaranteed an answer exists.

    // Example 1:
    // Input: barcodes = [1,1,1,2,2,2]
    // Output: [2,1,2,1,2,1]

    // Example 2:
    // Input: barcodes = [1,1,1,1,2,2,3,3]
    // Output: [1,3,1,3,1,2,1,2]

    // Constraints:
    // 1 <= barcodes.length <= 10000
    // 1 <= barcodes[i] <= 10000

    func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
        var dict: [Int: Int] = [:]
        var i = 0
        for barcode in barcodes { dict[barcode, default: 0] += 1 }
        var ans = Array(repeating: 0, count: barcodes.count)
        let sortKeys = dict.keys.sorted { dict[$0]! > dict[$1]! }
        
        for k in sortKeys {
            for _ in 0..<dict[k]! {
                ans[i] = k
                i += 2
                if i >= barcodes.count { i = 1 }
            }
        }
        
        return ans
    }

}