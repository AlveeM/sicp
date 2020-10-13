// From Chuck

function factorial(n) {
  return trampoline(factorialRec)(n);
}

// function factorial(n, product) {
//   if (n <= 1) return product;
//   return factorial(n - 1, n * product);
// }

function factorialRec(n, product = 1n) {
  if (n <= 1) return product;
  return () => factorialRec(n - 1, BigInt(n) * product); // thunk
}

let t = factorialRec(50_000) //  t === () => fact(49_999, prod)
t = t() // t === () => fact(49_998, prod)
t = t() // t === () => fact(49_997, prod)
// ...
t = t() // t === prod

function trampoline(f) {
  return function (...args) {
    let result = f(...args);
    while (typeof result === 'function') {
      result = result();
    }
    return result;
  }
}

let f = factorialRec(5);
console.log(f);
console.log((f = f()));
console.log((f = f()));
console.log((f = f()));
console.log((f = f()));

// // const even = (n) => n === 0 || odd(n - 1);
// // const odd = (n) => !even(n);

// const evenRec = (n) => n === 0 || (() => odd(n - 1));
// const even = (n) => trampoline(evenRec)(n);

// const oddRec = (n) => () => !even(n);
// const odd = (n) => trampoline(oddRec)(n);

// recursive even and odd
// const even = (n) => n === 0 || odd(n - 1);
// const odd = (n) => !even(n);


// fixed tail call
const evenRec = (n) => n === 0 || (() => oddRec(n - 1));
const oddRec = (n) => n !== 0 && (() => evenRec(n - 1));
const even = (n) => trampoline(evenRec)(n);
const odd = (n) => !even(n);

console.log(even(50001)); // false
console.log(even(10))
console.log(odd(10))
console.log(odd(11))
console.log(odd(20000))