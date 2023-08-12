class Solution {

    // Solution by Sergey Leschev
    // 2810. Faulty Keyboard
    // O(n)

    func finalString(_ s: String) -> String {
        var dq = [Character]()
        var flip = false

        for ch in s {
            if ch == "i" {
                flip = !flip
            } else {
                if flip {
                    dq.insert(ch, at: dq.startIndex)
                } else {
                    dq.append(ch)
                }
            }
        }

        return flip ? String(dq.reversed()) : String(dq)
    }
}
