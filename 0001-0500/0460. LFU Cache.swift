class LFUCache {

    // Solution by Sergey Leschev

    // 460. LFU Cache
    // Design and implement a data structure for a Least Frequently Used (LFU) cache.
    // Implement the LFUCache class:
    // LFUCache(int capacity) Initializes the object with the capacity of the data structure.
    // int get(int key) Gets the value of the key if the key exists in the cache. Otherwise, returns -1.
    // void put(int key, int value) Update the value of the key if present, or inserts the key if not already present. When the cache reaches its capacity, it should invalidate and remove the least frequently used key before inserting a new item. For this problem, when there is a tie (i.e., two or more keys with the same frequency), the least recently used key would be invalidated.
    // To determine the least frequently used key, a use counter is maintained for each key in the cache. The key with the smallest use counter is the least frequently used key.
    // When a key is first inserted into the cache, its use counter is set to 1 (due to the put operation). The use counter for a key in the cache is incremented either a get or put operation is called on it.

    // Example 1:
    // Input
    // ["LFUCache", "put", "put", "get", "put", "get", "get", "put", "get", "get", "get"]
    // [[2], [1, 1], [2, 2], [1], [3, 3], [2], [3], [4, 4], [1], [3], [4]]
    // Output
    // [null, null, null, 1, null, -1, 3, null, -1, 3, 4]
    // Explanation
    // // cnt(x) = the use counter for key x
    // // cache=[] will show the last used order for tiebreakers (leftmost element is  most recent)
    // LFUCache lfu = new LFUCache(2);
    // lfu.put(1, 1);   // cache=[1,_], cnt(1)=1
    // lfu.put(2, 2);   // cache=[2,1], cnt(2)=1, cnt(1)=1
    // lfu.get(1);      // return 1
    //                  // cache=[1,2], cnt(2)=1, cnt(1)=2
    // lfu.put(3, 3);   // 2 is the LFU key because cnt(2)=1 is the smallest, invalidate 2.
    //                  // cache=[3,1], cnt(3)=1, cnt(1)=2
    // lfu.get(2);      // return -1 (not found)
    // lfu.get(3);      // return 3
    //                  // cache=[3,1], cnt(3)=2, cnt(1)=2
    // lfu.put(4, 4);   // Both 1 and 3 have the same cnt, but 1 is LRU, invalidate 1.
    //                  // cache=[4,3], cnt(4)=1, cnt(3)=2
    // lfu.get(1);      // return -1 (not found)
    // lfu.get(3);      // return 3
    //                  // cache=[3,4], cnt(4)=1, cnt(3)=3
    // lfu.get(4);      // return 4
    //                  // cache=[3,4], cnt(4)=2, cnt(3)=3

    // Constraints:
    // 0 <= capacity, key, value <= 10^4
    // At most 10^5 calls will be made to get and put.

    // Follow up: Could you do both operations in O(1) time complexity?

    var capacity: Int
    var total: Int
    private var dict: [Int: (Int, Int, Int)]
    var t: Int

    init(_ capacity: Int) {
        self.capacity = capacity
        total = 0
        t = 0
        dict = [:]
    }

    func get(_ key: Int) -> Int {
        if let val = dict[key] {
            t += 1
            dict[key] = (val.0, t, val.2 + 1)
            return val.0
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        if capacity > 0 {
            if total < capacity {
                if let val = dict[key] {
                    t += 1
                    dict[key] = (value, t, val.2 + 1)
                } else {
                    t += 1
                    dict[key] = (value, t, 1)
                    total += 1
                }
            } else {
                // only need to remove if  we are adding a new  key
                if let val = dict[key] {
                    t += 1
                    dict[key] = (value, t, val.2 + 1)
                } else {
                    var smallestF: Int = Int.max
                    var smallestT: Int = Int.max
                    var smallestKeys: [Int] = []
                    for (index, (key, val)) in dict.enumerated() {
                        let currF = val.2
                        if currF <= smallestF {
                            if currF < smallestF {
                                smallestKeys = []
                            }
                            smallestF = currF
                            smallestKeys.append(key)
                        }
                    }
                    var smallestKey: Int?
                    for key in smallestKeys {
                        let currT = dict[key]!.1
                        if currT < smallestT {
                            smallestT = currT
                            smallestKey = key
                        }
                    }
                    if let smallestKey = smallestKey {
                        dict[smallestKey] = nil
                        total -= 1
                    }
                    t += 1
                    dict[key] = (value, t, 1)
                    total += 1
                }
            }
        }
    }

}

/**
 * Your LFUCache object will be instantiated and called as such:
 * let obj = LFUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
