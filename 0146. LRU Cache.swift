class LRUCache {

	// 146. LRU Cache
	// Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.
	// Implement the LRUCache class:
	// LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
	// int get(int key) Return the value of the key if the key exists, otherwise return -1.
	// void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
	// Follow up:
	// Could you do get and put in O(1) time complexity?

	// Example 1:
	// Input
	// ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
	// [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
	// Output
	// [null, null, null, 1, null, -1, null, -1, 3, 4]
	// Explanation
	// LRUCache lRUCache = new LRUCache(2);
	// lRUCache.put(1, 1); // cache is {1=1}
	// lRUCache.put(2, 2); // cache is {1=1, 2=2}
	// lRUCache.get(1);    // return 1
	// lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
	// lRUCache.get(2);    // returns -1 (not found)
	// lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
	// lRUCache.get(1);    // return -1 (not found)
	// lRUCache.get(3);    // return 3
	// lRUCache.get(4);    // return 4
	 
	// Constraints:
	// 1 <= capacity <= 3000
	// 0 <= key <= 3000
	// 0 <= value <= 10^4
	// At most 3 * 10^4 calls will be made to get and put.

	var cache: [Int: Node] = [:]
	var count: Int = 0
	let capacity: Int
	var head: Node?
	var tail: Node?


	init(_ capacity: Int) {
		self.capacity = capacity
	}

    
	func get(_ key: Int) -> Int {
		if let node = cache[key] { // update
			moveToHead(node)
			
            return node.val
		} else {
			return -1
		}
	}

    
	func put(_ key: Int, _ value: Int) {
		if let node = cache[key] { // update
			node.val = value
			moveToHead(node)

        } else { // add
			let node = Node(key, value)
			
            node.next = head
			head?.prev = node
			head = node
			cache[key] = node
			count += 1
            if tail == nil {
                tail = head
            }
		}
        
		if count > capacity { // remove
			cache.removeValue(forKey: tail!.key)
			tail = tail?.prev
			tail?.next = nil
			count -= 1
		}
	}

    
	func moveToHead(_ node: Node) {
		if node === head {
			return
		} else {
			node.prev?.next = node.next
			node.next?.prev = node.prev
			node.next = head
			head?.prev = node
			head = node
		}
		if node === tail {
			tail = tail?.prev
			tail?.next = nil
		}
	}
}


class Node {
	var key: Int
	var val: Int
	var prev: Node?
	var next: Node?
	
    
    init(_ key: Int, _ val: Int) {
		self.key = key
		self.val = val
	}
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */