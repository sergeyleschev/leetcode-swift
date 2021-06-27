class Solution {

    // 1094. Car Pooling
    // You are driving a vehicle that has capacity empty seats initially available for passengers.  The vehicle only drives east (ie. it cannot turn around and drive west.)
    // Given a list of trips, trip[i] = [num_passengers, start_location, end_location] contains information about the i-th trip: the number of passengers that must be picked up, and the locations to pick them up and drop them off.  The locations are given as the number of kilometers due east from your vehicle's initial location.
    // Return true if and only if it is possible to pick up and drop off all passengers for all the given trips. 

    // Finds if it is possible to pick up and drop off all passengers for all the given trips.

    // - Parameters:
    //   - trips: A list of trips.
    //   - capacity: A number of empty seats.
    // - Returns: True if it is possible, otherwise returns false.

    // Example 1:
    // Input: trips = [[2,1,5],[3,3,7]], capacity = 4
    // Output: false

    // Example 2:
    // Input: trips = [[2,1,5],[3,3,7]], capacity = 5
    // Output: true

    // Example 3:
    // Input: trips = [[2,1,5],[3,5,7]], capacity = 3
    // Output: true

    // Example 4:
    // Input: trips = [[3,2,7],[3,7,9],[8,3,9]], capacity = 11
    // Output: true 

    // Constraints:
    // trips.length <= 1000
    // trips[i].length == 3
    // 1 <= trips[i][0] <= 100
    // 0 <= trips[i][1] < trips[i][2] <= 1000
    // 1 <= capacity <= 100000

    // - Complexity:
    //   - time: O(max(n, 1_001)), where n is the number of `trips`.
    //   - space: O(1), only constant space is used.
    
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var timestamp = [Int](repeating: 0, count: 1_001)
        var used = 0

        for trip in trips {
            timestamp[trip[1]] += trip[0]
            timestamp[trip[2]] -= trip[0]
        }

        for time in timestamp {
            used += time
            guard used > capacity else { continue }
            return false
        }

        return true
    }

}