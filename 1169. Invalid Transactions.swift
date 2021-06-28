class Transaction {
    let name:String
    let time:Int
    let price:Int
    let city:String
    var isVaild:Bool
    

    init(transaction: String) {
        let info = transaction.split(separator: ",")
        self.name = String(info[0])
        self.time = Int(String(info[1]))!
        self.price = Int(String(info[2]))!
        self.city = String(info[3])
        self.isVaild = self.price <= 1000
    }

    
    func isVaild(with other:Transaction) -> Bool{
        if self.isVaild {
            self.isVaild = other.city == city ||
                abs(other.time - time) > 60
            other.isVaild = other.isVaild && self.isVaild
        }
        return self.isVaild
    }
    
    
    func toString() -> String { "\(name),\(time),\(price),\(city)" }

}


class Solution {

    // 1169. Invalid Transactions
    // A transaction is possibly invalid if:
    // the amount exceeds $1000, or;
    // if it occurs within (and including) 60 minutes of another transaction with the same name in a different city.
    // You are given an array of strings transaction where transactions[i] consists of comma-separated values representing the name, time (in minutes), amount, and city of the transaction.
    // Return a list of transactions that are possibly invalid. You may return the answer in any order.

    // Example 1:
    // Input: transactions = ["alice,20,800,mtv","alice,50,100,beijing"]
    // Output: ["alice,20,800,mtv","alice,50,100,beijing"]
    // Explanation: The first transaction is invalid because the second transaction occurs within a difference of 60 minutes, have the same name and is in a different city. Similarly the second one is invalid too.

    // Example 2:
    // Input: transactions = ["alice,20,800,mtv","alice,50,1200,mtv"]
    // Output: ["alice,50,1200,mtv"]

    // Example 3:
    // Input: transactions = ["alice,20,800,mtv","bob,50,1200,mtv"]
    // Output: ["bob,50,1200,mtv"]

    // Constraints:
    // transactions.length <= 1000
    // Each transactions[i] takes the form "{name},{time},{amount},{city}"
    // Each {name} and {city} consist of lowercase English letters, and have lengths between 1 and 10.
    // Each {time} consist of digits, and represent an integer between 0 and 1000.
    // Each {amount} consist of digits, and represent an integer between 0 and 2000.

    func invalidTransactions(_ transactions: [String]) -> [String] {
        var map = [String: [Transaction]]()
        var result = [Transaction]()

        for transaction in transactions {
            let entiy = Transaction(transaction: transaction)
            if var value = map[entiy.name]{
                value.append(entiy)
                map[entiy.name] = value
            } else {
                map[entiy.name] = [entiy]
            }
        }
        
        for (_,value) in map {
            for transaction in value {
                for other in value where !transaction.isVaild(with: other) { result.append(transaction); break }
            }
        }
        
        return result.map({ $0.toString() })
    }

}