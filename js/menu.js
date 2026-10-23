console.log("menu&footer is on");

let menu = document.querySelector("#assideIndex");

if (menu) {
    //#region criando menu
    menu.innerHTML = `
    <nav>
        <div id="assideLogo">
            <img src="imgs/logo.png" alt="STOKi" class="asside__img">
        </div>
        <ul>
            <li><a href="index.html">Inicio</a></li>
            <li id="aFin"><a href="financeiro_frame.php">Finanças</a></li>
            <li id="aEstq"><a href="estoque_frame.php">Estoque</a></li>
            <li id="aProd"><a href="Produto_frame.php">Produtos</a></li>
            <li id="aPed"><a href="pedidos_frame.php">Pedidos</a></li>
            <li id="aForn"><a href="fornecedor_frame.php">Fornecedor</a></li>
        </ul>
    </nav>
    <div class="item" id="assideActions">
        <ul>
            <li id="configurateIndex">Configurações</li>
            <li>Sair</li>
        </ul>
    </div>
    `;
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
    }
    //#region capturas
    let btnConfig = document.querySelector('#configurateIndex');

    btnConfig.addEventListener('click', () => {
        window.location.href = "/STOKI/configurate_frame.php";
    });
    //#endregion
}