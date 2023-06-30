class Solution {

    // Solution by Sergey Leschev

    // 1090. Largest Values From Labels
    // We have a set of items: the i-th item has value values[i] and label labels[i].
    // Then, we choose a subset S of these items, such that:
    // |S| <= num_wanted
    // For every label L, the number of items in S with label L is <= use_limit.
    // Return the largest possible sum of the subset S.

    // Example 1:
    // Input: values = [5,4,3,2,1], labels = [1,1,2,2,3], num_wanted = 3, use_limit = 1
    // Output: 9
    // Explanation: The subset chosen is the first, third, and fifth item.

    // Example 2:
    // Input: values = [5,4,3,2,1], labels = [1,3,3,3,2], num_wanted = 3, use_limit = 2
    // Output: 12
    // Explanation: The subset chosen is the first, second, and third item.

    // Example 3:
    // Input: values = [9,8,8,7,6], labels = [0,0,0,1,1], num_wanted = 3, use_limit = 1
    // Output: 16
    // Explanation: The subset chosen is the first and fourth item.

    // Example 4:
    // Input: values = [9,8,8,7,6], labels = [0,0,0,1,1], num_wanted = 3, use_limit = 2
    // Output: 24
    // Explanation: The subset chosen is the first, second, and fourth item. 

    // Note:
    // 1 <= values.length == labels.length <= 20000
    // 0 <= values[i], labels[i] <= 20000
    // 1 <= num_wanted, use_limit <= values.length

    struct ValueWithLabel: Comparable {
        var value: Int
        var label: Int
        
        static func <(first: ValueWithLabel, second: ValueWithLabel) -> Bool { first.value < second.value }
        static func >(first: ValueWithLabel, second: ValueWithLabel) -> Bool { first.value > second.value }
        static func ==(first: ValueWithLabel, second: ValueWithLabel) -> Bool { first.value == second.value }
    }
    
    
    func largestValsFromLabels(_ values: [Int], _ labels: [Int], _ num_wanted: Int, _ use_limit: Int) -> Int {
        var ans = 0
        var data = [ValueWithLabel]()
        var labelCount = [Int: Int]()
        var choosedValueNumber = 0

        for i in 0..<values.count { data.append(Solution.ValueWithLabel(value: values[i], label: labels[i])) }
        data = data.sorted(by: > )

        for ele in data {
            if nil == labelCount[ele.label] {
                labelCount[ele.label] = 1
            } else {
                labelCount[ele.label] = labelCount[ele.label]! + 1
            }

            if labelCount[ele.label]! <= use_limit {
                ans += ele.value
                choosedValueNumber += 1
            }
            
            if choosedValueNumber == num_wanted { break }
        }
        
        return ans
    }

}