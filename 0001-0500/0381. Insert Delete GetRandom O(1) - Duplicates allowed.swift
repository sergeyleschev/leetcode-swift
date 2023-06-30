class RandomizedCollection {

    // Solution by Sergey Leschev

    // 381. Insert Delete GetRandom O(1) - Duplicates allowed
    // Implement the RandomizedCollection class:
    // RandomizedCollection() Initializes the RandomizedCollection object.
    // bool insert(int val) Inserts an item val into the multiset if not present. Returns true if the item was not present, false otherwise.
    // bool remove(int val) Removes an item val from the multiset if present. Returns true if the item was present, false otherwise. Note that if val has multiple occurrences in the multiset, we only remove one of them.
    // int getRandom() Returns a random element from the current multiset of elements (it's guaranteed that at least one element exists when this method is called). The probability of each element being returned is linearly related to the number of same values the multiset contains.

    // Example 1:
    // Input
    // ["RandomizedCollection", "insert", "insert", "insert", "getRandom", "remove", "getRandom"]
    // [[], [1], [1], [2], [], [1], []]
    // Output
    // [null, true, false, true, 2, true, 1]
    // Explanation
    // RandomizedCollection randomizedCollection = new RandomizedCollection();
    // randomizedCollection.insert(1);   // return True. Inserts 1 to the collection. Returns true as the collection did not contain 1.
    // randomizedCollection.insert(1);   // return False. Inserts another 1 to the collection. Returns false as the collection contained 1. Collection now contains [1,1].
    // randomizedCollection.insert(2);   // return True. Inserts 2 to the collection, returns true. Collection now contains [1,1,2].
    // randomizedCollection.getRandom(); // getRandom should return 1 with the probability 2/3, and returns 2 with the probability 1/3.
    // randomizedCollection.remove(1);   // return True. Removes 1 from the collection, returns true. Collection now contains [1,2].
    // randomizedCollection.getRandom(); // getRandom should return 1 and 2 both equally likely.

    // Constraints:
    // -2^31 <= val <= 2^31 - 1
    // At most 10^5 calls will be made to insert, remove, and getRandom.
    // There will be at least one element in the data structure when getRandom is called.

    // Follow up: Could you implement the functions of the class with each function works in average O(1) time?

    private var nums: [Int] = [Int]()
    private var idx: [Int: Set<Int>] = [:]
    static var state: UInt32 = 1
    

    /** Initialize your data structure here. */
    init() {}

    
    /** Inserts a value to the collection. Returns true if the collection did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        nums.append(val)
        if var set = idx[val] {
            let hasElement = set.count > 0
            set.insert(nums.count - 1)
            idx[val] = set
            return !hasElement
        } else {
            var set = Set<Int>()
            set.insert(nums.count - 1)
            idx[val] = set
            return true
        }
    }
    

    /** Removes a value from the collection. Returns true if the collection contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if !idx.keys.contains(val) { return false }
        var iter = idx[val]!.makeIterator()
        let i = iter.next()!
        let lastNum = nums[nums.count - 1]

        nums[i] = lastNum
        idx[val]!.remove(i)
        idx[lastNum]!.remove(nums.count - 1)
        if i < nums.count - 1 { idx[lastNum]!.insert(i) }
        if 0 == idx[val]!.count { idx.removeValue(forKey: val) }
        nums.removeLast()
        return true
    }
    

    /** Get a random element from the collection. */
    func getRandom() -> Int {
        if nums.count > 0 { return nums[Int(random())%nums.count] }
        return 0
    }
    

    private func random() -> UInt32 {
        var x: UInt32 = RandomizedCollection.state
        x = x^(x << 13)
        x = x^(x >> 17)
        x = x^(x << 5)
        RandomizedCollection.state = x
        return x
    }
    
}