<div class="header">
            <h1 class="header__title">Cadastro Produto</h1>
            <div class="content">
                <button class="header_btn" id="closeModal">X</button>
            </div>
        </div>
        <form action="/STOKI/php/updProd.php" method="POST">
            <h1 class="modal__title">Informações Produto</h1>
            <div class="info">
                <input type="text" name="nome" placeholder="Nome:" class="info_in in--text">
                <input type="text" name="marca" placeholder="Marca:" class="info_in in--text">
                <input type="text" name="gtin" placeholder="Código de barras:" class="info_in in--text">
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