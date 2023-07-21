// Solution by Sergey Leschev
// 2622. Cache With Time Limit

class TimeLimitedCache {
    private cache: Map<number, [number, number]> // [value, expiration time]

    constructor() {
        this.cache = new Map()
    }

    set(key: number, value: number, duration: number): boolean {
        const expirationTime = Date.now() + duration
        const existingValue = this.cache.get(key)
        if (existingValue !== undefined && existingValue[1] > Date.now()) {
            // Key already exists and hasn't expired yet, so update value and expiration time
            existingValue[0] = value
            existingValue[1] = expirationTime
            return true
        } else {
            // Key doesn't exist or has expired, so add new value with expiration time
            this.cache.set(key, [value, expirationTime])
            return false
        }
    }

    get(key: number): number {
        const valueAndExpiration = this.cache.get(key)
        if (valueAndExpiration !== undefined && valueAndExpiration[1] > Date.now()) {
            // Key exists and hasn't expired yet, so return value
            return valueAndExpiration[0]
        } else {
            // Key doesn't exist or has expired, so return -1
            return -1
        }
    }

    count(): number {
        // Count number of unexpired keys
        let count = 0
        for (const [_, valueAndExpiration] of this.cache) {
            if (valueAndExpiration[1] > Date.now()) {
                count++
            }
        }
        return count
    }
}

/**
 * Your TimeLimitedCache object will be instantiated and called as such:
 * var obj = new TimeLimitedCache()
 * obj.set(1, 42, 1000); // false
 * obj.get(1) // 42
 * obj.count() // 1
 */
