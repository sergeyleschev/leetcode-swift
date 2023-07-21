// Solution by Sergey Leschev
// 2632. Curry

function curry(fn: Function): Function {
    return function curried(...args: any[]) {
        if (args.length >= fn.length) {
            return fn(...args)
        }
        return function (...innerArgs: any[]) {
            return curried(...args, ...innerArgs)
        }
    }
}

/**
 * function sum(a, b) { return a + b; }
 * const csum = curry(sum);
 * csum(1)(2) // 3
 */
