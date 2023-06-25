class Solution {

    // Solution @ Sergey Leschev

    // 1104. Path In Zigzag Labelled Binary Tree
    // In an infinite binary tree where every node has two children, the nodes are labelled in row order.
    // In the odd numbered rows (ie., the first, third, fifth,...), the labelling is left to right, while in the even numbered rows (second, fourth, sixth,...), the labelling is right to left.
    // Given the label of a node in this tree, return the labels in the path from the root of the tree to the node with that label.

    // Example 1:
    // Input: label = 14
    // Output: [1,3,4,14]

    // Example 2:
    // Input: label = 26
    // Output: [1,2,6,10,26]

    // Constraints:
    // 1 <= label <= 10^6

    func pathInZigZagTree(_ label: Int) -> [Int] {
        var num = 0
        var powNum: Double = 0
        var level = 0
        var output = [Int]()
        var label = label

        while label > num {
            num += Int(pow(2, powNum))
            powNum += 1
            level += 1
        }

        output.append(label)
        powNum -= 1

        while level > 1 {
            if level % 2 == 0 {
                let powValue = Int(pow(2, powNum))
                let offset = (label - (num - powValue + 1) + 1) + (label - (num - powValue + 1)) / 2
                label -= offset
                output.insert(label, at: 0)
            } else {
                let powValue = Int(pow(2, powNum))
                let offset =  (label - (num - powValue + 1) + 1) + (label - (num - powValue + 1)) / 2
                label -= offset
                output.insert(label, at: 0)
            }
            num -= Int(pow(2, powNum))
            powNum -= 1
            level -= 1
        }
        
        return output
    }

}