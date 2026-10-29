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
                <input type="text" name="nome" placeholder="Nome:" class="info_in in--text" id="nome__in">
                <input type="text" name="marca" placeholder="Marca:" class="info_in in--text" id="marca__in">
                <input type="text" name="area" placeholder="Localização Estoque:" class="info_in in--text">
                <div class="group">
                    <input type="text" name="gtin" placeholder="Código de barras:" class="info_in in--text" id="gtin__in">
                    <input type="text" name="categoria" placeholder="Categoria:" class="info_in in--text" id="categoria__in">
                    <input type="number" step="any" min="0" name="quantidade" placeholder="Quantidade" class="group__in in--number">
                    <input type="text" name="peso" placeholder="Peso" class="group__in in--text" id="peso__in">
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
            <h1 class="header__title">Cadastro de Venda</h1>

            <div class="content">
                <button type="button" class="header_btn" id="closeModal">X</button>
            </div>
        </div>

        <form action="/STOKI/php/cadVenda.php" method="POST" id="formVenda">

            <h2 class="modal__title">Informações da Venda</h2>

            <div class="info">

                <input type="text"
                    name="cliente_id"
                    min="1"
                    placeholder="CPF/CNPJ Cliente:"
                    class="info_in in--text"
                    required>

                <input type="text"
                    name="forma_pagamento"
                    placeholder="Forma de pagamento:"
                    class="info_in in--text"
                    required>

                <select id="fruta" name="fruta" class="info_op in--text">
                    <option value="maca"> Paga </option>
                    <option value="banana" selected> Pendente</option>
                    <option value="laranja" > Cancelada </option>
                </select>

            </div>

            <h2 class="modal__title">Adicionar Produto</h2>

            <div class="info">
                <input type="text" name="nome" placeholder="Nome:" class="info_in in--text" id="nome__in" disabled>
               
                <input type="text" name="gtin" placeholder="Código de barras:" class="info_in in--text " id="gtin__in">

                <div class="group">

                    <input type="number"
                        name="qnt"
                        min="1"
                        step="1"
                        placeholder="Quantidade:"
                        class="group__in_ped in--number"
                        id="qnt"
                        required>

                    <input type="number"
                        name="val_unit"
                        min="0"
                        step="0.01"
                        placeholder="Valor unitário (R$):"
                        class="group__in in--number"
                        id = "val_unit"
                        required>

                </div>

                <button type="button"
                    class="footer__btn"
                    id="adicionarProduto">
                    Adicionar produto
                </button>

            </div>

            <h2 class="modal__title">Produtos da Venda</h2>

            <div class="produtos_venda" id="listaProdutos">
                
            </div>

            <div class="resumo_venda">
                <h3>Total da venda: R$ <span id="valorTotal">0,00</span></h3>
            </div>

            <div class="footer">

                <button type="button"
                    class="footer__btn"
                    id="calcelCad">
                    Cancelar
                </button>

                <button type="submit"
                    class="footer__btn"
                    id="salvarVenda">
                    Salvar venda
                </button>

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