<?php require_once 'View/navbar.php'; ?>

<div class="gs-page-header">
    <h1>Jogos</h1>
    <a href="index.php?p=novo-jogo" class="botao">+ Novo Jogo</a>
</div>

<table class="gs-table">
    <thead>
        <tr>
            <th>Título</th>
            <th>Categoria</th>
            <th>Preço</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach($jogos as $jogo): ?>
        <tr>
            <td><strong><?= htmlspecialchars($jogo['titulo']) ?></strong></td>
            <td><?= htmlspecialchars($jogo['categoria_nome']) ?></td>
            <td class="gs-price">R$ <?= number_format(htmlspecialchars($jogo['preco']), 2, ',', '.') ?></td>
            <td>
                <div class="gs-actions">
                    <a href="index.php?p=editar-jogo&id=<?= $jogo['id'] ?>" class="botao">Editar</a>
                    <form method="post" action="index.php?p=excluir-jogo" style="display:inline;">
    <input type="hidden" name="csrf" value="<?= Csrf::gerarToken() ?>">
    <input type="hidden" name="id" value="<?= $jogo['id'] ?>">

    <button type="submit" class="btn btn-danger">
        Excluir
    </button>
</form>
                </div>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>
