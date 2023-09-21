import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
    update();
})

document.querySelector("form").addEventListener("submit", async (e) => {
    e.preventDefault();

    const button = e.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true);

    if (document.getElementById("input-amount").value.length != 0) {
        await dbank.topUp(inputAmount);
    }
    else if (document.getElementById("withdrawal-amount").value.length != 0) {
        await dbank.withdraw(outputAmount);
    }
    else {
        alert("Please Enter an Amount!!");
    }

    await dbank.compound();

    update();

    clear();


    button.removeAttribute("disabled");
})

async function update() {
    const currentAmount = (await dbank.checkBalance()).toFixed(2);
    document.getElementById("value").innerText = currentAmount;
}

function clear() {
    document.getElementById("input-amount").value = '';
    document.getElementById("withdrawal-amount").value = '';
}