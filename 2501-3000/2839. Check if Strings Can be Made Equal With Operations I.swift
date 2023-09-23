class Solution {

    // Solution by Sergey Leschev
    // 2839. Check if Strings Can be Made Equal With Operations I

    // Time complexity: O(1)

    func canBeEqual(_ s1: String, _ s2: String) -> Bool {
        if s1[s1.startIndex] != s2[s2.startIndex]
            && s1[s1.index(s1.startIndex, offsetBy: 2)] != s2[s2.index(s2.startIndex, offsetBy: 2)]
        {
            if s1[s1.startIndex] != s2[s2.index(s2.startIndex, offsetBy: 2)]
                || s1[s1.index(s1.startIndex, offsetBy: 2)] != s2[s2.startIndex]
            {
                return false
            }
        } else if s1[s1.startIndex] != s2[s2.startIndex]
            && s1[s1.index(s1.startIndex, offsetBy: 2)] == s2[s2.index(s2.startIndex, offsetBy: 2)]
            || s1[s1.startIndex] == s2[s2.startIndex]
                && s1[s1.index(s1.startIndex, offsetBy: 2)]
                    != s2[s2.index(s2.startIndex, offsetBy: 2)]
        {
            return false
        }

        if s1[s1.index(s1.startIndex, offsetBy: 1)] != s2[s2.index(s2.startIndex, offsetBy: 1)]
            && s1[s1.index(s1.startIndex, offsetBy: 3)] != s2[s2.index(s2.startIndex, offsetBy: 3)]
        {
            if s1[s1.index(s1.startIndex, offsetBy: 1)] != s2[s2.index(s2.startIndex, offsetBy: 3)]
                || s1[s1.index(s1.startIndex, offsetBy: 3)]
                    != s2[s2.index(s2.startIndex, offsetBy: 1)]
            {
                return false
            }
        } else if s1[s1.index(s1.startIndex, offsetBy: 1)]
            == s2[s2.index(s2.startIndex, offsetBy: 1)]
            && s1[s1.index(s1.startIndex, offsetBy: 3)] != s2[s2.index(s2.startIndex, offsetBy: 3)]
            || s1[s1.index(s1.startIndex, offsetBy: 1)] != s2[s2.index(s2.startIndex, offsetBy: 1)]
                && s1[s1.index(s1.startIndex, offsetBy: 3)]
                    == s2[s2.index(s2.startIndex, offsetBy: 3)]
        {
            return false
        }

        return true
    }
}
