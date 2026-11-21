<?php
require_once "conexao.php";

header("Content-Type: application/json; charset=utf-8");

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    http_response_code(405);
    echo json_encode(["erro" => "Método não permitido"]);
    exit;
}

$id = filter_var(
    $_POST["id"] ?? null,
    FILTER_VALIDATE_INT
);

if ($id === false || $id === null || $id <= 0) {
    http_response_code(400);
    echo json_encode(["erro" => "ID inválido"]);
    exit;
}

$sql = "DELETE FROM produtos WHERE id = ?";
$comando = $conexao->prepare($sql);
$comando->bind_param("i", $id);

if ($comando->execute()) {
    echo json_encode([
        "sucesso" => $comando->affected_rows > 0
    ]);
} else {
    http_response_code(500);
    echo json_encode(["erro" => "Erro ao excluir"]);
}

$comando->close();
?>