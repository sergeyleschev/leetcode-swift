class Solution {

    // Solution by Sergey Leschev
    // 2830. Maximize the Profit as the Salesman

    var temp = [Int]()
    var dp = [Int]()

    func maximizeTheProfit(_ n: Int, _ offers: [[Int]]) -> Int {
        var mutableOffers = offers  // Make a mutable copy
        mutableOffers.sort { $0[0] < $1[0] }

        for offer in mutableOffers {
            temp.append(offer[0])
        }

        dp = Array(repeating: -1, count: mutableOffers.count)

        return fn(0, mutableOffers)
    }

    func fn(_ ind: Int, _ offers: [[Int]]) -> Int {
        if ind >= offers.count {
            return 0
        }

        if dp[ind] != -1 {
            return dp[ind]
        }

        let nonTake = fn(ind + 1, offers)
        let target = temp.firstIndex { $0 >= offers[ind][1] + 1 } ?? temp.endIndex
        let take = offers[ind][2] + fn(target, offers)

        dp[ind] = max(nonTake, take)

        return dp[ind]
    }
}
