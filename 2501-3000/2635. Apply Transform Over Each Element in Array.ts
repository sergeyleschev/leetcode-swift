// Solution by Sergey Leschev
// 2635. Apply Transform Over Each Element in Array

function map(arr: number[], fn: (n: number, i: number) => number): number[] {
    const result: number[] = []
    for (let i = 0; i < arr.length; i++) {
        result.push(fn(arr[i], i))
    }
    return result
}
