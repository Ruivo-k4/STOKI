console.log("cadIndex.js is on");

import { content } from "./datasJs/data_cadHero.js";

function displayHero(hero) {
    hero.innerHTML = `
        <button id="hero_btnBack"><i class="fa-solid fa-arrow-left-long"></i></button>
        <img src="/STOKI/imgs/logo.png" alt="STOKI" class="hero__img">
        <h1 class="hero__title">Mais controle. Mais resultado</h1>
        <i class="fa-sharp fa-solid fa-box-open"></i>
        <h2>Gerencie seu estoque, pedidos, financeiro e muito mais</h2>
    `;
}

let cadConteiner = document.querySelector("#cadContainer-index");

if (cadConteiner) {
    let hero = document.querySelector("#heroCad-index");

    if (!hero) {
        console.log(hero);
    }

    displayHero(hero);

    let cForm = document.querySelector("#container--form");
    
    switch (true) {
        case window.location.href.includes('cadAdm.php'):
            cForm.innerHTML = content.adm; break;
        case window.location.href.includes('cadFun.php'):
            cForm.innerHTML = content.fun; break;
        case window.location.href.includes('login_adm.php'):
            cForm.innerHTML = content.lAdm; break;
        case window.location.href.includes('login_fun.php'):
            cForm.innerHTML = content.lFun; break;
    }

    let btnBack = document.querySelector("#hero_btnBack");

    btnBack.addEventListener('click', () => {
        window.history.back();
    });
}