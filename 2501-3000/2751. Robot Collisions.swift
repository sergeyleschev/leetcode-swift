class Solution {

    // Solution by Sergey Leschev
    // 2751. Robot Collisions

    func performOperations(_ h: inout [Int], _ st: inout [Int], _ i: Int) {
        while !st.isEmpty {
            let top = st.removeLast()
            if h[top] > h[i] {
                h[top] -= 1
                h[i] = 0
                st.append(top)
                return
            } else if h[top] == h[i] {
                h[i] = 0
                h[top] = 0
                return
            } else {
                h[i] -= 1
                h[top] = 0
            }
        }
    }
    
    func survivedRobotsHealths(_ positions: [Int], _ healths: [Int], _ directions: String) -> [Int] {
        var v = positions
        var h = healths
        var s = Array(directions) // Convert string to character array
        
        var st = [Int]()
        let n = v.count
        var idx = Array(0..<n)
        idx.sort { v[$0] < v[$1] }
        
        for j in 0..<n {
            let i = idx[j]
            if s[i] == Character("L") && st.isEmpty {
                continue
            } else if s[i] == Character("R") {
                st.append(i)
            } else {
                performOperations(&h, &st, i)
            }
        }
        
        var ans = [Int]()
        for x in h {
            if x != 0 {
                ans.append(x)
            }
        }
        
        return ans
    }
}
