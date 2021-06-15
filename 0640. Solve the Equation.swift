class Solution {

    // 640. Solve the Equation
    // Solve a given equation and return the value of 'x' in the form of a string "x=#value". The equation contains only '+', '-' operation, the variable 'x' and its coefficient. You should return "No solution" if there is no solution for the equation, or "Infinite solutions" if there are infinite solutions for the equation.
    // If there is exactly one solution for the equation, we ensure that the value of 'x' is an integer.

    // Example 1:
    // Input: equation = "x+5-3+x=6+x-2"
    // Output: "x=2"

    // Example 2:
    // Input: equation = "x=x"
    // Output: "Infinite solutions"

    // Example 3:
    // Input: equation = "2x=x"
    // Output: "x=0"

    // Example 4:
    // Input: equation = "2x+3x-6x=x+2"
    // Output: "x=-1"

    // Example 5:
    // Input: equation = "x=x+2"
    // Output: "No solution"

    // Constraints:
    // 3 <= equation.length <= 1000
    // equation has exactly one '='.
    // equation consists of integers with an absolute value in the range [0, 100] without any leading zeros, and the variable 'x'.

    func solveEquation(_ equation: String) -> String {
        var opt = "+"
        var tempVal: Int?
        var leftX = 0
        var rightVal = 0
        var leftSide = -1 // Set -1 means on left side, 1 is on right side
        
        for ch in equation + "+" {
            switch ch {
            case "x":
                var val = opt == "-" ? leftSide : -leftSide
                if let temp = tempVal { val = -leftSide * temp }
                leftX += val
                tempVal = nil
                opt = ""
            case "+", "-":
                opt = String(ch)
                rightVal += leftSide*(tempVal ?? 0)
                tempVal = nil
            case "=":
                opt = ""
                rightVal += leftSide*(tempVal ?? 0)
                tempVal = nil
                leftSide = 1
            default: tempVal = (tempVal ?? 0)*10 + (opt == "-" ? -Int(String(ch))! : Int(String(ch))!)
            }
        }

        if leftX == 0 { return rightVal != 0 ? "No solution" : "Infinite solutions" }
        else {
            if leftX < 0 { rightVal *= -1 }
            leftX = abs(leftX)
            if leftX > 1 { rightVal = rightVal/leftX }
            return "x=\(rightVal)"
        }
    }

}