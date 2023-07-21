// Solution by Sergey Leschev
// 2628. JSON Deep Equal

function areDeeplyEqual(o1: any, o2: any): boolean {
    if (o1 === o2) {
        return true
    }

    if (typeof o1 !== typeof o2) {
        return false
    }

    if (o1 === null || o2 === null || typeof o1 !== 'object') {
        return false
    }

    const keys1 = Object.keys(o1)
    const keys2 = Object.keys(o2)
    if (keys1.length !== keys2.length) {
        return false
    }

    if (o1.constructor !== o2.constructor) {
        return false
    }

    for (const key of keys1) {
        if (!o2.hasOwnProperty(key) || !areDeeplyEqual(o1[key], o2[key])) {
            return false
        }
    }

    return true
}
