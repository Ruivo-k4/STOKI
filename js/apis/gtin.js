
export async function capturarApi(codigoBarras) {
    try {
        const urls = [
            `https://api.barcodefinder.info/barcode/${codigoBarras}`,
            `https://world.openfoodfacts.org/api/v3/product/${codigoBarras}.json?fields=product_name,brands,quantity,product_quantity,product_quantity_unit`
        ];

        const respostas = await Promise.allSettled(
            urls.map(url => fetch(url).then(resposta => {
                if (!resposta.ok) {
                    throw new Error(`Erro HTTP: ${resposta.status}`);
                }

                return resposta.json();
            }))
        );

        const barcode = respostas[0].status === 'fulfilled'
            ? respostas[0].value
            : {};

        const offResposta = respostas[1].status === 'fulfilled'
            ? respostas[1].value
            : {};

        const produto = offResposta.product || {};

        return {
            lote: null,

            nome: barcode.title ||
                  produto.product_name ||
                  null,

            marca: barcode.brand ||
                   produto.brands ||
                   null,

            peso: produto.quantity ||
                  (produto.product_quantity
                    ? `${produto.product_quantity} ${produto.product_quantity_unit || ''}`.trim()
                    : null),

            valorUnitario: null
        };

    } catch (erro) {
        console.error('Erro ao capturar as APIs:', erro);
        return null;
    }
}
