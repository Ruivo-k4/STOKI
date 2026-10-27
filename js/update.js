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
btn_feijao.innerHTML = contents.produto