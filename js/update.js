import { contents } from "./datasJs/data_update.js"
console.log('update.js')
let btn_arroz = document.querySelectorAll('#c-ico')
console.log(btn_arroz)
btn_arroz.forEach(element=> {
    element.addEventListener('click', ()=>{
        window.location.href="/STOKI/php/sub_pags/update_frame.php"
    })
})
let btn_feijao = document.querySelector('#C_form')
console.log(btn_feijao)
if (!btn_feijao){
    console.log('BETA')
}
switch (true) {
                        case window.location.href.includes('Produto_frame.php'):
                            modal.innerHTML = contents.produto;
                            break;
                        case window.location.href.includes('pedidos_frame.php'):
                            modal.innerHTML = contents.pedidos; break;
                        case window.location.href.includes('fornecedor_frame.php'):
                            modal.innerHTML = contents.fornecedores; break;
                        case window.location.href.includes('clientes_frame.php'):
                            modal.innerHTML = contents.clientes; break;
                        default:
                            console.log("Pagina não encontrada")
                    }