class SnapshotArray {

    // 1146. Snapshot Array
    // Implement a SnapshotArray that supports the following interface:
    // SnapshotArray(int length) initializes an array-like data structure with the given length.  Initially, each element equals 0.
    // void set(index, val) sets the element at the given index to be equal to val.
    // int snap() takes a snapshot of the array and returns the snapId: the total number of times we called snap() minus 1.
    // int get(index, snapId) returns the value at the given index, at the time we took the snapshot with the given snapId

    // Example 1:
    // Input: ["SnapshotArray","set","snap","set","get"]
    // [[3],[0,5],[],[0,6],[0,0]]
    // Output: [null,null,0,null,5]
    // Explanation: 
    // SnapshotArray snapshotArr = new SnapshotArray(3); // set the length to be 3
    // snapshotArr.set(0,5);  // Set array[0] = 5
    // snapshotArr.snap();  // Take a snapshot, return snapId = 0
    // snapshotArr.set(0,6);
    // snapshotArr.get(0,0);  // Get the value of array[0] with snapId = 0, return 5

    // Constraints:
    // 1 <= length <= 50000
    // At most 50000 calls will be made to set, snap, and get.
    // 0 <= index < length
    // 0 <= snapId < (the total number of times we call snap())
    // 0 <= val <= 10^9

    private var data: [Int]
    private var length: Int
    private var snapValues = [Int: [Int: Int]]()
    private var currentSnapId = -1


    init(_ length: Int) {
        data = [Int](repeating: 0, count: length)
        self.length = length
    }
    

    func set(_ index: Int, _ val: Int) {
        if nil == snapValues[currentSnapId] { snapValues[currentSnapId] = [:] }
        snapValues[currentSnapId]?.updateValue(val, forKey: index)
    }
    

    func snap() -> Int {
        currentSnapId += 1
        snapValues[currentSnapId] = [:]
        return currentSnapId
    }
    

    func get(_ index: Int, _ snapId: Int) -> Int {
        var snapId = snapId - 1
        while snapId >= -1 {
            if let dic = snapValues[snapId], let val = dic[index]  { return val }
            snapId -= 1
        }
        return data[index]
    }

}

/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snapId)
 */