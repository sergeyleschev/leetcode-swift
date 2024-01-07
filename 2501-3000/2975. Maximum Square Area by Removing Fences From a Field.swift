class Solution {

    // Solution by Sergey Leschev
    // 2975. Maximum Square Area by Removing Fences From a Field

    func maximizeSquareArea(_ m: Int, _ n: Int, _ hFences: [Int], _ vFences: [Int]) -> Int {
        let mod = Int(1e9 + 7)
        var ans: Int64 = 0
        var st = Set<Int>()

        var updatedHFences = hFences
        var updatedVFences = vFences

        updatedHFences.append(1)
        updatedHFences.append(m)
        updatedVFences.append(1)
        updatedVFences.append(n)

        for i in 0..<updatedHFences.count {
            for j in 0..<updatedHFences.count {
                st.insert(abs(updatedHFences[i] - updatedHFences[j]))
            }
        }

        for i in 0..<updatedVFences.count {
            for j in 0..<updatedVFences.count {
                if i != j && st.contains(abs(updatedVFences[i] - updatedVFences[j])) {
                    ans = max(ans, Int64(abs(updatedVFences[i] - updatedVFences[j])))
                }
            }
        }

        return ans == 0 ? -1 : Int((ans * ans) % Int64(mod))
    }
}
