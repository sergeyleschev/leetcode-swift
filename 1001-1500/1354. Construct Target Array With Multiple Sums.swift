class Solution {

	// Solution @ Sergey Leschev

	// 1354. Construct Target Array With Multiple Sums
	// You are given an array target of n integers. From a starting array arr consisting of n 1's, you may perform the following procedure :
	// let x be the sum of all elements currently in your array.
	// choose index i, such that 0 <= i < n and set the value of arr at index i to x.
	// You may repeat this procedure as many times as needed.
	// Return true if it is possible to construct the target array from arr, otherwise, return false.

	// Example 1:
	// Input: target = [9,3,5]
	// Output: true
	// Explanation: Start with arr = [1, 1, 1] 
	// [1, 1, 1], sum = 3 choose index 1
	// [1, 3, 1], sum = 5 choose index 2
	// [1, 3, 5], sum = 9 choose index 0
	// [9, 3, 5] Done

	// Example 2:
	// Input: target = [1,1,1,2]
	// Output: false
	// Explanation: Impossible to create target array from [1,1,1,1].

	// Example 3:
	// Input: target = [8,5]
	// Output: true

	// Constraints:
	// n == target.length
	// 1 <= n <= 5 * 10^4
	// 1 <= target[i] <= 10^9

	func isPossible(_ arr: [Int]) -> Bool {
		var target: [Int64] = arr.map({ Int64($0) ?? Int64(0) })
		var sum = Int64(0)
		var index = maxElementIndex(target)

		target.forEach { sum += $0 }
		
		while (sum > Int64(1) && target[index] > sum / Int64(2)) {
			sum -= target[index]
			if (sum <= 1) { return sum == Int64(1) }
			target[index] %= sum
			sum += target[index]
			index = maxElementIndex(target)
		}
		
		return sum == target.count
	}

	
	private func maxElementIndex(_ arr: [Int64]) -> Int {
		var maxIndex = 0
		for i in 1..<arr.count { maxIndex = arr[maxIndex] < arr[i] ? i : maxIndex }
		return maxIndex
	}
	
}