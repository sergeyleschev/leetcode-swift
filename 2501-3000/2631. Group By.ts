// Solution by Sergey Leschev
// 2631. Group By

declare global {
    interface Array<T> {
        groupBy(fn: (item: T) => string): Record<string, T[]>
    }
}

Array.prototype.groupBy = function (fn) {
    return this.reduce((result, item) => {
        const key = fn(item)
        if (!result[key]) {
            result[key] = []
        }
        result[key].push(item)
        return result
    }, {})
}

/**
 * [1,2,3].groupBy(String) // {"1":[1],"2":[2],"3":[3]}
 */
