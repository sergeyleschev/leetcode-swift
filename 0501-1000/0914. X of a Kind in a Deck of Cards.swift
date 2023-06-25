class Solution {

    // Solution @ Sergey Leschev

    // 914. X of a Kind in a Deck of Cards
    // In a deck of cards, each card has an integer written on it.
    // Return true if and only if you can choose X >= 2 such that it is possible to split the entire deck into 1 or more groups of cards, where:
    // Each group has exactly X cards.
    // All the cards in each group have the same integer.

    // Example 1:
    // Input: deck = [1,2,3,4,4,3,2,1]
    // Output: true
    // Explanation: Possible partition [1,1],[2,2],[3,3],[4,4].

    // Example 2:
    // Input: deck = [1,1,1,2,2,2,3,3]
    // Output: false
    // Explanation: No possible partition.

    // Example 3:
    // Input: deck = [1]
    // Output: false
    // Explanation: No possible partition.

    // Example 4:
    // Input: deck = [1,1]
    // Output: true
    // Explanation: Possible partition [1,1].

    // Example 5:
    // Input: deck = [1,1,2,2,2,2]
    // Output: true
    // Explanation: Possible partition [1,1],[2,2],[2,2].

    // Constraints:
    // 1 <= deck.length <= 10^4
    // 0 <= deck[i] < 10^4

    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        let pairsCount = deck.reduce(into: [:]) { dict, card in dict[card, default: 0] += 1 }
        var firstValue = pairsCount.values.first ?? 0
        for val in pairsCount.values { firstValue = gcd(firstValue, val) }
        return firstValue >= 2
    }


    func gcd(_ a: Int, _ b: Int) -> Int { a == 0 ? b : gcd(b % a, a) }

}