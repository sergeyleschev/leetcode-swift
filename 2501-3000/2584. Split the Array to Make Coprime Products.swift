class Solution {

    // Solution by Sergey Leschev
    // 2584. Split the Array to Make Coprime Products

    func findValidSplit(_ nums: [Int]) -> Int {
        func factorize(_ n: Int) -> [Int] {
            var res = [Int]()
            var num = n
            for i in 2..<(1000 + 1) where num > 1 && i < 1000 {
                if num % i == 0 {
                    res.append(i)
                    while num % i == 0 {
                        num /= i
                    }
                }
            }
            if num > 1 {
                res.append(num)
            }
            return res
        }

        var fi = [Int: Int]()
        var line = Array(repeating: 0, count: 10001)

        for i in 0..<nums.count {
            let factors = factorize(nums[i])
            for f in factors {
                if fi[f] == nil {
                    fi[f] = i
                }
                line[fi[f]!] += 1
                line[i] -= 1
            }
        }

        for i in 1..<line.count {
            line[i] += line[i - 1]
        }

        if let index = line.firstIndex(of: 0) {
            return index < nums.count - 1 ? index : -1
        }

        return -1
    }
}
