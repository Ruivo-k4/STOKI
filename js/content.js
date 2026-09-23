let main = document.querySelector("#mainIndex");

if (main) {
    //#region criação das caixas
    let boxes = document.querySelector("#mainData");

    const produtosData = [
        { img: "", title: "Total produto", value: 0 },
        { img: "", title: "Em estoque", value: 0 },
        { img: "", title: "Em reposição", value: 0 },
        { img: "", title: "Em excesso", value: 0 }
    ];

    const pedidosData = [
        { img: "", title: "Total pedidos", value: 0 },
        { img: "", title: "Pedidos Pendentes", value: 0 },
        { img: "", title: "Pedidos entregues", value: 0 },
        { img: "", title: "Cancelados", value: 0 }
    ];

    const estoqueData = [
        { img: "", title: "Total Itens", value: 0 },
        { img: "", title: "Em estoque", value: 0 },
        { img: "", title: "Em reposição", value: 0 },
        { img: "", title: "Em excesso", value: 0 }
    ];

    function createBoxes(data) {
        data.forEach((element) => {
            let div = document.createElement('div');
            div.classList.add('data_item');

            div.innerHTML = `
                <img src="${element.img}" alt="${element.title}">
                <div>
                    <h3>${element.title}</h3>
                    <p>${element.value}</p>
                </div>
            `;
            
            boxes.appendChild(div);
        });
    }

    switch (true) {
        case window.location.href.includes("Produto_frame.html"):
            createBoxes(produtosData);
            break
        case window.location.href.includes('pedidos_frame.html'):
            createBoxes(pedidosData);
            break
        case window.location.href.includes('estoque_frame.html'):
            createBoxes(estoqueData);
            break
    }
    //#endregion
}