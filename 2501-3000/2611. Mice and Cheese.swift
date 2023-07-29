class Solution {

    // Solution by Sergey Leschev
    // 2611. Mice and Cheese

    func miceAndCheese(_ reward1: [Int], _ reward2: [Int], _ k: Int) -> Int {
        var rewardsDiff = [Int]()
        var totalReward = 0

        for i in 0..<reward1.count {
            rewardsDiff.append(reward1[i] - reward2[i])
            totalReward += reward2[i]
        }

        rewardsDiff.sort(by: >)

        for i in 0..<k {
            totalReward += rewardsDiff[i]
        }

        return totalReward
    }
}
