class Solution {

    // Solution by Sergey Leschev
    // 2948. Make Lexicographically Smallest Array by Swapping Elements

    func lexicographicallySmallestArray(_ nums: [Int], _ limit: Int) -> [Int] {
        var nums = nums  // Declare nums as a variable
        var b: [(Int, Int)] = []
        let n = nums.count

        for i in 0..<n {
            b.append((nums[i], i))
        }

        b.sort { $0.0 < $1.0 }
        var c: [[(Int, Int)]] = [b[0...0].map { $0 }]

        for i in 1..<n {
            if b[i].0 - b[i - 1].0 <= limit {
                c[c.count - 1].append(b[i])
            } else {
                c.append([b[i]])
            }
        }

        for t in c {
            var ind: [Int] = []
            for p in t {
                ind.append(p.1)
            }
            ind.sort()

            for i in 0..<ind.count {
                nums[ind[i]] = t[i].0
            }
        }

        return nums
    }
}
