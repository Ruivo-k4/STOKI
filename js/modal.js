console.log("modal.js is on");

let main = document.querySelector("#mainIndex");

if (main) {
    const modal = document.querySelector("#modalIndex");

    if (modal) {
        const contents = {
            produto: `
                <button id="closeModal">X<button>
                <div class="modalContent">
                    <input type="text" name="nome" class="modalContent_in" placeholder="Nome:">
                    <input type="text" name="marca" class="modalContent_in" placeholder="Marca:">
                    <input type="number" name="qnt" class="modalContent_in in--number" placeholder="Quantidade:">
                    <input type="number" name="val_unit" class="modalContent_in in--number" placeholder="Valor Unitário:">
                    <input type="number" name="val_venda" class="modalContent_in in--number" placeholder="Valor de Venda:">
                    <input type="number" name="val_compra" class="modalContent_in in--number" placeholder="Valor de Compra:">
                    <input type="text" name="lote" class="modalContent_in in--number" placeholder="Lote:">
                    <input type="number" name="peso" class="modalContent_in in--number" placeholder="Peso:">
                    <input type="number" name="qnt_min_rep" class="modalContent_in in--number" placeholder="Quantidade Mínima Reposição:">
                    <input type="number" name="qnt_max_rep" class="modalContent_in in--number" placeholder="Quantidade Máxima Reposição:">
                </div>
            `,
            pedidos: `
                <button id="closeModal">X<button>
                <h1>Pedidos</h1>
            `,
            fornecedores: `
                <button id="closeModal">X<button>
                <h1>Pedidos</h1>
            `,
            estoque: `
                <button id="closeModal">X<button>
                <h1>Estoque</h1>
            `
        }

        const btn = document.querySelector("#btnHeader");

        btn.addEventListener('click', () => {
            modal.style.display = "flex";
            modal.style.width = "80dvw";
            modal.style.height = "80dvh";

            switch (true) {
                case window.location.href.includes('Produto_frame.php'):
                    modal.innerHTML = contents.produto; break;
                case window.location.href.includes('pedidos_frame.php'):
                    modal.innerHTML = contents.pedidos; break;
                case window.location.href.includes('fornecedores_frame.php'):
                    modal.innerHTML = contents.fornecedores; break;
                case window.location.href.includes('estoque_frame.php'):
                    modal.innerHTML = contents.estoque; break;
            }

            modal.showModal();

            let btnClose = document.querySelector("#closeModal");

            btnClose.addEventListener('click', () => {
                modal.close();
                modal.style.width = "0px";
                modal.style.height = "0px";
            });
        });

    }
}