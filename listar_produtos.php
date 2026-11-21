<?php
require_once "conexao.php";

header("Content-Type: application/json; charset=utf-8");

$sql = "SELECT * FROM produtos ORDER BY id DESC";

$resultado = $conexao->query($sql);

$produtos = [];

while ($linha = $resultado->fetch_assoc()) {
    $produtos[] = $linha;
}

echo json_encode($produtos, JSON_UNESCAPED_UNICODE);
?>