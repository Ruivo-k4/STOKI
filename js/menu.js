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
            <li><a href="index.html">Inicio</a></li>
            <li id="aProd"><a href="Produto_frame.html">Produtos</a></li>
            <li><a href="pedidos_frame.html">Pedidos</a></li>
            <li><a href="financeiro_frame.html">Finanças</a></li>
            <li><a href="estoque_frame.html">Estoque</a></li>
        </ul>
    </nav>
    <div class="item" id="assideActions">
        <ul>
            <li>Configurações</li>
            <li>Sair</li>
        </ul>
    </div>
    `;
    //#endregion
    switch (true) {
        case window.location.href.includes("Produto_frame.html"):
            let aProd = document.querySelector("#aProd");
            aProd.classList.add('selectAsside');
            break
    }
    //#region capturas
    //#endregion

}