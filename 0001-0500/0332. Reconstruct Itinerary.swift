class Solution {

    // Solution by Sergey Leschev

    // 332. Reconstruct Itinerary
    // You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure and the arrival airports of one flight. Reconstruct the itinerary in order and return it.
    // All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with "JFK". If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.
    // For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
    // You may assume all tickets form at least one valid itinerary. You must use all the tickets once and only once.

    // Example 1:
    // Input: tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
    // Output: ["JFK","MUC","LHR","SFO","SJC"]

    // Example 2:
    // Input: tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
    // Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
    // Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"] but it is larger in lexical order.

    // Constraints:
    // 1 <= tickets.length <= 300
    // tickets[i].length == 2
    // fromi.length == 3
    // toi.length == 3
    // fromi and toi consist of uppercase English letters.
    // fromi != toi

    typealias Departure = String
    typealias Destinations = [String]
    typealias Graph = [Departure: Destinations]

    
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var graph = sortDestination(buildGraph(tickets))
        var path = [String]()
        var stack = ["JFK"]
        
        while !stack.isEmpty, let lastAirport = stack.last {
            // no ticket depture from lastAirport OR all tickets have been used
            if graph[lastAirport] == nil || graph[lastAirport]!.isEmpty {
                path.append(lastAirport)
                stack.removeLast()
            } else { // still have tickets not used yet
                let first = graph[lastAirport]!.removeFirst()
                stack.append(first)
            }
        }
        
        return path.reversed()
    }
    
    
    private func buildGraph(_ tickets: [[String]]) -> Graph {
        var graph = Graph()
        for t in tickets {
            let from = t[0], to = t[1]
            graph[from, default: []].append(to)
        }
        return graph
    }
    
    
    private func sortDestination(_ graph: Graph) -> Graph {
        var graph = graph
        for (k, v) in graph { graph[k] = v.sorted(by: <) }
        return graph
    }

}