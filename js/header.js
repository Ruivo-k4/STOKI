let header = document.querySelector("#headerIndex");

if (header) {
    const dataProd = [
        {
            pagina: "Produtos",
            subtexto: "Gerencie seus produtos de forma simples e rápida",
            btnText: "+ Novo produto",
            placePag: "Pesquise seu produto..."
        }
    ];
    const dataPedidos = [
        { 
            pagina: "Pedidos", 
            subtexto: "Acompanhe e gerencie seus pedidos", 
            btnText: "+ Novo Pedido", 
            placePag: "Pesquise seus pedidos..." }
    ];
    const dataEstoque = [
        { 
            pagina: "Estoque", 
            subtexto: "Veja a situação do seu estoque de forma rápida e organizada", 
            btnText: "Ver código", 
            placePag: "" }
    ];

    function displayHeader(data) {
        data.forEach(element => {
            let div = document.createElement('div');
            div.classList.add("headerIndex_div");

            div.innerHTML = `
                <div class="header_item" id="headerTitle">
                    <h1>${element.pagina}</h1>
                    <p>${element.subtexto}</p>
                </div>
                <div class="header_item" id="headerAction">
                    <input type="text" name="pesquisa" id="inTable" placeholder="sua pesquisa" class="headerAction_item">
                    <button id="btn${element.pagina}" class="headerAction_item">${element.btnText}</button>
                </div>
            `;

            header.append(div);
        });
    }

    switch (true) {
        case window.location.href.includes("Produto_frame.html"):
            displayHeader(dataProd);
            break;
        case window.location.href.includes("pedidos_frame.html"):
            displayHeader(dataPedidos);
            break;
        case window.location.href.includes("estoque_frame.html"):
            displayHeader(dataEstoque);
            break;
    }
}