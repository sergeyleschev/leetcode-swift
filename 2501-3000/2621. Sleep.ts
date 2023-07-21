// Solution by Sergey Leschev
// 2621. Sleep

async function sleep(millis: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, millis))
}

/**
 * let t = Date.now()
 * sleep(100).then(() => console.log(Date.now() - t)) // 100
 */
