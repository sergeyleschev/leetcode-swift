class Solution {

    // 808. Soup Servings
    // There are two types of soup: type A and type B. Initially we have n ml of each type of soup. There are four kinds of operations:
    // Serve 100 ml of soup A and 0 ml of soup B
    // Serve 75 ml of soup A and 25 ml of soup B
    // Serve 50 ml of soup A and 50 ml of soup B
    // Serve 25 ml of soup A and 75 ml of soup B
    // When we serve some soup, we give it to someone and we no longer have it. Each turn, we will choose from the four operations with equal probability 0.25. If the remaining volume of soup is not enough to complete the operation, we will serve as much as we can. We stop once we no longer have some quantity of both types of soup.
    // Note that we do not have the operation where all 100 ml's of soup B are used first.
    // Return the probability that soup A will be empty first, plus half the probability that A and B become empty at the same time.

    // Example:
    // Input: n = 50
    // Output: 0.625
    // Explanation: 
    // If we choose the first two operations, A will become empty first. For the third operation, A and B will become empty at the same time. For the fourth operation, B will become empty first. So the total probability of A becoming empty first plus half the probability that A and B become empty at the same time, is 0.25 * (1 + 1 + 0.5 + 0) = 0.625.
    // Notes:
    // 0 <= n <= 109.
    // Answers within 10-6 of the true value will be accepted as correct.

    func soupServings(_ N: Int) -> Double {
        guard N != 0 else { return 0.5 }
        guard N < 5000 else { return 1.0 }
        let soupVolume = Int(ceil(Double(N) / 25))
        var probability  = [[Double]](repeating: [Double](repeating: 0, count: soupVolume + 1), count: soupVolume + 1)
        probability[0][0] = 0.5
        
        for i in 1...soupVolume { probability[0][i] = 1 }
        
        for soupAVolume in 1...soupVolume {
            let remainSoupA: [Int] = [soupAVolume - 4 > 0 ? soupAVolume - 4 : 0, soupAVolume - 3 > 0 ? soupAVolume - 3 : 0, soupAVolume - 2 > 0 ? soupAVolume - 2 : 0, soupAVolume - 1 > 0 ? soupAVolume - 1 : 0]
            for soupBVolume in 1...soupVolume {
                let remainSoupB = [soupBVolume,soupBVolume - 1 > 0 ?  soupBVolume - 1 : 0,soupBVolume - 2 > 0 ?  soupBVolume - 2 : 0,soupBVolume - 3 > 0 ?  soupBVolume - 3 : 0]
                
                probability[soupAVolume][soupBVolume] = 0.25  * (probability[remainSoupA[0]][remainSoupB[0]] + probability[remainSoupA[1]][remainSoupB[1]] + probability[remainSoupA[2]][remainSoupB[2]]  + probability[remainSoupA[3]][remainSoupB[3]])
            }
        }
        
        return probability[soupVolume][soupVolume]
    }

 }