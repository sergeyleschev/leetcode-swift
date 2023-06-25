class CombinationIterator {

    // Solution @ Sergey Leschev

    // 1286. Iterator for Combination
    // Design the CombinationIterator class:
    // CombinationIterator(string characters, int combinationLength) Initializes the object with a string characters of sorted distinct lowercase English letters and a number combinationLength as arguments.
    // next() Returns the next combination of length combinationLength in lexicographical order.
    // hasNext() Returns true if and only if there exists a next combination.

    // Example 1:
    // Input
    // ["CombinationIterator", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
    // [["abc", 2], [], [], [], [], [], []]
    // Output
    // [null, "ab", true, "ac", true, "bc", false]
    // Explanation
    // CombinationIterator itr = new CombinationIterator("abc", 2);
    // itr.next();    // return "ab"
    // itr.hasNext(); // return True
    // itr.next();    // return "ac"
    // itr.hasNext(); // return True
    // itr.next();    // return "bc"
    // itr.hasNext(); // return False
     
    // Constraints:
    // 1 <= combinationLength <= characters.length <= 15
    // All the characters of characters are unique.
    // At most 10^4 calls will be made to next and hasNext.
    // It's guaranteed that all calls of the function next are valid.

    private var combinations: [String]


    // Initialization of data structures.
    // - Parameters:
    //   - characters: A string of sorted distinct lowercase English letters.
    //   - combinationLength: The length of the combination.

    // - Complexity:
    //   - time: O(n * 2^n), where n is the length of characters.
    //   - space: O(m), where m is the number of combinations.

    init(_ characters: String, _ combinationLength: Int) {
        combinations = [String]()
        let n = characters.count
        let k = combinationLength

        for bitmask in 0..<(1<<n) {
            guard bitmask.nonzeroBitCount == k else { continue }

            var current = ""
            for (j, ch) in characters.enumerated() {
                guard bitmask & (1 << (n - j - 1)) != 0 else { continue }
                current = "\(current)\(ch)"
            }

            combinations.append(current)
        }
    }


    // Gets the next combination of length combinationLength in lexicographical order.
    // - Returns: The next combination.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.
    
    func next() -> String { combinations.removeLast() }


    // Checks if the next combination exists.
    // - Returns: True if the next combination exists, otherwise returns false.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.
    
    func hasNext() -> Bool { !combinations.isEmpty }

}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */