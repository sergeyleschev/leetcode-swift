class Solution {

	// 412. Fizz Buzz
	// Given an integer n, return a string array answer (1-indexed) where:
	// answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
	// answer[i] == "Fizz" if i is divisible by 3.
	// answer[i] == "Buzz" if i is divisible by 5.
	// answer[i] == i if non of the above conditions are true.

    // Finds the string representation of numbers from 1 to n.

    // - Parameter n: Upper bound.
    // - Returns: The string representation of numbers.

	// Example 1:
	// Input: n = 3
	// Output: ["1","2","Fizz"]

	// Example 2:
	// Input: n = 5
	// Output: ["1","2","Fizz","4","Buzz"]

	// Example 3:
	// Input: n = 15
	// Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]

	// Constraints:
	// 1 <= n <= 10^4

    // - Complexity:
    //   - time: O(n), where n is the upper bound.
    //   - space: O(n), where n is the upper bound.

    func fizzBuzz(_ n: Int) -> [String] {
        var ans = [String]()

        for i in 1...n {
            switch (i % 3 == 0, i % 5 == 0) {
            case (true, true): ans.append("FizzBuzz")
            case (false, true): ans.append("Buzz")
            case (true, false): ans.append("Fizz")
            default: ans.append(String(i))
            }
        }

        return ans
    }

}