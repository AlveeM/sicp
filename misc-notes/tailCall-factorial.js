function factorial(n) {
  return trampoline(factorialRec)(n);
}

function factorialRec(n, product = 1n) {
  if (n <= 1) return product;
  return () => factorialRec(n - 1, BigInt(n) * product);
}

function trampoline(f) {
  return function (...args) {
    let result = f(...args);
    while (typeof result === "function") {
      result = result();
    }
    return result;
  };
}

let f = factorialRec(5);

console.log(f);
console.log((f = f()));
console.log((f = f()));
console.log((f = f()));
console.log((f = f()));