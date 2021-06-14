class Solution {

    // 621. Task Scheduler
    // Given a characters array tasks, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.
    // However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least n units of time between any two same tasks.
    // Return the least number of units of times that the CPU will take to finish all the given tasks.

    // Calculates the least number of units of times that the CPU will take to finish all the given tasks.

    // - Parameters:
    //   - tasks: A char array representing tasks CPU needs to do.
    //   - n: The cooldown period between two same tasks.
    // - Returns: The least number of units of time.

    // Example 1:
    // Input: tasks = ["A","A","A","B","B","B"], n = 2
    // Output: 8
    // Explanation: 
    // A -> B -> idle -> A -> B -> idle -> A -> B
    // There is at least 2 units of time between any two same tasks.

    // Example 2:
    // Input: tasks = ["A","A","A","B","B","B"], n = 0
    // Output: 6
    // Explanation: On this case any permutation of size 6 would work since n = 0.
    // ["A","A","A","B","B","B"]
    // ["A","B","A","B","A","B"]
    // ["B","B","B","A","A","A"]
    // ...
    // And so on.

    // Example 3:
    // Input: tasks = ["A","A","A","A","A","A","B","C","D","E","F","G"], n = 2
    // Output: 16
    // Explanation: 
    // One possible solution is
    // A -> B -> C -> A -> D -> E -> A -> F -> G -> A -> idle -> idle -> A -> idle -> idle -> A

    // Constraints:
    // 1 <= task.length <= 10^4
    // tasks[i] is upper-case English letter.
    // The integer n is in the range [0, 100].

    // - Complexity:
    //   - time: O(n), where n is the length of the tasks.
    //   - space: O(1), only constant space is used.
    
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard !tasks.isEmpty else { return 0 }
        var counter = [Int](repeating: 0, count: 26)
        let offset = "A".utf8.first ?? 0
        var mostFrequency = 0
        var numOfMostFrequency = 0

        for task in String(tasks).utf8 { counter[Int(task - offset)] += 1 }

        for count in counter {
            if count == mostFrequency {
                numOfMostFrequency += 1
            } else if count > mostFrequency {
                mostFrequency = count
                numOfMostFrequency = 1
            }
        }

        return max((n + 1) * (mostFrequency - 1) + numOfMostFrequency, tasks.count)
    }

}