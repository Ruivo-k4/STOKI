console.log("menu&footer is on");

//#region elementos criados
//#endregion

//#region menu
const header = document.querySelector("#header");
const logo = '#';

if (header) {
    //icone
    const icon = `<div id="header-img"><img src="${logo}" alt="STOKI"></div>`;

    //navegação
    const a = '<a href = "#">link</a>';

    const li = `<li>${a}</li>`.repeat(3);

    const ul = `<ul>${li}</ul>`;

    //botões de ação
    const login = '<button>logar</button>';
    const register = '<button>Registrar</button>';

    const divButtons = `<div>${login}${register}</div>`;
    
    header.innerHTML = `${icon}<nav>${ul}</nav>${divButtons}`;
}
//#endregion

//#region footer

//#endregion