// Javascript is dynamically Typed language : No need to define datatype
// Shortcut Keys
/* 
    clrt + L = clear console

*/
// Basic Knowledge
    console.log("Some Text");   //Used for output
    // alert("Alert Message");     //browser give alert message to user

// variable in js : Variables are containers for data
    // Rules
    /*
    1. Variable name are case senstive
    2. Only letters, digits, underscore(_) and $ are allowed. (not even space)
    3. Only a letter, underscore(_) and $ should be first character.
    4. Reserve words cannot ber variable.
    */
   {
       fullname = "Tony Stark";
       console.log(fullname);
       price = 150.366;
       console.log(price);
       x = null;
       console.log(x);
       y = undefined;
       console.log(y);
       isFollow = false;
       console.log(isFollow);
    }
    // Total Keywords in JS is 63
    /*
    // Name of variable declaration pattern.
    fullName : Camel Case
    FullName : Pascal Case
    full_name : Snake Case
    full-name : Kabab Case
    */
// Recommended Variable Definition are written bellow 
    /*
        var : Variable can be re-declared and updated. A global scope variable.
        let : Variable cannot be re-declared but can be update. A block Scope variable.
        const : Variable cannot be re-declared or updated. A block Scope variable.
    */
    // We cannot use var   
    {   
        var age = 35;
        var age = 25;
        console.log(age);
    }
    // Preferred to use let
    {
        let fullName = "Kunal Sharma";
        fullName = "Hell Kunal";
        console.log(fullName);
    }
    // constant
    {
        const PI = 3.14;
        console.log("PI",PI);
    }

// Datatypes in Javascript : 
    // Primitive Datatypes (7) : Number, String, Boolean, Undefined, Null, Biglnt, Symbol
    {
        let age = 25;
        console.log(typeof age);
        // output : number
        let sureName = "Rajpoot";
        console.log(typeof sureName);
        // string
        let isFollow = true;
        console.log(typeof isFollow);
        // boolean
        let a;
        console.log(typeof a);
        // undefined
        let nu = null;
        console.log(typeof nu);
        // Object
        let num = BigInt("12345");
        console.log(typeof num);
        // bigint
        let sym = Symbol("Hello!");
        console.log(typeof sym);
    }

    // Non-Primitive Datatype : Objects (Array, functions)
    // Objects : It is collection of values
    {
        const student = {
            // Key : value
            fullName : "Rahul Kumar",
            age : 20,
            cgpa : 8.2,
            isPass: true
        };
        console.log(student);
        console.log(student["fullName"]);
        // student.age = student.age + 1;
        // student["age"] = student["age"] + 5;
        student.age = 25;
        console.log(student.age);
        console.log("Student Type: ", typeof student);
    }
// Operators in JS
    // Arithmetic Operators : +, -, *, /, Modulus, Exponentiation, Increment, Decrement.
    /*
    // operands operator operands
        a + b = expression
    */
    {
        let a = 5;
        let b = 2;
        console.log("Addition :", a + b);
        console.log("a =",a ,"& b =",b);
        console.log("Substraction :", a - b);
        console.log("Multiplication :", a * b);
        console.log("Division :", a / b);
        console.log("Exponentiation :", a ** b);
        // Unary Operator
        console.log("Increment :",++a);
        console.log("Decrement :",a--);
        console.log("Final :",a);
    }
    // Assignment Operator : (=, +=, *=, -=, /=, %=, **=)
    // Comparision Operators : (==, !=, >=, <=, <, >, ===(equal to & type), !==(Not equal to & type))
    {
        let a = 7;
        let b = "7";
        console.log("a == b : ", a == b);
        console.log("a === b : ", a === b);
    }
    // Logical Operators (&&, ||, !)

// Conditional Statement : if, if-else, else-if, switch case
    {
        let age = 25;
        if(age < 18) {
            console.log("Junior");
        } else if(age > 60){
            console.log("Senior");
        } else {
            console.log("Middle");
        }
    }
// Ternary Operator : condition ? true output : false output;
    {
        let age = 25;
        // (age > 18) ? console.log("Adult") : console.log("Not Adult");
        let store = (age > 18) ? "Adult" : "Not Adult";
        console.log(store);
    }

// Input From User Using prompt("");
    /*
        let fName = prompt("What's your name : ");
        console.log(fName);
    */

// Loops in JS : (for loop, while loop, do-while loop, for-of loop)
    for (let i = 1; i <= 5; i++)
    {
        console.log("For Loop");
    }
    /*
    while (Condition){
        // do some work
    }
    do{
        // do some work
    }while(Condition);
    */

    // for-of loop : lopping on array and string
    let str = "New";
    for(let i of str){
        console.log(i);
    }

    // for-in loop : used for object
    let student = {
        fullName : "Kunal",
        age : 25,
    };
    for(let keys in student){
        console.log(keys, student[keys]);
    }