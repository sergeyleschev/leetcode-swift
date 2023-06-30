class Solution {

    // Solution by Sergey Leschev

    // 630. Course Schedule III
    // There are n different online courses numbered from 1 to n. You are given an array courses where courses[i] = [durationi, lastDayi] indicate that the ith course should be taken continuously for durationi days and must be finished before or on lastDayi.
    // You will start on the 1st day and you cannot take two or more courses simultaneously.
    // Return the maximum number of courses that you can take.

    // Example 1:
    // Input: courses = [[100,200],[200,1300],[1000,1250],[2000,3200]]
    // Output: 3
    // Explanation: 
    // There are totally 4 courses, but you can take 3 courses at most:
    // First, take the 1st course, it costs 100 days so you will finish it on the 100th day, and ready to take the next course on the 101st day.
    // Second, take the 3rd course, it costs 1000 days so you will finish it on the 1100th day, and ready to take the next course on the 1101st day. 
    // Third, take the 2nd course, it costs 200 days so you will finish it on the 1300th day. 
    // The 4th course cannot be taken now, since you will finish it on the 3300th day, which exceeds the closed date.

    // Example 2:
    // Input: courses = [[1,2]]
    // Output: 1

    // Example 3:
    // Input: courses = [[3,2],[4,3]]
    // Output: 0
     
    // Constraints:
    // 1 <= courses.length <= 10^4
    // 1 <= durationi, lastDayi <= 10^4

    func scheduleCourse(_ courses: [[Int]]) -> Int {
        var arr = courses.sorted { a,b in a[1]<b[1] }
        var time = 0
        var heap = [Int]()
        

        func find(_ target: Int) -> Int {
            var l = 0, r = heap.endIndex
            while l < r {
                let mid = (l + r) >> 1
                if heap[mid] < target {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l
        }
        

        func insert(_ target: Int) {
            let index = find(target)
            heap.insert(target, at:index)
        }
        
        for course in arr {
            if time+course[0] <= course[1] {
                time += course[0]
                insert(course[0])
            } else if !heap.isEmpty && heap.last! > course[0] {
                time = time - heap.last! + course[0]
                heap.removeLast()
                insert(course[0])
            }
        }
        return heap.count
    }
    
}