console.log("menu&footer is on");

import { content } from "./datasJs/data_menu.js";

let menu = document.querySelector("#assideIndex");

if (menu) {
    //#region criando menu
    menu.innerHTML = content.completo;
    //#endregion
    switch (true) {
        case window.location.href.includes("Produto_frame.php"):
            let aProd = document.querySelector("#aProd");
            aProd.classList.add('selectAsside');
            break
        case window.location.href.includes('pedidos_frame.php'):
            let aPed = document.querySelector("#aPed");
            aPed.classList.add('selectAsside');
            break
        case window.location.href.includes("financeiro_frame.php"):
            let aFin = document.querySelector("#aFin");
            aFin.classList.add('selectAsside');
            break
        case window.location.href.includes('estoque_frame.php'):
            let aEstq = document.querySelector("#aEstq");
            aEstq.classList.add('selectAsside');
            break
        case window.location.href.includes('fornecedor_frame.php'):
            let aForn = document.querySelector("#aForn");
            aForn.classList.add('selectAsside');
            break
        case window.location.href.includes('clientes_frame.php'):
            let aCli = document.querySelector("#aCli");
            aCli.classList.add('selectAsside');
            break
    }
    //#region capturas
    let btnConfig = document.querySelector('#configurateIndex');

    btnConfig.addEventListener('click', () => {
        window.location.href = "/STOKI/configurate_frame.php";
    });
    //#endregion
}