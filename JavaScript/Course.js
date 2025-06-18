let name = "Kunal Sharma";
let age = 22;
let isMarried = false;

console.log("This person name is " + name + " and age is " + age + ". But not married until.");
console.log(`This person name is ${name}`);

function calculateArithmetic(a, b, type) {
    if (type == "sum") {
        return a + b;
    }
    if (type == "minus") {
        return a - b;
    }
}
let re = calculateArithmetic(10, 2, "minus");
console.log(re);

function greet() {
    console.log("Hello Kunal");
}
// setTimeout(function_call, timePerMillisecond)
setTimeout(greet, 3*1000);
// setInterval(function_call, printAfterComplitingInterval_Repeated)
setInterval(greet, 1*1000);