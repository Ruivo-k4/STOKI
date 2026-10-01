console.log("modal.js is on");

let main = document.querySelector("#mainIndex");

if (main) {
    const modal = document.querySelector("#modalIndex");
    
    if (modal) {
        const contents = {
            produto:  `
                <button id="closeModal">X<button>
                <h1>Produto</h1>
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
            });
        });
    
    }
}