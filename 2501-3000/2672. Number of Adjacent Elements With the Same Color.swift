class Solution {

    // Solution by Sergey Leschev
    // 2672. Number of Adjacent Elements With the Same Color
    // Time complexity: O(n)
    // Space complexity: O(n)

    func colorTheArray(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var nums = [Int](repeating: 0, count: n)
        var c = 0
        var result = [Int]()

        for query in queries {
            let index = query[0]
            let color = query[1]

            let pre = index > 0 ? nums[index - 1] : 0
            let nex = index < n - 1 ? nums[index + 1] : 0

            if nums[index] != 0 && nums[index] == pre { c -= 1 }
            if nums[index] != 0 && nums[index] == nex { c -= 1 }

            nums[index] = color

            if nums[index] == pre { c += 1 }
            if nums[index] == nex { c += 1 }

            result.append(c)
        }

        return result
    }
}
