class Solution {

    // Solution @ Sergey Leschev

    // 1024. Video Stitching
    // You are given a series of video clips from a sporting event that lasted time seconds. These video clips can be overlapping with each other and have varying lengths.
    // Each video clip is described by an array clips where clips[i] = [starti, endi] indicates that the ith clip started at starti and ended at endi.
    // We can cut these clips into segments freely.
    // For example, a clip [0, 7] can be cut into segments [0, 1] + [1, 3] + [3, 7].
    // Return the minimum number of clips needed so that we can cut the clips into segments that cover the entire sporting event [0, time]. If the task is impossible, return -1.

    // Example 1:
    // Input: clips = [[0,2],[4,6],[8,10],[1,9],[1,5],[5,9]], time = 10
    // Output: 3
    // Explanation: 
    // We take the clips [0,2], [8,10], [1,9]; a total of 3 clips.
    // Then, we can reconstruct the sporting event as follows:
    // We cut [1,9] into segments [1,2] + [2,8] + [8,9].
    // Now we have segments [0,2] + [2,8] + [8,10] which cover the sporting event [0, 10].

    // Example 2:
    // Input: clips = [[0,1],[1,2]], time = 5
    // Output: -1
    // Explanation: We can't cover [0,5] with only [0,1] and [1,2].

    // Example 3:
    // Input: clips = [[0,1],[6,8],[0,2],[5,6],[0,4],[0,3],[6,7],[1,3],[4,7],[1,4],[2,5],[2,6],[3,4],[4,5],[5,7],[6,9]], time = 9
    // Output: 3
    // Explanation: We can take clips [0,4], [4,7], and [6,9].

    // Example 4:
    // Input: clips = [[0,4],[2,8]], time = 5
    // Output: 2
    // Explanation: Notice you can have extra video after the event ends.

    // Constraints:
    // 1 <= clips.length <= 100
    // 0 <= clips[i][0] <= clips[i][1] <= 100
    // 1 <= time <= 100

    func videoStitching(_ clips: [[Int]], _ T: Int) -> Int {
        let clips = clips.sorted { (arr1, arr2) -> Bool in
            if arr1[0] == arr2[0] { return arr1[1] <= arr2[1] }
            return arr1[0] < arr2[0]
        }
        
        return greedy(clips, T)
    }
    
    
    func greedy(_ clips: [[Int]], _ T: Int) -> Int {
        var last = 0, ret = 0, pre = 0
        var arr = Array(repeating: 0, count: T)

        for clip in clips where clip[0] < T { arr[clip[0]] = max(arr[clip[0]], clip[1]) }

        for i in 0..<T {
            last = max(last, arr[i])
            if i == last { return -1 }
            if i == pre {
                ret += 1
                pre = last
            }
        }
        return ret
    }
    
    
    func dp(_ clips: [[Int]], _ T: Int) -> Int {
        var arr = Array(repeating: Int.max, count: T + 1)
        arr[0] = 0
        
        for i in 1...T {
            for clip in clips where clip[0] < i && i <= clip[1] { arr[i] = min(arr[i], arr[clip[0]] + 1) }
        }

        return arr[T] == Int.max ? -1 : arr[T]
    }

}