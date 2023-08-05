class Solution {

    // Solution by Sergey Leschev
    // 2525. Categorize Box According to Criteria

    func categorizeBox(_ length: Int, _ width: Int, _ height: Int, _ mass: Int) -> String {
        let volume = Int64(length) * Int64(width) * Int64(height)
        var isBulky = false
        var isHeavy = false

        if length >= 10000 || width >= 10000 || height >= 10000 || volume >= 1_000_000_000 {
            isBulky = true
        }

        if mass >= 100 {
            isHeavy = true
        }

        if isBulky && isHeavy {
            return "Both"
        } else if !isBulky && !isHeavy {
            return "Neither"
        } else if isHeavy {
            return "Heavy"
        } else {
            return "Bulky"
        }
    }
}
