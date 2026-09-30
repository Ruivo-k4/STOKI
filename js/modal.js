console.log("modal.js is on");

const header = document.querySelector("#headerIndex");

if (header) {
    const modal = document.querySelector("#modal");

    const btnProd = document.querySelector("#btnProd");

    btnProd.addEventListener('click', () => {
        modal.showModal();

        modal.innerHTML = `
            <button id="closeModal">X</button>

            <div class="modal_item">
                <input type="text" name="nome" class="modal_in" placeholder="Nome:">
                <input type="text" name="marca" class="modal_in" placeholder="Marca:">
                <input type="text" name="gtin" class="modal_in" placeholder="Código de barras:">
                <input type="number" name="qnt" class="modal_in number--in" placeholder="Quantidade:">
                <input type="number" name="val_unit" class="modal_in number--in" placeholder="Valor unitario:">
                <input type="number" name="val_compra" class="modal_in number--in" placeholder="Valor de compra:">
                <input type="number" name="val_venda" class="modal_in number--in" placeholder="Valor de venda:">
                <input type="text" name="lote" class="modal_in number--in" placeholder="Lote:">
                <input type="number" name="peso" class="modal_in number--in" placeholder="Peso:">
                <unput type="number" name="min_rep" class="modal_in number--in" placeholder="Minimo para repor:">
                <input type="text" name="desc" class="modal_in" placeholder="Descrição:">
            </div>
        `;

        let btnClose = document.querySelector("#closeModal")

        btnClose.addEventListener('click', () => {
            modal.close();
        });
    });
}