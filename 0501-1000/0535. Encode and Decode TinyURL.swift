class Codec {

    // Solution by Sergey Leschev

    // 535. Encode and Decode TinyURL
    // Note: This is a companion problem to the System Design problem: Design TinyURL.
    // TinyURL is a URL shortening service where you enter a URL such as https://leetcode.com/problems/design-tinyurl and it returns a short URL such as http://tinyurl.com/4e9iAk. Design a class to encode a URL and decode a tiny URL.
    // There is no restriction on how your encode/decode algorithm should work. You just need to ensure that a URL can be encoded to a tiny URL and the tiny URL can be decoded to the original URL.

    // Implement the Solution class:
    // Solution() Initializes the object of the system.
    // String encode(String longUrl) Returns a tiny URL for the given longUrl.
    // String decode(String shortUrl) Returns the original long URL for the given shortUrl. It is guaranteed that the given shortUrl was encoded by the same object.

    // Example 1:
    // Input: url = "https://leetcode.com/problems/design-tinyurl"
    // Output: "https://leetcode.com/problems/design-tinyurl"
    // Explanation:
    // Solution obj = new Solution();
    // string tiny = obj.encode(url); // returns the encoded tiny url.
    // string ans = obj.decode(tiny); // returns the original url after deconding it.

    // Constraints:
    // 1 <= url.length <= 10^4
    // url is guranteed to be a valid URL.

    private let alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    private var dict = [String: String]()

    // Encodes a URL to a shortened URL.
    // - Parameter longUrl: The long URL.
    // - Returns: The short URL.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(n), where n is the number of longUrl.

    func encode(_ longUrl: String) -> String {
        var newKey = key
        while dict.keys.contains(newKey) { newKey = key }
        dict[newKey] = longUrl
        return "http://tinyurl.com/\(newKey)"
    }

    // Decodes a shortened URL to its original URL.
    // - Parameter shortUrl: The short URL.
    // - Returns: The long URL.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func decode(_ shortUrl: String) -> String {
        let key = shortUrl.replacingOccurrences(of: "http://tinyurl.com/", with: "")
        return dict[key] ?? ""
    }

    private var key: String {
        String(alphabet.shuffled().prefix(6))
    }

}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(longUrl)
 * let ans = obj.decode(s)
*/
