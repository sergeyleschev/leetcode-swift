class RangeModule {

    // Solution by Sergey Leschev

    // 715. Range Module
    // A Range Module is a module that tracks ranges of numbers. Design a data structure to track the ranges represented as half-open intervals and query about them.
    // A half-open interval [left, right) denotes all the real numbers x where left <= x < right.
    // Implement the RangeModule class:
    // RangeModule() Initializes the object of the data structure.
    // void addRange(int left, int right) Adds the half-open interval [left, right), tracking every real number in that interval. Adding an interval that partially overlaps with currently tracked numbers should add any numbers in the interval [left, right) that are not already tracked.
    // boolean queryRange(int left, int right) Returns true if every real number in the interval [left, right) is currently being tracked, and false otherwise.
    // void removeRange(int left, int right) Stops tracking every real number currently being tracked in the half-open interval [left, right).

    // Example 1:
    // Input
    // ["RangeModule", "addRange", "removeRange", "queryRange", "queryRange", "queryRange"]
    // [[], [10, 20], [14, 16], [10, 14], [13, 15], [16, 17]]
    // Output
    // [null, null, null, true, false, true]
    // Explanation
    // RangeModule rangeModule = new RangeModule();
    // rangeModule.addRange(10, 20);
    // rangeModule.removeRange(14, 16);
    // rangeModule.queryRange(10, 14); // return True,(Every number in [10, 14) is being tracked)
    // rangeModule.queryRange(13, 15); // return False,(Numbers like 14, 14.03, 14.17 in [13, 15) are not being tracked)
    // rangeModule.queryRange(16, 17); // return True, (The number 16 in [16, 17) is still being tracked, despite the remove operation)

    // Constraints:
    // 1 <= left < right <= 10^9
    // At most 10^4 calls will be made to addRange, queryRange, and removeRange.

    // height = 1 means a valid range
    
    var intervals: [(pos: Int, height: Int)]


    init() { intervals = [(pos: Int, height: Int)]() }


    func addRange(_ left: Int, _ right: Int) {
        if intervals.isEmpty {
            intervals.append((left, 1))
            intervals.append((right, 0))
            return
        }

        if intervals.first!.pos > right {
            intervals.insert((right, 0), at: 0)
            intervals.insert((left, 1), at:0)
            return
        }

        if intervals.last!.pos < left {
            intervals.append((left, 1))
            intervals.append((right, 0))
            return
        }

        let l = getIndex(left, true)
        let r = getIndex(right, false)

        if l == r {
            if l > 0, intervals[l - 1].height == 1, intervals[l].pos >= right { return }
        }

        // merge with previous one, if previous.height == 1
        if l > 0, intervals[l - 1].height == 1 {
            if r > 0, intervals[r - 1].height == 1 {
                intervals[l..<r] = []
            } else {
                intervals[l..<r] = [(right, intervals[r - 1].height)]
            }
        } else {
            if r > 0, intervals[r - 1].height == 1 {
                intervals[l..<r] = [(left, 1)]
            } else {
                intervals[l..<r] = [
                    (left, 1),
                    (right, intervals[r - 1].height)
                ]
            }
        }
    }


    func queryRange(_ left: Int, _ right: Int) -> Bool {
        if intervals.isEmpty { return false }
        if intervals.last!.pos <= left { return false }
        if intervals.first!.pos >= right { return false }

        // for left, use isLeft false, and for right, use isLeft true
        // this will help checking if (left,right) are in same range
        let l = getIndex(left, false)
        let r = getIndex(right, true)

        // print("query", intervals, left, right, l, r)
        guard l == r else { return false }
        if intervals[l].pos == left {
            return intervals[l].height == 1
        } else {
            return l > 0 && intervals[l - 1].height == 1
        }
    }


    func removeRange(_ left: Int, _ right: Int) {
        if intervals.isEmpty { return }
        if right <= intervals[0].pos { return }
        if left >= intervals.last!.pos { return }

        var l = getIndex(left, true)
        var r = getIndex(right, false)

        if l == r {
            // check if this remove range is in the addedRange
            if intervals[l].pos >= right, intervals[l].height == 1,
            (l > 0 && intervals[l - 1].height == 0 && intervals[l - 1].pos <= left) {
                // this range is not valid range now, don't need to do extra remove action
                return
            }
        }

        if l == 0 || (l > 0 && intervals[l - 1].height == 0) {
            if r == intervals.count || (intervals[r].pos >= right && intervals[r].height == 1) {
                intervals[l..<r] = []
            } else {
                intervals[l..<r] = [(right, 1)]
            }
        } else if r < intervals.count, intervals[r].height == 1 {
            intervals[l..<r] = [(left, 0)]
        } else {
            if r == intervals.count {
                intervals[l..<r] = [(left, 0)]
            } else {
                intervals[l..<r] = [(left, 0), (right, 1)]
            }
        }
    }


    func getIndex(_ target: Int, _ isLeft: Bool) -> Int {
        var left = 0
        var right = intervals.count-1

        while left < right {
            let mid = left + (right - left) / 2
            if intervals[mid].pos < target {
                left = mid + 1
            } else {
                right = mid
            }
        }

        if intervals[left].pos == target {
            return isLeft ? left : left + 1
        } else if intervals[left].pos < target {
            return left+1
        } else {
            return left
        }
    }
}

/**
 * Your RangeModule object will be instantiated and called as such:
 * let obj = RangeModule()
 * obj.addRange(left, right)
 * let ret_2: Bool = obj.queryRange(left, right)
 * obj.removeRange(left, right)
 */