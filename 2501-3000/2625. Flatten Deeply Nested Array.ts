// Solution by Sergey Leschev
// 2625. Flatten Deeply Nested Array

type MultiDimensionalArray = (number | MultiDimensionalArray)[]

const flat = (arr: MultiDimensionalArray, n: number): MultiDimensionalArray => {
    const result: MultiDimensionalArray = []

    for (const item of arr) {
        if (Array.isArray(item) && n > 0) {
            result.push(...flat(item, n - 1))
        } else {
            result.push(item)
        }
    }

    return result
}
