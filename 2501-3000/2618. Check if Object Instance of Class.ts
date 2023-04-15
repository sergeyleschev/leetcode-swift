// Solution @ Sergey Leschev

function checkIfInstanceOf(obj: any, classFunction: any): boolean {
    if (obj === null || obj === undefined || classFunction === null || classFunction === undefined) {
        return false;
    }

    let prototype = Object.getPrototypeOf(obj);

    while (prototype != null) {
        if (prototype.constructor === classFunction) {
            return true;
        }
        prototype = Object.getPrototypeOf(prototype);
    }

    return false;
}

/**
 * checkIfInstanceOf(new Date(), Date); // true
 */