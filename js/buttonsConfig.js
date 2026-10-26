console.log("buttonsConfig.js is on")

let configDisplay = document.querySelector("#btn-configDisplay");

if (!configDisplay) {
    console.log("configDisplay não responde")
}

let countClick = 0;

configDisplay.addEventListener('click', () => {
    let boxes = document.querySelector(".boxes-config");
    boxes.style.opacity = 0;

    switch (countClick) {
        case 0:
            countClick = 1;
            configDisplay.innerHTML = "Visualização Personalisada";
            configDisplay.style.backgroundColor = "#FFB224";

            boxes.classList.add("boxes-config--ative");
            boxes.style.tramsition = "opacity 0.5s";
            boxes.style.opacity = 1;
            break;
        case 1:
            countClick = 2;
            configDisplay.innerHTML = "Requerimento de Senha";
            configDisplay.style.backgroundColor = "#FF2442";

            boxes.classList.remove("boxes-config--ative");
            break;
        default:
            countClick = 0;
            configDisplay.innerHTML = "Visualização Geral";
            configDisplay.style.backgroundColor = "#247BFF";
            break;

    }
});