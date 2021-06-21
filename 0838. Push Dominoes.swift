class Solution {

    // 838. Push Dominoes
    // There are N dominoes in a line, and we place each domino vertically upright.
    // In the beginning, we simultaneously push some of the dominoes either to the left or to the right.
    // After each second, each domino that is falling to the left pushes the adjacent domino on the left.
    // Similarly, the dominoes falling to the right push their adjacent dominoes standing on the right.
    // When a vertical domino has dominoes falling on it from both sides, it stays still due to the balance of the forces.
    // For the purposes of this question, we will consider that a falling domino expends no additional force to a falling or already fallen domino.
    // Given a string "S" representing the initial state. S[i] = 'L', if the i-th domino has been pushed to the left; S[i] = 'R', if the i-th domino has been pushed to the right; S[i] = '.', if the i-th domino has not been pushed.
    // Return a string representing the final state. 

    // Example 1:
    // Input: ".L.R...LR..L.."
    // Output: "LL.RR.LLRRLL.."

    // Example 2:
    // Input: "RR.L"
    // Output: "RR.L"
    // Explanation: The first domino expends no additional force on the second domino.

    // Note:
    // 0 <= N <= 10^5
    // String dominoes contains only 'L', 'R' and '.'

    func pushDominoes(_ dominoes: String) -> String {
        var p = 0
        var flag = "L"
        let dominoesArr = Array(dominoes)
        var ans = ""
        
        for (i, d) in (dominoesArr+["R"]).enumerated() {
            switch d {
            case "L":
                if flag == "L" {
                    ans.append(String(repeating: "L", count: i - p + 1))
                } else {
                    if (i+p) % 2 == 0 {
                        let m = (i + p - 1) / 2
                        ans.append(String.init(repeating: "R", count: m - p + 1))
                        ans.append(String.init(repeating: "L", count: i - m))
                    } else {
                        let m = (i + p - 1) / 2
                        ans.append(String.init(repeating: "R", count: m - p))
                        ans.append(".")
                        ans.append(String.init(repeating: "L", count: i - m))
                    }
                }
                flag = "L"
                p = i+1
            case "R":
                ans.append(String(repeating: flag == "R" ? "R" : ".", count: i - p))
                ans.append("R")
                flag = "R"
                p = i+1
            default: break
            }
        }
        
        ans.removeLast()
        return ans
    }
    
}