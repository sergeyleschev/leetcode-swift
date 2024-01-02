class Solution {

    // Solution by Sergey Leschev
    // 2895. Minimum Processing Time

    func minProcessingTime(_ processorTime: [Int], _ tasks: [Int]) -> Int {
        var sortedProcessorTime = processorTime.sorted()
        var sortedTasks = tasks.sorted(by: >)
        var time = 0

        for i in 0..<sortedTasks.count {
            let pTime = sortedProcessorTime[i / 4]
            let timeTaken = pTime + sortedTasks[i]
            time = max(timeTaken, time)
        }

        return time
    }
}
