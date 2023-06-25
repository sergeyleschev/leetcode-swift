class Solution {

    // Solution @ Sergey Leschev

    // 756. Pyramid Transition Matrix
    // We are stacking blocks to form a pyramid. Each block has a color which is a one-letter string.
    // We are allowed to place any color block C on top of two adjacent blocks of colors A and B, if and only if ABC is an allowed triple.
    // We start with a bottom row of bottom, represented as a single string. We also start with a list of allowed triples allowed. Each allowed triple is represented as a string of length 3.
    // Return true if we can build the pyramid all the way to the top, otherwise false.

    // Example 1:
    // Input: bottom = "BCD", allowed = ["BCG","CDE","GEA","FFF"]
    // Output: true
    // Explanation:
    // We can stack the pyramid like this:
    //     A
    //    / \
    //   G   E
    //  / \ / \
    // B   C   D

    // We are allowed to place G on top of B and C because BCG is an allowed triple.  Similarly, we can place E on top of C and D, then A on top of G and E.

    // Example 2:
    // Input: bottom = "AABA", allowed = ["AAA","AAB","ABA","ABB","BAC"]
    // Output: false
    // Explanation:
    // We cannot stack the pyramid to the top.
    // Note that there could be allowed triples (A, B, C) and (A, B, D) with C != D.

    // Constraints:
    // 2 <= bottom.length <= 8
    // 0 <= allowed.length <= 200
    // allowed[i].length == 3
    // The letters in all input strings are from the set {'A', 'B', 'C', 'D', 'E', 'F', 'G'}.

    func pyramidTransition(_ bottom: String, _ allowed: [String]) -> Bool {
        var tree = [[Character]:Set<Character>]()


        func helper(currentLevel: [Character],nextLevel: [Character], index: Int) -> Bool {
            let size = currentLevel.count
            guard size != 1 else { return true }
            guard index != size - 1 else { return helper(currentLevel: nextLevel, nextLevel: [], index: 0) }
            let key = [currentLevel[index],currentLevel[ index + 1]]
            guard let chars = tree[key] else { return false }
            for ch in chars {
                var next = nextLevel
                next.append(ch)
                if helper(currentLevel: currentLevel, nextLevel: next, index: index + 1) { return true }
            }
            return false
        }

        for str in allowed {
            var chars = [Character](str)
            let ch = chars.removeLast()
            if nil == tree[chars] { tree[chars] = [] }
            tree[chars]?.insert(ch)
        }
        
        return helper(currentLevel: [Character](bottom), nextLevel: [], index: 0)
    }
    
 }