class Solution {

    // Solution by Sergey Leschev
    // 2951. Find the Peaks

    // Time complexity: O(n)
    // Space complexity: O(1)

    func findPeaks(_ mountain: [Int]) -> [Int] {
        let n = mountain.count
        var peaks = [Int]()

        for i in 1..<(n - 1) {
            if mountain[i] > mountain[i - 1] && mountain[i] > mountain[i + 1] {
                peaks.append(i)
            }
        }

        return peaks
    }
}
