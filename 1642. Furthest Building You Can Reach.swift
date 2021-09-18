class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1642. Furthest Building You Can Reach
    // You are given an integer array heights representing the heights of buildings, some bricks, and some ladders.
    // You start your journey from building 0 and move to the next building by possibly using bricks or ladders.
    // While moving from building i to building i+1 (0-indexed),
    // If the current building's height is greater than or equal to the next building's height, you do not need a ladder or bricks.
    // If the current building's height is less than the next building's height, you can either use one ladder or (h[i+1] - h[i]) bricks.
    // Return the furthest building index (0-indexed) you can reach if you use the given ladders and bricks optimally.

    // Example 1:
    // Input: heights = [4,2,7,6,9,14,12], bricks = 5, ladders = 1
    // Output: 4
    // Explanation: Starting at building 0, you can follow these steps:
    // - Go to building 1 without using ladders nor bricks since 4 >= 2.
    // - Go to building 2 using 5 bricks. You must use either bricks or ladders because 2 < 7.
    // - Go to building 3 without using ladders nor bricks since 7 >= 6.
    // - Go to building 4 using your only ladder. You must use either bricks or ladders because 6 < 9.
    // It is impossible to go beyond building 4 because you do not have any more bricks or ladders.

    // Example 2:
    // Input: heights = [4,12,2,7,3,18,20,3,19], bricks = 10, ladders = 2
    // Output: 7

    // Example 3:
    // Input: heights = [14,3,19,3], bricks = 17, ladders = 0
    // Output: 3

    // Constraints:
    // 1 <= heights.length <= 10^5
    // 1 <= heights[i] <= 10^6
    // 0 <= bricks <= 10^9
    // 0 <= ladders <= heights.length

    private struct SortedArray {
        private var array: [Int]
        
        var count: Int { return self.array.count }

        init() { self.array = [] }


        mutating func insert(_ element: Int) {
            var left = 0
            var right = self.array.count
            while left < right {
                let mid = left + (right - left) / 2
                if array[mid] < element {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            if left == array.count {
                self.array.append(element)
            } else {
                self.array.insert(element, at: left)
            }
        }


        mutating func top() -> Int? {
            guard let element = self.array.first else { return nil }
            self.array.removeFirst()
            return element
        }
    }


    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var sortedArray = SortedArray()
        var bricksLeft = bricks

        for index in stride(from: 1, to: heights.count, by: 1) {
            let d = heights[index] - heights[index - 1]
            if d > 0 { sortedArray.insert(d) }
            if sortedArray.count > ladders { bricksLeft -= sortedArray.top()! }
            if bricksLeft < 0 { return index - 1 }
        }
        return heights.count - 1
    }

}