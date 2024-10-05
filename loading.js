document.addEventListener("DOMContentLoaded", function () {
    const loadingScreen = document.querySelector(".loading-screen");
    const content = document.querySelector(".content");

    setTimeout(() => {
        loadingScreen.style.display = "none";
        content.classList.remove("hidden");
    }, 5000);
});
