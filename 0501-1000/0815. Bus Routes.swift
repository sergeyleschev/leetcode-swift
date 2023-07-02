class Solution {

    // Solution by Sergey Leschev

    // 815. Bus Routes
    // You are given an array routes representing bus routes where routes[i] is a bus route that the ith bus repeats forever.
    // For example, if routes[0] = [1, 5, 7], this means that the 0th bus travels in the sequence 1 -> 5 -> 7 -> 1 -> 5 -> 7 -> 1 -> ... forever.
    // You will start at the bus stop source (You are not on any bus initially), and you want to go to the bus stop target. You can travel between bus stops by buses only.
    // Return the least number of buses you must take to travel from source to target. Return -1 if it is not possible.

    // Example 1:
    // Input: routes = [[1,2,7],[3,6,7]], source = 1, target = 6
    // Output: 2
    // Explanation: The best strategy is take the first bus to the bus stop 7, then take the second bus to the bus stop 6.

    // Example 2:
    // Input: routes = [[7,12],[4,5,15],[6],[15,19],[9,12,13]], source = 15, target = 12
    // Output: -1

    // Constraints:
    // 1 <= routes.length <= 500.
    // 1 <= routes[i].length <= 10^5
    // All the values of routes[i] are unique.
    // sum(routes[i].length) <= 10^5
    // 0 <= routes[i][j] < 10^6
    // 0 <= source, target < 10^6

    func numBusesToDestination(_ routes: [[Int]], _ S: Int, _ T: Int) -> Int {
        let routes = routes.map { Array(Set($0)) }
        var routesOf = [Int: [Int]]()
        var queue = [(stop: S, level: 0)]
        var routeVisited = Set<Int>()
        var index = queue.startIndex

        for (routeIdx, route) in routes.enumerated() {
            for stop in route { routesOf[stop, default: []].append(routeIdx) }
        }

        while index != queue.endIndex {
            let (stop, level) = queue[index]
            index += 1
            if stop == T { return level }

            guard let nextRoutes = routesOf[stop] else { continue }
            for nextRoute in nextRoutes where !routeVisited.contains(nextRoute) {
                for nextStop in routes[nextRoute] { queue.append((nextStop, level + 1)) }
                routeVisited.insert(nextRoute)
            }
        }

        return -1
    }

}
