class Solution {

	// Solution @ Sergey Leschev

	// 135. Candy
	// There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.
	// You are giving candies to these children subjected to the following requirements:

	// Each child must have at least one candy.
	// Children with a higher rating get more candies than their neighbors.
	// Return the minimum number of candies you need to have to distribute the candies to the children.

	// Example 1:
	// Input: ratings = [1,0,2]
	// Output: 5
	// Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
	
	// Example 2:
	// Input: ratings = [1,2,2]
	// Output: 4
	// Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
	// The third child gets 1 candy because it satisfies the above two conditions.
	 
	// Constraints:
	// n == ratings.length
	// 1 <= n <= 2 * 10^4
	// 0 <= ratings[i] <= 2 * 10^4

	// - Complexity:
    //   - time: 0(n) + O(n)

    func candy(_ ratings: [Int]) -> Int {
		var indexs: [Int] = []
		var count = 0
        
        for i in 0..<ratings.count {
			let left = i > 0 ? ratings[i - 1] : Int.max
			let right = i < ratings.count - 1 ? ratings[i + 1] : Int.max
			
            if ratings[i] <= left && ratings[i] <= right {
				indexs.append(i)
				count += 1
			}
		}
		
        indexs.append(ratings.count)
		
        var prev = -1
        for index in indexs {
			let start = prev + 1
			let end = index
			
            if end > start {
				var maxRating = Int.min
				var maxIndex = Int.min
				
                for i in start..<end {
					if ratings[i] >= maxRating {
						maxRating = ratings[i]
						maxIndex = i
					}
				}
				
                var leftCount = maxIndex - start
				var rightCount = end - maxIndex - 1
				
                if maxIndex - 1 >= start && ratings[maxIndex - 1] == maxRating { //	two max
					rightCount += 1
				
                } else {
					if leftCount > rightCount {
						leftCount += 1
					
                    } else {
						rightCount += 1
					}
				}
                
				count += (2 + leftCount + 1) * leftCount / 2 + (2 + rightCount + 1) * rightCount / 2
			}
			
            prev = index
		}
        
		return count
    }
    
}