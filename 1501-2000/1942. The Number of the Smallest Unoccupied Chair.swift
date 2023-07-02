import CoreFoundation

typealias Info = (id: Int, leavingTime: Int, position: Int)

class Solution {

    // Solution by Sergey Leschev

    // 1942. The Number of the Smallest Unoccupied Chair
    // There is a party where n friends numbered from 0 to n - 1 are attending. There is an infinite number of chairs in this party that are numbered from 0 to infinity. When a friend arrives at the party, they sit on the unoccupied chair with the smallest number.
    // For example, if chairs 0, 1, and 5 are occupied when a friend comes, they will sit on chair number 2.
    // When a friend leaves the party, their chair becomes unoccupied at the moment they leave. If another friend arrives at that same moment, they can sit in that chair.
    // You are given a 0-indexed 2D integer array times where times[i] = [arrival(i), leaving(i)], indicating the arrival and leaving times of the ith friend respectively, and an integer targetFriend. All arrival times are distinct.

    // Return the chair number that the friend numbered targetFriend will sit on.

    // Example 1:
    // Input: times = [[1,4],[2,3],[4,6]], targetFriend = 1
    // Output: 1
    // Explanation:
    // - Friend 0 arrives at time 1 and sits on chair 0.
    // - Friend 1 arrives at time 2 and sits on chair 1.
    // - Friend 1 leaves at time 3 and chair 1 becomes empty.
    // - Friend 0 leaves at time 4 and chair 0 becomes empty.
    // - Friend 2 arrives at time 4 and sits on chair 0.
    // Since friend 1 sat on chair 1, we return 1.

    // Example 2:
    // Input: times = [[3,10],[1,5],[2,6]], targetFriend = 0
    // Output: 2
    // Explanation:
    // - Friend 1 arrives at time 1 and sits on chair 0.
    // - Friend 2 arrives at time 2 and sits on chair 1.
    // - Friend 0 arrives at time 3 and sits on chair 2.
    // - Friend 1 leaves at time 5 and chair 0 becomes empty.
    // - Friend 2 leaves at time 6 and chair 1 becomes empty.
    // - Friend 0 leaves at time 10 and chair 2 becomes empty.
    // Since friend 0 sat on chair 2, we return 2.

    // Constraints:
    // n == times.length
    // 2 <= n <= 10^4
    // times[i].length == 2
    // 1 <= arrival(i) < leaving(i) <= 10^5
    // 0 <= targetFriend <= n - 1
    // Each arrival(i) time is distinct.

    func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        let heap = CFBinaryHeap.getMinHeapOfInt()
        let leaveingHeap = CFBinaryHeap.getMinHeapOfInfo()
        var pointerToInfo: UnsafeMutablePointer<Info> = .allocate(capacity: 1)
        let n = times.count

        for time in 0...n {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: time)
            CFBinaryHeapAddValue(heap, pointer)
        }

        let sortedFriendId = (0..<n).sorted { times[$0][0] < times[$1][0] }

        for friend in sortedFriendId {
            let arrivingTime = times[friend][0]
            while CFBinaryHeapGetCount(leaveingHeap) > 0 {
                let top = CFBinaryHeapGetMinimum(leaveingHeap).load(as: Info.self)
                guard top.leavingTime <= arrivingTime else { break }
                CFBinaryHeapRemoveMinimumValue(leaveingHeap)
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: top.position)
                CFBinaryHeapAddValue(heap, pointer)
            }
            let top = CFBinaryHeapGetMinimum(heap).load(as: Int.self)
            if friend == targetFriend { return top }
            CFBinaryHeapRemoveMinimumValue(heap)
            let info: Info = (friend, times[friend][1], top)
            pointerToInfo = .allocate(capacity: 1)
            pointerToInfo.initialize(to: info)
            CFBinaryHeapAddValue(leaveingHeap, pointerToInfo)
        }

        defer {
            pointer.deallocate()
            CFBinaryHeapRemoveAllValues(heap)
            pointerToInfo.deallocate()
            CFBinaryHeapRemoveAllValues(leaveingHeap)
        }
        return -1
    }

}

extension CFBinaryHeap {
    public static func getMinHeapOfInt() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a, b, _ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareLessThan : .compareGreaterThan)

        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }

    public static func getMinHeapOfInfo() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a, b, _ in
            let x = a!.load(as: Info.self)
            let y = b!.load(as: Info.self)
            return x.leavingTime == y.leavingTime
                ? .compareEqualTo
                : (x.leavingTime < y.leavingTime ? .compareLessThan : .compareGreaterThan)

        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }

}
