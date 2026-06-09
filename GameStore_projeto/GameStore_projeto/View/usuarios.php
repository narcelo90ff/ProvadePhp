<?php require_once 'View/navbar.php'; ?>

<div class="gs-page-header">
    <h1>Usuários</h1>
</div>

<table class="gs-table">
    <thead>
        <tr>
            <th>Nome</th>
            <th>Email</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach($usuarios as $usuario): ?>
        <tr>
            <td><?= htmlspecialchars($usuario['nome']) ?></td>
            <td><?= htmlspecialchars($usuario['email']) ?></td>
            <td>
                <div class="gs-actions">
                    <a href="index.php?p=editar-usuario&id=<?= htmlspecialchars($usuario['id']) ?>" class="botao">Editar</a>
                    <form method="post" action="index.php?p=excluir-usuario" style="display:inline;">
    <input type="hidden" name="csrf" value="<?= Csrf::gerarToken() ?>">
    <input type="hidden" name="id" value="<?= $usuario['id'] ?>">

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

<?php require_once 'View/layout-footer.php'; ?>
