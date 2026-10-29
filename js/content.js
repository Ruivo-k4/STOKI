let main = document.querySelector("#mainIndex");

if (main) {
    //#region criação das caixas
    let boxes = document.querySelector("#mainData");

    const produtosData = [
        { img: "fa-sharp fa-solid fa-boxes-stacked", title: "Total produto", value: 0 },
        { img: "fa-shar fa-solid fa-grip", title: "Em estoque", value: 0 },
        { img: "fa-solid fa-truck-ramp-box", title: "Em reposição", value: 0 },
        { img: "fa-solid fa-circle-xmark", title: "Em excesso", value: 0 }
    ];

    const pedidosData = [
        { img: "fa-duotone fa-solid fa-newspaper", title: "Total pedidos", value: 0 },
        { img: "fa-duotone fa-solid fa-hourglass-half", title: "Pedidos Pendentes", value: 0 },
        { img: "fa-solid fa-circle-check", title: "Pedidos entregues", value: 0 },
        { img: "fa-solid fa-circle-xmark", title: "Cancelados", value: 0 }
    ];

    const estoqueData = [
        { img: "fa-sharp fa-solid fa-boxes-stacked", title: "Total Itens", value: 0 },
        { img: "fa-shar fa-solid fa-grip", title: "Em estoque", value: 0 },
        { img: "fa-solid fa-truck-ramp-box", title: "Em reposição", value: 0 },
        { img: "fa-solid fa-circle-xmark", title: "Em excesso", value: 0 }
    ];

    const fornecedorData = [
        { img: "fa-solid fa-user-tie", title: "Total de fornecedores", value: 0},
        { img: "fa-solid fa-user-minus", title: "Devedores", value: 0},
        { img: "fa-solid fa-circle-xmark", title: "Dívidas", value: 0},
        { img: "fa-solid fa-user-slash", title: "Fornecedores inativos", value: 0}
    ];

    const clienteData = [
        { img: "fa-solid fa-user-tie", title: "Total de Clientes", value: 0},
        { img: "fa-solid fa-user-minus", title: "Devedores", value: 0},
        { img: "fa-solid fa-circle-xmark", title: "Dívidas", value: 0},
        { img: "fa-solid fa-user-slash", title: "Clientes inativos", value: 0}
    ];

    function createBoxes(data) {
        data.forEach((element) => {
            let div = document.createElement('div');
            div.classList.add('data_item');

            div.innerHTML = `
                <i class="${element.img} data__i"></i>
                <div class="group">
                    <h3>${element.title}</h3>
                    <p>${element.value}</p>
                </div>
            `;
            
            boxes.appendChild(div);
        });
    }

    switch (true) {
        case window.location.href.includes("Produto_frame.php"):
            createBoxes(produtosData);
            break
        case window.location.href.includes('pedidos_frame.php'):
            createBoxes(pedidosData);
            break
        case window.location.href.includes('estoque_frame.php'):
            createBoxes(estoqueData);
            break
        case window.location.href.includes('fornecedor_frame.php'):
            createBoxes(fornecedorData);
            break
        case window.location.href.includes('clientes_frame.php'):
            createBoxes(clienteData);
            break
    }
    //#endregion
}