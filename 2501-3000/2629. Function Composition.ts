// Solution @ Sergey Leschev

type F = (x: number) => number;

function compose(functions: F[]): F {
    return functions.reduceRight((prevFn, nextFn) => {
        return (x) => nextFn(prevFn(x));
    }, (x) => x);
};

/**
 * const fn = compose([x => x + 1, x => 2 * x])
 * fn(4) // 9
 */