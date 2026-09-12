let header = document.querySelector("#headerIndex");

if (header) {
    let pagina = "pagina";
    let subtexto = "subtexto";

    header.innerHTML = `
    <div class="header_item" id="headerTitle">
        <h1>${pagina}</h1>
        <p>${subtexto}</p>
    </div>
    <div class="header_item" id="headerAction">
         <input type="text" name="pesquisa" id="inTable" placeholder="sua pesquisa" class="headerAction_item">
         <button id="btn${pagina}" class="headerAction_item">+ Novo elemento</button>
    </div>
    `;
}