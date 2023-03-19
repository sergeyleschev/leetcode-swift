class Solution {

    // Solution @ Sergey Leschev

    func passThePillow(_ n: Int, _ time: Int) -> Int {
        var currentIndex = 1
        var direction = 1
        var remainingTime = time
        
        while remainingTime > 0 {
            if currentIndex == 1 && direction == -1 {
                // If the pillow reaches the beginning of the line
                // while passing from right to left, change direction
                direction = 1
            } else if currentIndex == n && direction == 1 {
                // If the pillow reaches the end of the line
                // while passing from left to right, change direction
                direction = -1
            } else {
                // Otherwise, just pass the pillow to the next person
                currentIndex += direction
                remainingTime -= 1
            }
        }
        
        return currentIndex
    }
}
