<%-- 
    Document   : calculadora-imc
    Created on : 8 de abr. de 2024, 23:19:33
    Author     : mayar
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Calculadora de Índice de Massa Corporal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/reset.css"/>
        <link rel="stylesheet" href="css/calculadora-imc.css"/>
        <link rel="stylesheet" href="css/geral.css"/>
        <link rel="icon" href="favicon/calculadora-imc.ico" type="image/x-icon">
        <!-- GOOGLE FONTS -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Teko:wght@300..700&display=swap" rel="stylesheet">
        <!-- FIM GOOGLE FONTS -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <script>
            // Menu responsivo
            function toggleMenu() {
                var menu = document.querySelector('.menu');
                menu.classList.toggle('active');
            }
        </script>

    </head>
    <body>
        <header><!--Cabeçalho-->
            <nav>
                <ul class="menu">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="calculadora-simples.jsp">Calculadora Simples</a></li>
                    <li><a href="gerenciador.jsp">Gerenciador de Tarefas</a></li>
                    <li><a href="calculadora-calorias.jsp">Calculadora de Calorias</a></li>
                </ul>
            </nav>
        </header><!--Fim Cabeçalho-->

        <!-- Ícone de Menu -->
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>

        <main><!--Conteúdo Principal-->
            <div class="principal">
                <span class="logo">Calculadora de Índice de Massa Corporal 💪</span>
            </div>
            <div class="calculadora-imc">
                <form method="post">
                    <label for="peso">Peso</label>
                    <input type="text" id="peso" name="peso" placeholder="Digite o seu peso" required><br>

                    <label for="altura">Altura</label>
                    <input type="text" id="altura" name="altura" placeholder="Digite a sua altura" required><br>

                    <input type="submit" value="Calcular">
                </form>
                <div id="resultado">
                    <%
                        // Processamento do formulário
                        if (request.getMethod().equalsIgnoreCase("post")) {
                            try {
                                // Obtendo os parâmetros do formulário
                                double peso = Double.parseDouble(request.getParameter("peso").replace(',', '.'));
                                double altura = Double.parseDouble(request.getParameter("altura").replace(',', '.'));

                                // Calculando o IMC
                                double imc = peso / (altura * altura);

                                // Interpretando o resultado do IMC
                                String resultado;
                                if (imc < 18.5) {
                                    resultado = "Abaixo do peso";
                                } else if (imc < 24.9) {
                                    resultado = "Peso normal";
                                } else if (imc < 29.9) {
                                    resultado = "Sobrepeso";
                                } else if (imc < 34.9) {
                                    resultado = "Obesidade Grau I";
                                } else if (imc < 39.9) {
                                    resultado = "Obesidade Grau II";
                                } else {
                                    resultado = "Obesidade Grau III";
                                }

                                // Exibindo o resultado do IMC
                    %>
                    <h2>Resultado do IMC</h2>
                    <p>O Índice de Massa Corporal (IMC) é: <%= String.format("%.2f", imc) %></p>
                    <p>Resultado: <%= resultado %></p>
                    <%
                            } catch (NumberFormatException e) {
                                // Tratando erros de conversão
                    %>
                    <p>Erro: Certifique-se de inserir valores válidos para peso e altura.</p>
                    <%
                            }
                        }
                    %>
                </div>            
            </div>
        </main><!--Fim Conteúdo Principal-->

        <footer><!--Rodapé-->
            <p class="footer-copy">Copyright &lt; MSA /&gt; 2024</p>
            <p class="footer-autor">Feito por Mayara Silva Azevedo ❤ </p>
        </footer><!--Fim Rodapé-->

    </body>
</html>
