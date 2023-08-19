class Solution {

    // Solution by Sergey Leschev
    // 2818. Apply Operations to Maximize Score

    // # Approach
    // 1. Compute Prime Scores:
    // - Calculate the prime score for each integer in the array nums. Prime score represents the number of distinct prime factors of an integer.
    // - Initialize a boolean array prime of size upper, where upper is the maximum element in nums plus 1.
    // - Initialize an integer array primeScore of the same size.
    // - Set prime[0] and prime[1] to false.
    // - Iterate over integers from 2 to upper - 1, and update primeScore and prime based on their prime factors.

    // 2. Compute Next Greater Elements:
    // - Initialize arrays nextGreaterElement and prevGreaterOrEqualElement of size n, where n is the length of nums.
    // - Use a monotonic stack to find the next greater element with a greater prime score for each element in nums.
    // - Iterate through nums and maintain a stack of indices.
    // - For each element, pop elements from the stack if their prime score is less than or equal to the current element's prime score.
    // - Record the index of the top of the stack as the nextGreaterElement if the stack is not empty, else set it to n.
    // - Repeat the above process in reverse to compute prevGreaterOrEqualElement.

    // 3. Sort and Process Elements:
    // - Create an array of tuples (num, i) where num is the value of an element and i is its index in nums.
    // - Sort the tuples in descending order of the first element (num).
    // - Loop through the sorted tuples and perform the following steps:
    //   - Compute the number of operations as the minimum of (i - prevGreaterOrEqualElement[i]) * (nextGreaterElement[i] - i) and k.
    //   - Update res by multiplying it with pow(num, operations) modulo MOD using the helper function pow.
    //   - Decrement k by the number of operations.
    //   - If k becomes 0, return res.

    // 4. Helper Function for Exponentiation:
    // - Implement the pow function to calculate exponentiation efficiently using modular arithmetic.

    // # Complexity
    // - Time complexity: O(max(nums) * log(max(nums)) + n * log(n)).
    // Accounting for computing prime scores, using the stack to compute next greater elements, and sorting the tuples.
    // - Space complexity: O(max(nums) + n).
    // Considering the space required for arrays and the stack used for computation.

    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        let MOD = 1_000_000_007
        var k = k  // Make a mutable copy of k
        let n = nums.count

        var upper = nums.max()! + 1

        var prime = [Bool](repeating: true, count: upper)
        prime[0] = false
        prime[1] = false
        var primeScore = [Int](repeating: 0, count: upper)

        for i in 2..<upper {
            if prime[i] {
                var j = i
                while j < upper {
                    primeScore[j] += 1
                    prime[j] = false
                    j += i
                }
            }
        }

        var nextGreaterElement = [Int](repeating: n, count: n)
        var s = [Int]()
        for i in (0..<n).reversed() {
            while !s.isEmpty && primeScore[nums[i]] >= primeScore[nums[s.last!]] {
                s.popLast()
            }
            nextGreaterElement[i] = s.isEmpty ? n : s.last!
            s.append(i)
        }

        var prevGreaterOrEqualElement = [Int](repeating: -1, count: n)
        s.removeAll()
        for i in 0..<n {
            while !s.isEmpty && primeScore[nums[i]] > primeScore[nums[s.last!]] {
                s.popLast()
            }
            prevGreaterOrEqualElement[i] = s.isEmpty ? -1 : s.last!
            s.append(i)
        }

        var res = 1
        var tuples = [(num: Int, index: Int)]()
        for i in 0..<n {
            tuples.append((nums[i], i))
        }
        tuples.sort { a, b in
            a.num > b.num
        }

        for (num, i) in tuples {
            let operations = min(
                (i - prevGreaterOrEqualElement[i]) * (nextGreaterElement[i] - i), k)
            res = (res * pow(num, operations, MOD)) % MOD
            k -= operations
            if k == 0 {
                return res
            }
        }

        return res
    }

    func pow(_ x: Int, _ n: Int, _ mod: Int) -> Int {
        var res = 1
        var x = x
        var n = n
        while n > 0 {
            if n % 2 == 1 {
                res = (res * x) % mod
            }
            x = (x * x) % mod
            n /= 2
        }
        return res
    }
}
