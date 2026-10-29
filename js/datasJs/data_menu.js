export const content = {
    completo: `
        <nav>
            <div id="assideLogo">
                <img src="imgs/logo.png" alt="STOKi" class="asside__img">
            </div>
            <ul>
                <li><a href="index.html">Inicio</a></li>
                <li id="aEstq"><a href="estoque_frame.php">Estoque</a></li>
                <li id="aProd"><a href="Produto_frame.php">Produtos</a></li>
                <li id="aPed"><a href="pedidos_frame.php">Pedidos</a></li>
                <li id="aForn"><a href="fornecedor_frame.php">Fornecedor</a></li>
                <li id="aCli"><a href="clientes_frame.php">Clientes</a></li>
            </ul>
        </nav>
        <div class="item" id="assideActions">
            <ul>
                <li id="configurateIndex">Configurações</li>
                <li>
                    <form action="/STOKI/php/logout.php" method="POST">
                        <button type="submit" name="logout">Sair</button>
                    </form>
                </li>
            </ul>
        </div>
    `
}