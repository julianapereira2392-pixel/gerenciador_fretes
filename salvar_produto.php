<?php
require_once "conexao.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = trim($_POST["nome"] ??"");
    $descricao = trim($_POST["descricao"] ?? "");
    $valor = filter_var($_POST["valor"]?? null, FILTER_VALIDATE_FLOAT);
$categoria = trim($_POST["categoria"]??"");
$peso = filter_var($_POST["peso"] ?? null, FILTER_VALIDATE_FLOAT);
$quantidade = filter_var($_POST["quantidade"] ?? null, FILTER_VALIDATE_INT);
    if ($nome == "" || $valor === false || $valor <0 || $peso === false || $peso <0 ||$quantidade === false || $quantidade < 0){
        die("Dados inválidos.");
    }

    $sql = "INSERT INTO produtos (nome, descricao, valor, categoria, peso, quantidade)
            VALUES (?,?,?,?,?,?)";

    $comando = $conexao->prepare($sql);
    $comando->bind_param("ssdsdi", $nome, $descricao, $valor, $categoria, $peso, $quantidade);

    if ($comando->execute()) {
   echo "Produto cadastrado com sucesso!";
} else {
   echo "Error ao cadastrar o produto.";
}

$comando->close();

}
?>