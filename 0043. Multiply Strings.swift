class Solution {
	
	// 43. Multiply Strings
	// Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
	// Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

	// Example 1:
	// Input: num1 = "2", num2 = "3"
	// Output: "6"

	// Example 2:
	// Input: num1 = "123", num2 = "456"
	// Output: "56088"
	 
	// Constraints:
	// 1 <= num1.length, num2.length <= 200
	// num1 and num2 consist of digits only.
	// Both num1 and num2 do not contain any leading zero, except the number 0 itself.

    func multiply(_ num1: String, _ num2: String) -> String {
		//	0.
		if (num1 == "0" || num2 == "0") { return "0"}
		//	1.
		let list1 = convertString(num1)
		let list2 = convertString(num2)
		//	2. 
		var tmp1 = list1
		var tmp2 = list2
		var lists: [ListNode?] = []
		var index = 0

		while tmp1 != nil {
			var list: ListNode? = nil
			var current = list
			var add = 0
			for _ in 0..<index {
				let node = ListNode(0)
				if list == nil { list = node }
				current?.next = node
				current = node
			}
			while tmp2 != nil {
				let val = tmp1!.val * tmp2!.val + add
				let node = ListNode(val % 10)
				add = val / 10
				if list == nil { list = node }
				current?.next = node
				current = node
				tmp2 = tmp2?.next
			}
			if add > 0 {
				current?.next = ListNode(add)
			}
			tmp1 = tmp1?.next
			tmp2 = list2
			lists.append(list)
			index += 1
		}
		//	3.
		let res = addLists(lists)
        return convertListNode(res)
    }


	func convertString(_ num: String) -> ListNode? {
		var list: ListNode? = nil
		var current = list
		
		for i in num.reversed() {
			let node = ListNode(Int(String(i)) ?? 0)
			if current != nil {
				current?.next = node
			} else {
				list = node
			}
			current = node
		}
		return list
	}


	func convertListNode(_ list: ListNode?) -> String {
		var tmp = list
		var string = ""
		while tmp != nil {
			string = "\(tmp!.val)\(string)"
			tmp = tmp!.next;
		}
		return string
	}


	func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var add = 0
        var _l1 = l1
        var _l2 = l2
        var list: [ListNode] = []
        while _l1 != nil || _l2 != nil {
            let _l1_val = _l1?.val ?? 0
            let _l2_val = _l2?.val ?? 0
            let val = _l1_val + _l2_val + add
            let num = val % 10
            add = val / 10
            list.append(ListNode(num))
            _l1 = _l1?.next
            _l2 = _l2?.next
        }
        if (add == 1) {
            list.append(ListNode(1))
        }
        var head: ListNode?
        for node in list.reversed() {
            node.next = head
            head = node
        }
        return head
    }


	func addLists(_ lists: [ListNode?]) -> ListNode? {
		if lists.count == 1 {
			return lists[0]
		} else {
			var tmp = lists[0]
			for (i, list) in lists.enumerated() {
				if i > 0 {
					tmp = addTwoNumbers(tmp, list)
				}
			}
			return tmp
		}
	}

}
