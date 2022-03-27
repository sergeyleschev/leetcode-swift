class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 744. Find Smallest Letter Greater Than Target
    // Given a characters array letters that is sorted in non-decreasing order and a character target, return the smallest character in the array that is larger than target.
    // Note that the letters wrap around.
    // For example, if target == 'z' and letters == ['a', 'b'], the answer is 'a'.

    // Finds the smallest element in the list that is greater than the given target.

    // - Parameters:
    //   - letters: A list of sorted characters.
    //   - target: A target letter.
    // - Returns: The smallest element in the list greater than the given target.

    // Example 1:
    // Input: letters = ["c","f","j"], target = "a"
    // Output: "c"

    // Example 2:
    // Input: letters = ["c","f","j"], target = "c"
    // Output: "f"

    // Example 3:
    // Input: letters = ["c","f","j"], target = "d"
    // Output: "f"

    // Example 4:
    // Input: letters = ["c","f","j"], target = "g"
    // Output: "j"

    // Example 5:
    // Input: letters = ["c","f","j"], target = "j"
    // Output: "c"

    // Constraints:
    // 2 <= letters.length <= 10^4
    // letters[i] is a lowercase English letter.
    // letters is sorted in non-decreasing order.
    // letters contains at least two different characters.
    // target is a lowercase English letter.

    // - Complexity:
    //   - time: O(log n), where n is the length of letters.
    //   - space: O(1), only constant space is used.
    
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        let n = letters.count
        var start = 0
        var end = n
        
        while start < end {
            let mid = start + (end - start) / 2
            
            if letters[mid] <= target {
                start = mid + 1
            } else {
                end = mid
            }
        }
        
        return letters[start % n]
    }

}