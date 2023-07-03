class Solution {

    // Solution by Sergey Leschev
    // 2600. K Items With the Maximum Sum

    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        let ones = min(numOnes, k)
        let zeros = min(numZeros, k - ones)
        let negOnes = min(numNegOnes, k - ones - zeros)
        return ones - negOnes + min(numOnes - ones, k - ones)
            - min(numNegOnes - negOnes, k - ones - zeros - negOnes)
    }
}
