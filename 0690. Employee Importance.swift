/**
 * Definition for Employee.
 * public class Employee {
 *     public var id: Int
 *     public var importance: Int
 *     public var subordinates: [Int]
 *     public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
 *         self.id = id
 *         self.importance = importance
 *         self.subordinates = subordinates
 *     }
 * }
 */

class Solution {

    // 690. Employee Importance
    // You have a data structure of employee information, which includes the employee's unique id, their importance value, and their direct subordinates' id.
    // You are given an array of employees employees where:
    // employees[i].id is the ID of the ith employee.
    // employees[i].importance is the importance value of the ith employee.
    // employees[i].subordinates is a list of the IDs of the subordinates of the ith employee.
    // Given an integer id that represents the ID of an employee, return the total importance value of this employee and all their subordinates.

    // Example 1:
    // Input: employees = [[1,5,[2,3]],[2,3,[]],[3,3,[]]], id = 1
    // Output: 11
    // Explanation: Employee 1 has importance value 5, and he has two direct subordinates: employee 2 and employee 3.
    // They both have importance value 3.
    // So the total importance value of employee 1 is 5 + 3 + 3 = 11.

    // Example 2:
    // Input: employees = [[1,2,[5]],[5,-3,[]]], id = 5
    // Output: -3

    // Constraints:
    // 1 <= employees.length <= 2000
    // 1 <= employees[i].id <= 2000
    // All employees[i].id are unique.
    // -100 <= employees[i].importance <= 100
    // One employee has at most one direct leader and may have several subordinates.
    // id is guaranteed to be a valid employee id.

    var employeeMap = [Int : Employee]()
    
    
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        for emp in employees { employeeMap[emp.id] = emp }
        return statistics(employeeMap[id]!)
    }
    

    func statistics(_ employee: Employee) -> Int{
        if employee.subordinates.count == 0 { return employee.importance }
        var sum = 0
        for i in 0..<employee.subordinates.count {
            let subEmployee = employeeMap[employee.subordinates[i]]
            let importance = statistics(subEmployee!)
            sum += importance
        }
        return sum + employee.importance
    }

}