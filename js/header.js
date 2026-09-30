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
            placePag: "Pesquise seus pedidos..."
        }
    ];
    const dataEstoque = [
        {
            pagina: "Estoque",
            subtexto: "Veja a situação do seu estoque de forma rápida e organizada",
            btnText: "Ver código",
            placePag: ""
        }
    ];
    const dataFornecedor = [
        {
            pagina: "Fornecedores",
            subtexto: "Veja a situação do seu estoque de forma rápida e organizada",
            btnText: "Ver código",
            placePag: ""
        }
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
                    <button id="btnHeader" class="headerAction_item">${element.btnText}</button>
                </div>
                `;

            header.append(div);

            let btn = document.querySelector("#btnHeader");

            switch (element.pagina) {
                case 'Produtos':
                    btn.id = 'btnProd';
                    break
                case 'Pedidos':
                    btn.id = 'btnPed';
                    break
            }

        });
    }

    switch (true) {
        case window.location.href.includes("Produto_frame.php"):
            displayHeader(dataProd);
            break;
        case window.location.href.includes("pedidos_frame.php"):
            displayHeader(dataPedidos);
            break;
        case window.location.href.includes("estoque_frame.php"):
            displayHeader(dataEstoque);
            break;
        case window.location.href.includes("fornecedor_frame.php"):
            displayHeader(dataFornecedor);
            break;
    }
}