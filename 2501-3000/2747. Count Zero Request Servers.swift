class Solution {

    // Solution by Sergey Leschev
    // 2747. Count Zero Request Servers
    // Sliding Window

    // Time complexity: O(n logn + m logm)
    // Space complexity: O(n + m)

    func countServers(_ n: Int, _ logs: [[Int]], _ x: Int, _ queries: [Int]) -> [Int] {
        var vp = [(Int, Int)]()
        for log in logs {
            vp.append((log[1], log[0]))  // time, server_id
        }
        vp.sort { $0.0 < $1.0 }  // sort on the basis of time

        let q = queries.count
        var mp = [Int: Int]()  // to store the unique server ids in the current window

        var ans = [Int](repeating: 0, count: q)
        var time = [(Int, Int)]()  // store the indices of queries to store the answer in the correct manner
        for (index, query) in queries.enumerated() {
            time.append((query, index))  // time, index
        }
        time.sort { $0.0 < $1.0 }  // sort on the basis of time

        var i = 0
        var j = 0  // i is the start of the window and j is the end of the window
        for tm in time {
            let curTime = tm.0
            let ind = tm.1

            let start = max(0, curTime - x)  // finding the start time (like queries[i] - x), can't be less than 0
            let end = curTime

            while j < vp.count, vp[j].0 <= end {  // move j until the value of time in logs is not more than end
                mp[vp[j].1, default: 0] += 1
                j += 1
            }

            while i < vp.count, vp[i].0 < start {  // move i until the value is not >= start
                // removing out-of-window elements
                if let count = mp[vp[i].1], count == 1 {
                    mp[vp[i].1] = nil  // if it is its only occurrence then erase it
                } else if let count = mp[vp[i].1] {
                    mp[vp[i].1] = count - 1
                }
                i += 1
            }

            ans[ind] = n - mp.count
        }

        return ans
    }
}
