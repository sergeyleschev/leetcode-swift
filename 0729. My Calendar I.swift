class TreeNode {
    let start: Int
    let end: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}


class MyCalendar {

    // 729. My Calendar I
    // You are implementing a program to use as your calendar. We can add a new event if adding the event will not cause a double booking.
    // A double booking happens when two events have some non-empty intersection (i.e., some moment is common to both events.).
    // The event can be represented as a pair of integers start and end that represents a booking on the half-open interval [start, end), the range of real numbers x such that start <= x < end.
    // Implement the MyCalendar class:
    // MyCalendar() Initializes the calendar object.
    // boolean book(int start, int end) Returns true if the event can be added to the calendar successfully without causing a double booking. Otherwise, return false and do not add the event to the calendar.

    // Example 1:
    // Input
    // ["MyCalendar", "book", "book", "book"]
    // [[], [10, 20], [15, 25], [20, 30]]
    // Output
    // [null, true, false, true]
    // Explanation
    // MyCalendar myCalendar = new MyCalendar();
    // myCalendar.book(10, 20); // return True
    // myCalendar.book(15, 25); // return False, It can not be booked because time 15 is already booked by another event.
    // myCalendar.book(20, 30); // return True, The event can be booked, as the first event takes every time less than 20, but not including 20.

    // Constraints:
    // 0 <= start < end <= 10^9
    // At most 1000 calls will be made to book.

    var root: TreeNode?
    

    init() { }
    

    func bookHelper(_ start: Int, _ end: Int, _ node: inout TreeNode) -> Bool {
        if start >= node.end  {
            if node.right != nil { return self.bookHelper(start, end, &node.right!) }
            else {
                node.right = TreeNode(start, end)
                return true
            }

        } else if end <= node.start {
            if node.left != nil { return self.bookHelper(start, end, &node.left!) } 
            else {
                node.left = TreeNode(start, end)
                return true
            }
            
        } else { return false }
    }
    

    func book(_ start: Int, _ end: Int) -> Bool {
        if let root = self.root { return self.bookHelper(start, end, &self.root!) }
        self.root = TreeNode(start, end)
        return true
    }

}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */