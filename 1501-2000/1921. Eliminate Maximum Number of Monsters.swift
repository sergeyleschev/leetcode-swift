import CoreFoundation


class Solution {

    // Solution by Sergey Leschev

    // 1921. Eliminate Maximum Number of Monsters
    // You are playing a video game where you are defending your city from a group of n monsters. You are given a 0-indexed integer array dist of size n, where dist[i] is the initial distance in kilometers of the ith monster from the city.
    // The monsters walk toward the city at a constant speed. The speed of each monster is given to you in an integer array speed of size n, where speed[i] is the speed of the ith monster in kilometers per minute.
    // You have a weapon that, once fully charged, can eliminate a single monster. However, the weapon takes one minute to charge.The weapon is fully charged at the very start.
    // You lose when any monster reaches your city. If a monster reaches the city at the exact moment the weapon is fully charged, it counts as a loss, and the game ends before you can use your weapon.

    // Return the maximum number of monsters that you can eliminate before you lose, or n if you can eliminate all the monsters before they reach the city.

    // Example 1:
    // Input: dist = [1,3,4], speed = [1,1,1]
    // Output: 3
    // Explanation:
    // In the beginning, the distances of the monsters are [1,3,4]. You eliminate the first monster.
    // After a minute, the distances of the monsters are [X,2,3]. You eliminate the second monster.
    // After a minute, the distances of the monsters are [X,X,2]. You eliminate the thrid monster.
    // All 3 monsters can be eliminated.

    // Example 2:
    // Input: dist = [1,1,2,3], speed = [1,1,1,1]
    // Output: 1
    // Explanation:
    // In the beginning, the distances of the monsters are [1,1,2,3]. You eliminate the first monster.
    // After a minute, the distances of the monsters are [X,0,1,2], so you lose.
    // You can only eliminate 1 monster.

    // Example 3:
    // Input: dist = [3,2,4], speed = [5,3,2]
    // Output: 1
    // Explanation:
    // In the beginning, the distances of the monsters are [3,2,4]. You eliminate the first monster.
    // After a minute, the distances of the monsters are [X,0,2], so you lose.
    // You can only eliminate 1 monster.

    // Constraints:
    // n == dist.length == speed.length
    // 1 <= n <= 10^5
    // 1 <= dist[i], speed[i] <= 10^5

    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        let minHeap = CFBinaryHeap.getMinHeapOfTime()
        var pointer: UnsafeMutablePointer<Double> = .allocate(capacity: 1)
        var time = 0.0
        var ans = 0

        for idx in 0..<dist.count {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: Double(dist[idx]) / Double(speed[idx]))
            CFBinaryHeapAddValue(minHeap, pointer)
        }

        while CFBinaryHeapGetCount(minHeap) > 0 {
            let top = CFBinaryHeapGetMinimum(minHeap).load(as: Double.self)
            guard top > time else { break }
            ans += 1
            time += 1.0
            CFBinaryHeapRemoveMinimumValue(minHeap)
        }
        pointer.deallocate()
        CFBinaryHeapRemoveAllValues(minHeap)
        return ans
    }
}


extension CFBinaryHeap {
    static func getMinHeapOfTime() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = { a, b, _ in
            let t1 = a!.load(as: Double.self)
            let t2 = b!.load(as: Double.self)

            return t1 == t2 ? .compareEqualTo : (t1 < t2 ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}