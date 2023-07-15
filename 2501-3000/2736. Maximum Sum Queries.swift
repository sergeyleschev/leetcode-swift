class Solution {

    // Solution by Sergey Leschev
    // Time complexity: O(qlogq + (n + q) * logn)
    // Space complexity: O(n)

    func maximumSumQueries(_ nums1: [Int], _ nums2: [Int], _ queries: [[Int]]) -> [Int] {
        var allNums = [Int: Int]()
        var v = [(Int, Int)]()

        for i in 0..<nums1.count {
            v.append((nums1[i], nums2[i]))
        }

        for num in nums2 {
            allNums[num, default: 0] += 1
        }

        v.sort { $0 < $1 }

        let m = queries.count
        var ind = Array(0..<m)

        for query in queries {
            allNums[query[1], default: 0] += 1
        }

        ind.sort {
            queries[$0][0] > queries[$1][0]
        }

        var mv = 0
        for key in allNums.keys.sorted() {
            mv += 1
            allNums[key] = mv
        }

        var tree = [Int](repeating: -1, count: mv << 2)
        var r = [Int](repeating: 0, count: m)
        var j = nums1.count - 1

        func query(_ tree: [Int], _ ind: Int, _ left: Int, _ right: Int, _ x: Int, _ y: Int) -> Int
        {
            if left >= x && right <= y {
                return tree[ind]
            }

            let mid = (left + right) >> 1
            var r = -1

            if x <= mid {
                r = query(tree, ind << 1, left, mid, x, y)
            }

            if y > mid {
                r = max(r, query(tree, (ind << 1) | 1, mid + 1, right, x, y))
            }

            return r
        }

        func update(_ tree: inout [Int], _ ind: Int, _ left: Int, _ right: Int, _ x: Int, _ y: Int)
        {
            tree[ind] = max(tree[ind], y)

            if left >= x && right <= x {
                return
            }

            let mid = (left + right) >> 1

            if x <= mid {
                update(&tree, ind << 1, left, mid, x, y)
            } else {
                update(&tree, (ind << 1) | 1, mid + 1, right, x, y)
            }
        }

        for i in ind {
            while j >= 0 && v[j].0 >= queries[i][0] {
                update(&tree, 1, 1, mv, allNums[v[j].1]!, v[j].0 + v[j].1)
                j -= 1
            }

            r[i] = query(tree, 1, 1, mv, allNums[queries[i][1]]!, mv)
        }

        return r
    }
}
