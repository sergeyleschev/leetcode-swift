class Solution {

    // Solution @ Sergey Leschev

    // 1815. Maximum Number of Groups Getting Fresh Donuts
    // There is a donuts shop that bakes donuts in batches of batchSize. They have a rule where they must serve all of the donuts of a batch before serving any donuts of the next batch. You are given an integer batchSize and an integer array groups, where groups[i] denotes that there is a group of groups[i] customers that will visit the shop. Each customer will get exactly one donut.
    // When a group visits the shop, all customers of the group must be served before serving any of the following groups. A group will be happy if they all get fresh donuts. That is, the first customer of the group does not receive a donut that was left over from the previous group.
    // You can freely rearrange the ordering of the groups. Return the maximum possible number of happy groups after rearranging the groups.

    // Example 1:
    // Input: batchSize = 3, groups = [1,2,3,4,5,6]
    // Output: 4
    // Explanation: You can arrange the groups as [6,2,4,5,1,3]. Then the 1st, 2nd, 4th, and 6th groups will be happy.

    // Example 2:
    // Input: batchSize = 4, groups = [1,3,2,5,2,2,1,6]
    // Output: 4

    // Constraints:
    // 1 <= batchSize <= 9
    // 1 <= groups.length <= 30
    // 1 <= groups[i] <= 10^9

    // Solution:
    // We have bunch of nubmers and we need to make them in special order, such that as much groups are divisible by B. Notice, that what matters, is not element g in groups, but in fact g % B.
    // Now, we have elements in groups be numbers from 0 to B-1. Notice, that if we have element 0, than this group is always happy, so no need to consider it: remove it and add 1 to final answer. Also, notice, that if we have two elements, which give B in total, if we put them one after another, we will make happy group as well.
    // Let us call position how many of each reminders we have, for example for case [1, 2, 3, 3, 4, 5, 5, 5] and B = 4, we have [4,1,2], because we have 4 numbers with reminder 1, 1 number with reminder 2 and 2 numbers with reminder 3.
    // It is time now to use dfs(position, last), where position is what we discussed earlier and last is last number in our sequence. Where we can go from this position: we try to decrease one of the elements of position by one and run function recursively: we add 1 (using U%B == 0), if we make one more group happy.
    // In the end we just run our dfs from positions we created.
    // only the remainder matters as we have to serve one batch then to the next. So we first calculate the remainder in each number and then use the new cnt array to process. Remainder of 0 can be directly added to the result as if you put it in the calculation, it would cause another group unhappy if the remainder 0 group is not happy(lose-lose situation). So it is better to just leave the remainder of 0 group alone and add it to the result. Then we will do the normal "brute force" dfs. We simply try every remainder combination and store the intermediate result in a map so that we avoid recalculation. The number of keys in the map is maximum of "batchSize * cnt[1] * ...cnt[batchSize - 1]".

    func maxHappyGroups(_ batchSize: Int, _ groups: [Int]) -> Int {
        var remain = Array(repeating: 0, count: batchSize)
        var remainGroup = 0
        var cache = [String: Int]()
        
        for g in groups {
            let temp = g % batchSize
            remain[temp] += 1
            if temp != 0 {
                remainGroup += 1
            }
        }

        var happy = remain[0]
        happy += dfs(0, &remain, remainGroup, batchSize, &cache)
        return happy
    }


    private func dfs(_ cur: Int, _ remain: inout [Int], _ remainGroup: Int, _ batchSize: Int, _ cache: inout [String: Int]) -> Int {
        if remainGroup == 0 { return 0 } // check if remain is all zero now
        var res = 0
        var cur = cur
        let key = String(cur) + getKey(remain)
        var val = 0

        if cur == 0 {
            res += 1
            cur = batchSize
        }

        if let val = cache[key] { return val }
        
        for i in 1..<batchSize {
            if remain[i] > 0 {
                remain[i] -= 1
                var nextCur = cur - i // how much left in the batch
                if nextCur < 0 { nextCur += batchSize } // not enough, add n (this was my bug during the contest)
                val = max(val, dfs(nextCur, &remain, remainGroup - 1, batchSize, &cache))
                remain[i] += 1
            }
        }
        res += val
        cache[key] = res
        return res
    }


    private func getKey(_ arr: [Int]) -> String {
        var res = ""
        for i in arr { res.append(String(i)) }
        return res
    }

}