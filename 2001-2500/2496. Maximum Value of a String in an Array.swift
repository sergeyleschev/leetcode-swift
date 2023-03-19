// Solution @ Sergey Leschev

class Solution {
    func maximumValue(_ strs: [String]) -> Int {
        var maxValue = 0
        
        for str in strs {
            if let intValue = Int(str) {
                maxValue = max(maxValue, intValue)
            } else {
                maxValue = max(maxValue, str.count)
            }
        }
        
        return maxValue
    }
}
