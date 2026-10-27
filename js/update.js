let btn_arroz = document.querySelectorAll('.fa-pen-to-square"')
console.log(btn_arroz)
btn_arroz.forEach(element=> {
    element.addEventListener('click', ()=>{
        window.location.href="/STOKI/php/sub_pags/update_frame.php"
    })
})