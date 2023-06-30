class RandomizedSet {

    // Solution by Sergey Leschev

    // 380. Insert Delete GetRandom O(1)
    // Implement the RandomizedSet class:
    // RandomizedSet() Initializes the RandomizedSet object.
    // bool insert(int val) Inserts an item val into the set if not present. Returns true if the item was not present, false otherwise.
    // bool remove(int val) Removes an item val from the set if present. Returns true if the item was present, false otherwise.
    // int getRandom() Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.

    // Example 1:
    // Input
    // ["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
    // [[], [1], [2], [2], [], [1], [2], []]
    // Output
    // [null, true, false, true, 2, true, false, 2]
    // Explanation
    // RandomizedSet randomizedSet = new RandomizedSet();
    // randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
    // randomizedSet.remove(2); // Returns false as 2 does not exist in the set.
    // randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].
    // randomizedSet.getRandom(); // getRandom() should return either 1 or 2 randomly.
    // randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].
    // randomizedSet.insert(2); // 2 was already in the set, so return false.
    // randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom() will always return 2.

    // Constraints:
    // -2^31 <= val <= 2^31 - 1
    // At most 10^5 calls will be made to insert, remove, and getRandom.
    // There will be at least one element in the data structure when getRandom is called.

    // Follow up: Could you implement the functions of the class with each function works in average O(1) time?

    private var arr: [Int]
    private var dict: [Int: Int]


    // Initialize data structure.
    init() {
        arr = [Int]()
        dict = [Int: Int]()
    }


    // Inserts a value to the set.
    // - Parameter val: The value.
    // - Returns: True if the set did not already contain the specified element, otherwise returns false.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func insert(_ val: Int) -> Bool {
        guard dict[val] == nil else { return false }
        arr.append(val)
        dict[val] = arr.count - 1
        return true
    }


    // Removes a value from the set.
    // - Parameter val: The value
    // - Returns: True if the set contained the specified element, otherwise returns false.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func remove(_ val: Int) -> Bool {
        guard let indexToRemove = dict[val], let last = arr.last else { return false }

        arr[indexToRemove] = last
        arr.removeLast()

        dict[last] = indexToRemove
        dict[val] = nil
        return true
    }


    // Get a random element from the set.
    // - Returns: Random element.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func getRandom() -> Int {
        return arr[Int.random(in: 0..<arr.count)]
    }

}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */