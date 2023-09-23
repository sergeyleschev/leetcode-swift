class Solution {

    // Solution by Sergey Leschev
    // 2861. Maximum Number of Alloys

    // Time complexity: O(log(1e9) * n * k), where n is the number of compositions, and k is the average number of elements in each composition.
    // Space complexity: O(1) as no extra space is used.

    func maxNumberOfAlloys(
        _ n: Int, _ k: Int, _ budget: Int, _ composition: [[Int]], _ stock: [Int], _ cost: [Int]
    ) -> Int {
        func canProduceAlloys(
            _ mid: Int, _ budget: Int, _ composition: [[Int]], _ stock: [Int], _ cost: [Int]
        ) -> Bool {
            var minCost = Int.max
            for i in 0..<composition.count {
                var currCost = 0
                for j in 0..<composition[i].count {
                    let curr = mid * composition[i][j]
                    if stock[j] >= curr {
                        continue
                    } else {
                        let extra = (curr - stock[j]) * cost[j]
                        currCost += extra
                    }
                }
                minCost = min(currCost, minCost)
            }
            return minCost <= budget
        }

        var low = 0
        var high = Int(1e9)
        var ans = 0
        while low <= high {
            let mid = low + (high - low) / 2
            if canProduceAlloys(mid, budget, composition, stock, cost) {
                ans = mid
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return ans
    }
}
