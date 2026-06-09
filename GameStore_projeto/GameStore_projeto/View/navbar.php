<?php require_once 'View/layout-header.php'; ?>

<nav class="gs-nav">


    <a href="index.php?p=home" class="gs-brand">🎮 GameStore</a>

    <div class="nav-center">
        <a href="index.php?p=home">Home</a>
        <a href="index.php?p=catalogo">Catálogo</a>
        <a href="index.php?p=destaques">Destaques</a>
        <a href="index.php?p=sobre">Sobre</a>
    </div>

    <div class="nav-user">

    <?php if(isset($_SESSION['usuario'])): ?>

        <a href="index.php?p=carrinho">🛒 Carrinho</a>
        <a href="index.php?p=perfil">Perfil</a>

        <?php if(htmlspecialchars($_SESSION['usuario']['tipo']) === 'admin'): ?>
            <a href="index.php?p=dashboard">⚙️ Dashboard</a>
        <?php endif; ?>

        <a href="index.php?p=logout" class="nav-danger">Sair</a>

    <?php else: ?>

        <a href="index.php?p=login">Login</a>
        <a href="index.php?p=cadastro" class="btn-ghost">Cadastrar</a>

    <?php endif; ?>

</div>

</nav>

<div class="gs-wrap">