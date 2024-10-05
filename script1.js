const container = document.querySelector(".container");
const seats = document.querySelectorAll(".row .seat");
const count = document.getElementById("count");
const total = document.getElementById("total");

let selectedSeats = 0;
let seatPrice = 150; // Replace with the actual price per seat

container.addEventListener("click", (e) => {
    if (e.target.classList.contains("seat") && !e.target.classList.contains("occupied")) {
        e.target.classList.toggle("selected");
        updateSelectedSeats();
    }
});

function updateSelectedSeats() {
    const selectedSeatsList = document.querySelectorAll(".row .seat.selected");
    selectedSeats = selectedSeatsList.length;
    count.innerText = selectedSeats;
    total.innerText = selectedSeats * seatPrice;
}
