let userScore = 0;
let compScore = 0;

const choices = document.querySelectorAll(".choice");
const msgPara = document.querySelector("#msg"); 

const userScorePara = document.querySelector("#user-score");
const compScorePara = document.querySelector("#comp-score");

// Generate Computer Choice
const genCompChoice = () => {
    const options = ["rock", "paper", "scissors"];
    // math.floor() => niglect after decimal number
    // math.random() => generate 0 to 1 number
    // math.random() * 3 => generate 0 to 2 number
    const randIdx = Math.floor(Math.random() * 3);
    return options[randIdx];
}

// Draw Function
const drawGame = () => {
    console.log("Game was draw.");
    msgPara.innerText = "Game was Draw. Play again.";
    msgPara.style.backgroundColor = "#081b31";
}

// ShowWinner
const showWinner = (userWin, userChoice, compChoice) => {
    if(userWin) {
        userScore++;
        userScorePara.innerText = userScore;
        console.log("You win!");
        // msgPara.innerText = "You Win!";
        msgPara.innerText = `You Win! Your ${userChoice} beats ${compChoice}`;
        msgPara.style.backgroundColor = "Green";
    } else {
        compScore++;
        compScorePara.innerText = compScore;
        console.log("You lose!");
        // msgPara.innerText = "You Lose.";
        msgPara.innerText = `You Lose. ${compChoice} beats Your ${userChoice}`;
        msgPara.style.backgroundColor = "Red";
    }
} 

// Compare both result
const playGame = (userChoice) => {
    console.log("User Choice : ", userChoice);
    // Generate Computer Choice
    const compChoice = genCompChoice();
    console.log("Computer Choice : ", compChoice);

    // Compare the choice
    if(userChoice === compChoice) {
        // braw
        drawGame();
    } else {
        let userWin = true;
        if(userChoice === "rock") {
            // scissor, paper
            userWin = compChoice === "paper" ? false : true; 
        } else if(userChoice === "paper") {
            // rock, scissor
            userWin = compChoice === "scissors" ? false : true;
        } else {
            // rock, paper
            userWin = compChoice === "rock" ? false : true;
        }
        showWinner(userWin, userChoice, compChoice);
    }
}

// User Choice
choices.forEach((choice) => {
    console.log(choice);
    choice.addEventListener ("click", () => {
        const userChoice = choice.getAttribute("id");
        // console.log("Choice was clicked", userChoice);
        playGame(userChoice);
    })
})