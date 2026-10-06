console.log("modal.js is on");

import { styleModal } from "./style_modal.js";
import { contents } from "./datasJs/data_modal.js"

let main = document.querySelector("#mainIndex");

if (main) {
    const modal = document.querySelector("#modalIndex");

    if (modal) {
        function close(modal) {
            modal.close();
            modal.style.display = "none";
            modal.style.width = "0px";
            modal.style.height = "0px";
        }

        modal.classList.add("modal--ative");

        const btn = document.querySelector("#btnHeader");

        btn.addEventListener('click', () => {
            styleModal(modal)

            switch (true) {
                case window.location.href.includes('Produto_frame.php'):
                    modal.innerHTML = contents.produto;
                    modal.classList.add("modal--ative");
                    break;
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
                close(modal);
            });

            let btnCan = document.querySelector("#calcelCad");

            btnCan.addEventListener('click', () => {
                close(modal);
            });

        });
    }
}