// Solution @ Sergey Leschev

function jsonStringify(object: any): string {
    if (object === null || object === undefined) {
        return "null";
    } else if (typeof object === "boolean" || typeof object === "number") {
        return object.toString();
    } else if (typeof object === "string") {
        return `"${object}"`;
    } else if (Array.isArray(object)) {
        const values = object.map(jsonStringify);
        return `[${values.join(",")}]`;
    } else if (typeof object === "object") {
        const keys = Object.keys(object);
        const values = keys.map(key => `${jsonStringify(key)}:${jsonStringify(object[key])}`);
        return `{${values.join(",")}}`;
    } else {
        throw new Error(`Invalid type: ${typeof object}`);
    }
}  