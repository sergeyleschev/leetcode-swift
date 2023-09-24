class Solution {

    // Solution by Sergey Leschev
    // 2866. Beautiful Towers II
    // Stack
    // O(n)

    func maximumSumOfHeights(_ maxHeights: [Int]) -> Int {
        let n = maxHeights.count

        var left = [Int](repeating: 0, count: n)
        var stack = [Int]()
        stack.append(-1)
        var res = 0
        var cur = 0

        for i in 0..<n {
            while stack.count > 1 && maxHeights[stack.last!] > maxHeights[i] {
                let j = stack.removeLast()
                cur -= (j - stack.last!) * maxHeights[j]
            }
            cur += (i - stack.last!) * maxHeights[i]
            stack.append(i)
            left[i] = cur
        }

        stack.removeAll()
        stack.append(n)
        cur = 0

        for i in stride(from: n - 1, through: 0, by: -1) {
            while stack.count > 1 && maxHeights[stack.last!] > maxHeights[i] {
                let j = stack.removeLast()
                cur -= -(j - stack.last!) * maxHeights[j]
            }
            cur += -(i - stack.last!) * maxHeights[i]
            stack.append(i)
            res = max(res, left[i] + cur - maxHeights[i])
        }

        return res
    }
}
