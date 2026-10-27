export const content = {
    adm: `
        <form action="cadAdm.php" method="POST" class="hero__form">
            <h1 class="hero__title">Não é nosso cliente?</h1>
            <p class="hero__subtitle">cadastre-se e viva a facilidade</p>
            <input type="text" name="nome" placeholder="Nome: " class="form__in form__int-text" required>
            <input type="text" name="empresa" placeholder="Empresa: " class="form__in form__int-text" required>
            <input type="tel" name="tel" placeholder="Telefone: " class="form__in form__int-text" required>
            <input type="email" name="email" placeholder="Email: " class="form__in form__int-text" required>
            <input type="text" name="cpf" placeholder="CPF: " class="form__in form__int-text" required>
            <input type="text" name="cnpj" placeholder="CNPJ: " class="form__in form__int-text" required>
            <input type="password" name="senha" placeholder="Senha: " class="form__in form__int-text" required>
            <button type="submit">Cadastrar</button>
        </form>
    `,
    fun: `
        <form action="cadFun.php" method="POST" class="hero__form">
            <h1 class="hero__title">Não é nosso cliente?</h1>
            <p class="hero__subtitle">cadastre-se e viva a facilidade</p>
            <input type="text" name="nome" placeholder="Nome: " class="form__in form__int-text" required>
            <input type="text" name="empresa" placeholder="Empresa: " class="form__in form__int-text" required>
            <input type="tel" name="tel" placeholder="Telefone: " class="form__in form__int-text" required>
            <input type="email" name="email" placeholder="Email: " class="form__in form__int-text" required>
            <input type="text" name="cpf" placeholder="CPF: " class="form__in form__int-text" required>
            <input type="text" name="cnpj" placeholder="CNPJ: " class="form__in form__int-text" required>
            <input type="password" name="senha" placeholder="Sen: " class="form__in form__int-text" required>
            <button type="submit">Cadastrar</button>
        </form>
    `,
    lAdm: `
        <form action="login_adm.php" method="POST" class="hero__form">
            <h1 class="hero__title">Bem Vindo ao STOKI</h1>
            <p class="hero__subtitle">Faça seu loguin e viva a facilidade</p>
            <input type="email" name="email" id="emailIn" class="content__in" placeholder="Email: " required>
            <input type="password" name="senha" id="passIn" class="content__in" placeholder="Senha: " required>
            <button type="submit" class="content__btn">Fazer Login</button>
            <a href="/STOKI/php/pag_cads/cadAdm.php" class="hero__link">Cadastrar Conta</a>
        </form>
    `,
    lFun: `
        <form action="login_fun.php" method="POST" class="hero__form">
            <h1 class="hero__title">Bem Vindo ao STOKI</h1>
            <p class="hero__subtitle">Faça seu loguin e viva a facilidade</p>
            <input type="text" name="nib" id="nibIn" class="content__in" placeholder="NIB: " required>
            <input type="password" name="senha" id="passIn" class="content__in" placeholder="Senha: " required>
            <button type="submit" class="content__btn">Fazer Login</button>
            <a href="#" class="hero__link">Cadastrar Conta</a>
        </form>
    `
}