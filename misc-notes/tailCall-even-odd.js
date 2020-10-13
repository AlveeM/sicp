// recursive even and odd
// const even = (n) => n === 0 || odd(n - 1);
// const odd = (n) => !even(n);


// fixed tail call
const evenRec = (n) => n === 0 || (() => oddRec(n - 1));
const oddRec = (n) => n !== 0 && (() => evenRec(n - 1));
const even = (n) => trampoline(evenRec)(n);
const odd = (n) => !even(n);