export const contents = {
    produto: `
        <div class="header">
            <h1 class="header__title">Cadastro Produto</h1>
            <div class="content">
                <button class="header_btn" id="closeModal">X</button>
            </div>
        </div>
        <form action="/STOKI/php/cadProd.php" method="POST">
            <h1 class="modal__title">Informações Produto</h1>
            <div class="info">
                <input type="text" name="nome" placeholder="Nome:" class="info_in in--text">
                <input type="text" name="marca" placeholder="Marca:" class="info_in in--text">
                <input type="text" name="gtin" placeholder="Código de barras:" class="info_in in--text">
                <input type="text" name="local_estoque" placeholder="Localização Estoque:" class="info_in in--text">
                <div class="group">
                    <input type="number"  step="any" min="0" name="quantidade" placeholder="Quantidade" class="group__in in--number">
                    <input type="number"  step="any" min="0" name="peso" placeholder="Peso" class="group__in in--number">
                </div>
                <details class="desc">
                    <summary>Descrição</summary>
                    <input type="text" name="desc" class="desc__in" placeholder="Coloque sua descrição aqui...">
                </details>
            </div>
            <h1 class="modal__title">Informações Estoque</h1>
            <div class="estoque">
                <input type="text" name="lote" placeholder="Lote:" class="estoque__in in--text">
                <div class="group">
                    <input type="number"  step="any" min="0" name="min_repor" placeholder="Min. para repor" class="group__in in--number">
                    <input type="number"  step="any" min="0" name="max_repor" placeholder="Max. para repor" class="group__in in--number">
                </div>
            </div>
            <h1 class="modal__title">Valores Produto</h1>
            <div class="values">
                <div class="card">
                    <h2 class="card__title">Valor Unitário</h2>
                    <label for="val_unit">R$</label>
                    <input type="number"  step="any" name="val_unit" min="0">
                </div>
                <div class="card">
                    <h2 class="card__title">Valor Venda</h2>
                    <label for="val_vend">R$</label>
                    <input type="number"  step="any" name="val_vend" min="0">
                </div>
                <div class="card">
                    <h2 class="card__title">Valor Compra</h2>
                    <label for="val_com">R$</label>
                    <input type="number"  step="any" name="val_com" min="0">
                </div>
            </div>
            <div class="footer">
                <button type="button" class="footer__btn" id="calcelCad">Cancelar</button>
                <button type="submit" class="footer__btn" id="saveCad">Cadastrar</button>
            </div>
        </form>
    `,
    pedidos: `
             <div class="header">
            <h1 class="header__title">Cadastro Pedidos</h1>
            <div class="content">
                <button class="header_btn" id="closeModal">X</button>
            </div>
        </div>
        <form action="/STOKI/php/cadPed.php" method="POST">
            <h1 class="modal__title">Informações Produto</h1>
            <div class="info">
                <input type="number" name="qnt" placeholder="Quantidade:" class="info_in in--text">
                <input type="number" name="val_unit" placeholder="Valor Unitário:" class="info_in in--text">
                <input type="number" name="val_vend" placeholder="Valor da venda:" class="info_in in--text">
                <input type="text" name="forma_pagamento" placeholder="Forma de pagamento:" class="info_in in--text">
                <input type="text" name="situacao" placeholder="Situação:" class="info_in in--text">
                <div class="group">
                    <input type="number" min="0" name="quantidade" placeholder="Quantidade" class="group__in in--number">
                    <input type="number" min="0" name="peso" placeholder="Peso" class="group__in in--number">
                </div>
                <details class="desc">
                    <summary>DETALHES</summary>
                    <input type="text" name="desc" class="desc__in" placeholder="Coloque sua descrição aqui...">
                </details>
            </div>
            <h1 class="modal__title">Informações Estoque</h1>
            <div class="estoque">
                <input type="text" name="lote" placeholder="Lote:" class="estoque__in in--text">
                <div class="group">
                    <input type="number" min="0" name="min_repor" placeholder="Min. para repor" class="group__in in--number">
                    <input type="number" min="0" name="max_repor" placeholder="Max. para repor" class="group__in in--number">
                </div>
            </div>
            <h1 class="modal__title">Valores Produto</h1>
            <div class="values">
                <div class="card">
                    <h2 class="card__title">Valor Unitário</h2>
                    <label for="val_unit">R$</label>
                    <input type="number" name="val_unit" min="0">
                </div>
                <div class="card">
                    <h2 class="card__title">Valor Venda</h2>
                    <label for="val_vend">R$</label>
                    <input type="number" name="val_vend" min="0">
                </div>
                <div class="card">
                    <h2 class="card__title">Valor Compra</h2>
                    <label for="val_com">R$</label>
                    <input type="number" name="val_com" min="0">
                </div>
            </div>
            <div class="footer">
                <button type="button" class="footer__btn" id="calcelCad">Cancelar</button>
                <button type="submit" class="footer__btn" id="saveCad">Cadastrar</button>
            </div>
        </form>
    `,
    fornecedores: `
             <div class="header">
            <h1 class="header__title">Cadastro Fornecedor</h1>
            <div class="content">
                <button class="header_btn" id="closeModal">X</button>
            </div>
        </div>
        <form action="/STOKI/php/cadForn.php" method="POST">
            <h1 class="modal__title">Informações Produto</h1>
            <div class="info">
                <input type="text" name="nome" placeholder="Nome:" class="info_in in--text">
                <input type="text" name="tel" placeholder="Telefone:" class="info_in in--text">
                <input type="text" name="email" placeholder="E-mail:" class="info_in in--text">
                <input type="text" name="cnpj" placeholder="CNPJ:" class="info_in in--text">
                <input type="text" name="cpf" placeholder="CPF:" class="info_in in--text">
                <input type="text" name="cep" max="9999999" placeholder="CEP:" class="info_in in--text">
                
                <details class="desc">
                    <summary>DETALHES</summary>
                    <input type="text" name="desc" class="desc__in" placeholder="Coloque sua descrição aqui...">
                </details>
            </div>
            
            <div class="footer">
                <button type="button" class="footer__btn" id="calcelCad">Cancelar</button>
                <button type="submit" class="footer__btn" id="saveCad">Cadastrar</button>
            </div>
        </form>
    `,
    clientes: `
             <div class="header">
            <h1 class="header__title">Cadastro Fornecedor</h1>
            <div class="content">
                <button class="header_btn" id="closeModal">X</button>
            </div>
        </div>
        <form action="/STOKI/php/cadCli.php" method="POST">
            <h1 class="modal__title">Informações Produto</h1>
            <div class="info">
                <input type="text" name="nome" placeholder="Nome:" class="info_in in--text">
                <input type="text" name="tel" placeholder="Telefone:" class="info_in in--text">
                <input type="text" name="email" placeholder="E-mail:" class="info_in in--text">
                <input type="text" name="cnpj" placeholder="CNPJ:" class="info_in in--text">
                <input type="text" name="cpf" placeholder="CPF:" class="info_in in--text">
                <input type="text" name="cep" max="9999999" placeholder="CEP:" class="info_in in--text">
                
                <details class="desc">
                    <summary>DETALHES</summary>
                    <input type="text" name="desc" class="desc__in" placeholder="Coloque sua descrição aqui...">
                </details>
            </div>
            
            <div class="footer">
                <button type="button" class="footer__btn" id="calcelCad">Cancelar</button>
                <button type="submit" class="footer__btn" id="saveCad">Cadastrar</button>
            </div>
        </form>
    `,
}