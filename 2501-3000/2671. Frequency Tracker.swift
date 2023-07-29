class FrequencyTracker {

    // Solution by Sergey Leschev
    // 2671. Frequency Tracker

    var frequencyCount: [Int: Int]  // store number & frequency count
    var numberSetByFrequency: [Int: Set<Int>]  // store frequency & set of number whose frequency is the same

    init() {
        frequencyCount = [:]
        numberSetByFrequency = [:]
    }

    func add(_ number: Int) {
        if let currentFrequency = frequencyCount[number] {
            numberSetByFrequency[currentFrequency]?.remove(number)
        }

        frequencyCount[number, default: 0] += 1

        if let currentFrequency = frequencyCount[number] {
            numberSetByFrequency[currentFrequency, default: Set<Int>()].insert(number)
        }
    }

    func deleteOne(_ number: Int) {
        if let currentFrequency = frequencyCount[number], currentFrequency > 0 {
            numberSetByFrequency[currentFrequency]?.remove(number)
            frequencyCount[number]! -= 1

            if frequencyCount[number]! > 0 {
                numberSetByFrequency[frequencyCount[number]!, default: Set<Int>()].insert(number)
            }
        }
    }

    func hasFrequency(_ frequency: Int) -> Bool {
        return numberSetByFrequency[frequency]?.isEmpty == false
    }
}

/**
 * Your FrequencyTracker object will be instantiated and called as such:
 * let obj = FrequencyTracker()
 * obj.add(number)
 * obj.deleteOne(number)
 * let ret_3: Bool = obj.hasFrequency(frequency)
 */
