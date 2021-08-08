class SeatManager {

  // 1845. Seat Reservation Manager
  // Design a system that manages the reservation state of n seats that are numbered from 1 to n.
  // Implement the SeatManager class:
  // SeatManager(int n) Initializes a SeatManager object that will manage n seats numbered from 1 to n. All seats are initially available.
  // int reserve() Fetches the smallest-numbered unreserved seat, reserves it, and returns its number.
  // void unreserve(int seatNumber) Unreserves the seat with the given seatNumber.

  // Example 1:
  // Input
  // ["SeatManager", "reserve", "reserve", "unreserve", "reserve", "reserve", "reserve", "reserve", "unreserve"]
  // [[5], [], [], [2], [], [], [], [], [5]]
  // Output
  // [null, 1, 2, null, 2, 3, 4, 5, null]
  // Explanation
  // SeatManager seatManager = new SeatManager(5); // Initializes a SeatManager with 5 seats.
  // seatManager.reserve();    // All seats are available, so return the lowest numbered seat, which is 1.
  // seatManager.reserve();    // The available seats are [2,3,4,5], so return the lowest of them, which is 2.
  // seatManager.unreserve(2); // Unreserve seat 2, so now the available seats are [2,3,4,5].
  // seatManager.reserve();    // The available seats are [2,3,4,5], so return the lowest of them, which is 2.
  // seatManager.reserve();    // The available seats are [3,4,5], so return the lowest of them, which is 3.
  // seatManager.reserve();    // The available seats are [4,5], so return the lowest of them, which is 4.
  // seatManager.reserve();    // The only available seat is seat 5, so return 5.
  // seatManager.unreserve(5); // Unreserve seat 5, so now the available seats are [5].

  // Constraints:
  // 1 <= n <= 10^5
  // 1 <= seatNumber <= n
  // For each call to reserve, it is guaranteed that there will be at least one unreserved seat.
  // For each call to unreserve, it is guaranteed that seatNumber will be reserved.
  // At most 10^5 calls in total will be made to reserve and unreserve.  

    var p: Int
    var heap: Heap<Int>


    init(_ n: Int) {
        self.p = 0
        self.heap = Heap<Int>(sort: { $0 < $1 })
    }
    
    
    func reserve() -> Int {
        if heap.isEmpty {
            p += 1
            return p
        } else { return heap.remove()! }
    }
    

    func unreserve(_ seatNumber: Int) { heap.insert(seatNumber) }

}

// Third-party Heap
// https://github.com/raywenderlich/swift-algorithm-club/blob/master/Heap/Heap.swift
// Written for the Swift Algorithm Club by Kevin Randrup and Matthijs Hollemans
public struct Heap<T> {
  var nodes = [T]()  
  private var orderCriteria: (T, T) -> Bool
  
  public init(sort: @escaping (T, T) -> Bool) { self.orderCriteria = sort }
  
  public var isEmpty: Bool { return nodes.isEmpty }
  public var count: Int { return nodes.count }

  @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int { return (i - 1) / 2 }
  @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int { return 2*i + 1 }
  @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int { return 2*i + 2 }
  
  public func peek() -> T? { return nodes.first }
  
  public mutating func insert(_ value: T) {
    nodes.append(value)
    shiftUp(nodes.count - 1)
  }
  
  @discardableResult public mutating func remove() -> T? {
    guard !nodes.isEmpty else { return nil }    
    if nodes.count == 1 {
      return nodes.removeLast()
    } else {
      let value = nodes[0]
      nodes[0] = nodes.removeLast()
      shiftDown(0)
      return value
    }
  }
  
  internal mutating func shiftUp(_ index: Int) {
    var childIndex = index
    let child = nodes[childIndex]
    var parentIndex = self.parentIndex(ofIndex: childIndex)    
    while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
      nodes[childIndex] = nodes[parentIndex]
      childIndex = parentIndex
      parentIndex = self.parentIndex(ofIndex: childIndex)
    }
    nodes[childIndex] = child
  }
  
  internal mutating func shiftDown(from index: Int, until endIndex: Int) {
    let leftChildIndex = self.leftChildIndex(ofIndex: index)
    let rightChildIndex = leftChildIndex + 1
    var first = index
    if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
      first = leftChildIndex
    }
    if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
      first = rightChildIndex
    }
    if first == index { return }    
    nodes.swapAt(index, first)
    shiftDown(from: first, until: endIndex)
  }
  
  internal mutating func shiftDown(_ index: Int) { shiftDown(from: index, until: nodes.count) }
  
}

/**
 * Your SeatManager object will be instantiated and called as such:
 * let obj = SeatManager(n)
 * let ret_1: Int = obj.reserve()
 * obj.unreserve(seatNumber)
 */