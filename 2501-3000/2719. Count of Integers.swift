class Solution {

    // Solution by Sergey Leschev
    // 2719. Count of Integers

    let mod = 1_000_000_007
    
    func count(_ num1: String, _ num2: String, _ min_sum: Int, _ max_sum: Int) -> Int {
        let mn = min_sum
        let mx = max_sum
        
        var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2), count: 500), count: 23)
        
        func rec(_ s1: [Character], _ ind: Int, _ num: Int, _ smaller: Bool) -> Int {
            if ind == s1.count {
                if num >= mn && num <= mx {
                    return 1
                }
                return 0
            }
            
            if dp[ind][num][smaller ? 1 : 0] != -1 {
                return dp[ind][num][smaller ? 1 : 0]
            }
            
            var ans = 0
            
            ans = (ans + rec(s1, ind+1, num + 0, smaller || (s1[ind] != "0")))%mod
            
            if smaller {
                for i in 1...9 {
                    ans = (ans + rec(s1, ind+1, num + i, smaller))%mod
                }
            } else {
                let diff = Int(String(s1[ind]))!
                if diff > 0 {
                    for i in 1..<diff {
                        ans = (ans + rec(s1, ind+1, num + i, true))%mod
                    }
                }
                if s1[ind] != "0" {
                    ans = (ans + rec(s1, ind+1, num + diff, false))%mod
                }
            }
            
            dp[ind][num][smaller ? 1 : 0] = ans
            return ans
        }
        
        func check(_ num: String) -> Int {
            var ans = 0
            for ch in num {
                ans += Int(String(ch))!
            }
            
            if ans >= mn && ans <= mx {
                return 1
            }
            return 0
        }
        
        let a = rec(Array(num2), 0, 0, false)
        
        dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2), count: 500), count: 23)
        let b = rec(Array(num1), 0, 0, false)
        
        return (a - b + check(num1) + mod) % mod
    }
}
