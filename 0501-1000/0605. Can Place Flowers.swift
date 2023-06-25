class Solution {

    // Solution @ Sergey Leschev

    // 605. Can Place Flowers
    // You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.
    // Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

    // Finds if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.
    
    // - Parameters:
    //   - flowerbed: An integer array containing 0's and 1's.
    //   - n: The number of new flowers.
    // - Returns: True if n new flowers can be planted, otherwise returns false.

    // Example 1:
    // Input: flowerbed = [1,0,0,0,1], n = 1
    // Output: true

    // Example 2:
    // Input: flowerbed = [1,0,0,0,1], n = 2
    // Output: false

    // Constraints:
    // 1 <= flowerbed.length <= 2 * 10^4
    // flowerbed[i] is 0 or 1.
    // There are no two adjacent flowers in flowerbed.
    // 0 <= n <= flowerbed.length

    // - Complexity:
    //   - time: O(m), where m is the length of the flowerbed.
    //   - space: O(m), where m is the length of the flowerbed.
    
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        guard n > 0 else { return true }

        var n = n
        var flowerbed = flowerbed
        let count = flowerbed.count
        
        for i in 0..<count {
            guard flowerbed[i] == 0 else { continue }
            
            if (i == 0 || flowerbed[i - 1] == 0) && (i == count - 1 || flowerbed[i + 1] == 0) {
                flowerbed[i] = 1
                n -= 1
            }
            
            guard n == 0 else { continue }
            return true
        }
        
        return false
    }

}