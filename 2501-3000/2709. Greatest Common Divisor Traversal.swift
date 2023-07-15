class Solution {

    // Solution by Sergey Leschev
    // 2709. Greatest Common Divisor Traversal

    func getf(_ f: inout [Int], _ x: Int) -> Int {
        if f[x] == x {
            return x
        } else {
            f[x] = getf(&f, f[x])
            return f[x]
        }
    }
    
    func merge(_ f: inout [Int], _ num: inout [Int], _ x: Int, _ y: Int) {
        var x = getf(&f, x)
        var y = getf(&f, y)
        if x == y {
            return
        }
        if num[x] < num[y] {
            swap(&x, &y)
        }
        f[y] = x
        num[x] += num[y]
    }
    
    func canTraverseAllPairs(_ nums: [Int]) -> Bool {
        let n = nums.count
        if n == 1 {
            return true
        }
        
        var f = Array(repeating: 0, count: n)
        var num = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            f[i] = i
            num[i] = 1
        }
        
        var have = [Int: Int]()
        
        for i in 0..<n {
            var x = nums[i]
            if x == 1 {
                return false
            }
            var d = 2
            while d * d <= x {
                if x % d == 0 {
                    if let value = have[d] {
                        merge(&f, &num, i, value)
                    } else {
                        have[d] = i
                    }
                    while x % d == 0 {
                        x /= d
                    }
                }
                d += 1
            }
            
            if x > 1 {
                if let value = have[x] {
                    merge(&f, &num, i, value)
                } else {
                    have[x] = i
                }
            }
        }
        
        return num[getf(&f, 0)] == n
    }
}
