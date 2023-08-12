class Solution {
    
    // Solution by Sergey Leschev
    // 2806. Account Balance After Rounded Purchase

    func accountBalanceAfterPurchase(_ purchaseAmount: Int) -> Int {
        return 100 - ((purchaseAmount + 5) / 10) * 10
    }
}
