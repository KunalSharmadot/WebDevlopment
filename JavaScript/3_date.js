
function dateMethods() {
    const currentDate = new Date();
    console.log("Current Date: ", currentDate);

    // Getting various components of the date
    console.log("Date:", currentDate.getDate());
    console.log("Month:", currentDate.getMonth() + 1);  // Months are zero-indexed, so adding 1
    console.log("Year:", currentDate.getFullYear());
    console.log("Hours:", currentDate.getHours());
    console.log("Minutes:", currentDate.getMinutes());
    console.log("Seconds:", currentDate.getSeconds());

    // Setting components of the date
    currentDate.setFullYear(2022);
    console.log("After setFullYear:", currentDate);

    // Setting month to Jun (Zero-Indexed)
    currentDate.setMonth(5);
    console.log("After setMonth:", currentDate);

    // getting and setting time in millisecond since 1970
    console.log("Time in milliseconds since 1970:", currentDate.getTime());

    // Creating a new date
    const newDate = new Date(2023, 8, 15);
    console.log("New Date:", newDate);
}
// Example Usage for Date Methods
dateMethods();

// Here Every Second Change print the time in milliseconds
function currentTimePrint() {
    console.log(new Date().getTime());
}
// setInterval(currentTimePrint, 1000);

// JSON : Interchange between strings and objects
// Useses : perticularly used for get data from server in strings format.
// JSON.parse
const users = '{"name": "Kunal Sharma", "age": "22", "gender": "Male"}';
const user = JSON.parse(users);
console.log(user["gender"]);
// JSON.stringify
const myUser = {
    name: "kunal",
    age: 22
}
// console.log(myUser["name"]);
const finalString = JSON.stringify(myUser);
console.log(finalString);
