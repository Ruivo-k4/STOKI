console.log("modal.js is on");

const header = document.querySelector("#headerIndex");

if (header) {
    const modal = document.querySelector("#modal");

    const btnProd = document.querySelector("#btnProdutos");
    const btnPed = document.querySelector("#btnPedidos");
    const btnForn = document.querySelector("#btnFornecedores");

    btnProd.addEventListener('click', () => {
        modal.showModal();

        modal.innerHTML = `
            <button id="closeModal">X</button>
        `;

        let btnClose = document.querySelector("#closeModal")

        btnClose.addEventListener('click', () => {
            modal.close();
        });
    });
}