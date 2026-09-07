console.log("menu&footer is on");

let menu = document.querySelector("#assideIndex");

if (menu) {
    //#region criando menu
    menu.innerHTML = `
    <nav>
        <div id="assideLogo">
            <img src="#" alt="STOKI">
        </div>
        <ul>
            <li class="selectAsside"><a href="index.html">Inicio</a></li>
            <li><a href="Produtos">Produtos</a></li>
            <li>Pedidos</li>
            <li>Financeiro</li>
            <li>Estoque</li>
        </ul>
    </nav>
    <div class="item" id="assideActions">
        <ul>
            <li>Configurações</li>
            <li>Sair</li>
        </ul>
    </div>
    `
    //#endregion

    //#region capturas
    //#endregion

}