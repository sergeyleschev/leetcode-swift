class Solution {

    // Solution by Sergey Leschev
    // 2840. Check if Strings Can be Made Equal With Operations II

    func checkStrings(_ s1: String, _ s2: String) -> Bool {
        let even1 = s1.enumerated().compactMap { $0.offset % 2 == 0 ? $0.element : nil }
        let even2 = s2.enumerated().compactMap { $0.offset % 2 == 0 ? $0.element : nil }
        let odd1 = s1.enumerated().compactMap { $0.offset % 2 != 0 ? $0.element : nil }
        let odd2 = s2.enumerated().compactMap { $0.offset % 2 != 0 ? $0.element : nil }

        return odd1.sorted() == odd2.sorted() && even1.sorted() == even2.sorted()
    }
}
