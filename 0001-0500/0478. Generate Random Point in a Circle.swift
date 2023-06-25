class Solution {

    // Solution @ Sergey Leschev
    
    // 478. Generate Random Point in a Circle
    // Given the radius and the position of the center of a circle, implement the function randPoint which generates a uniform random point inside the circle.
    // Implement the Solution class:
    // Solution(double radius, double x_center, double y_center) initializes the object with the radius of the circle radius and the position of the center (x_center, y_center).
    // randPoint() returns a random point inside the circle. A point on the circumference of the circle is considered to be in the circle. The answer is returned as an array [x, y].

    // Generates random point in a circle.
    // - Returns: The random point in a circle.

    // Example 1:
    // Input
    // ["Solution", "randPoint", "randPoint", "randPoint"]
    // [[1.0, 0.0, 0.0], [], [], []]
    // Output
    // [null, [-0.02493, -0.38077], [0.82314, 0.38945], [0.36572, 0.17248]]
    // Explanation
    // Solution solution = new Solution(1.0, 0.0, 0.0);
    // solution.randPoint(); // return [-0.02493, -0.38077]
    // solution.randPoint(); // return [0.82314, 0.38945]
    // solution.randPoint(); // return [0.36572, 0.17248]

    // Constraints:
    // 0 < radius <= 10^8
    // -10^7 <= x_center, y_center <= 10^7
    // At most 3 * 10^4 calls will be made to randPoint.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    private let radius: Double
    private let xCenter: Double
    private let yCenter: Double
    

    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.radius = radius
        xCenter = x_center
        yCenter = y_center
    }
    
    
    func randPoint() -> [Double] {
        let randomR = Double.random(in: 0.0...1.0).squareRoot() * radius
        let randomTheta = Double.random(in: 0.0...1.0) * 2 * Double.pi
        let newX = xCenter + randomR * cos(randomTheta)
        let newY = yCenter + randomR * sin(randomTheta)
        return [newX, newY]
    }

}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(radius, x_center, y_center)
 * let ret_1: [Double] = obj.randPoint()
 */