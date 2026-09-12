let main = document.querySelector("#mainIndex");

if (main) {
    //#region boxes
    let boxes = document.querySelector("#mainData");

    const produtosData = [
        { img: "", title: "Total produto", value: 0 },
        { img: "", title: "Em estoque", value: 0 },
        { img: "", title: "Em reposição", value: 0 },
        { img: "", title: "Em excesso", value: 0 }
    ]

    produtosData.forEach((element) => {
        let div = document.createElement('div');
        div.classList.add('data_item');

        div.innerHTML = `
        <img src="${element.img}" alt="${element.title}">
        <div>
            <h3>${element.title}</h3>
            <p>${element.value}</p>
        </div>
        `

        boxes.appendChild(div);
    });
    //#endregion

    //#region table
    let table = document.querySelector("#mainTable");
    //#endRegion
}