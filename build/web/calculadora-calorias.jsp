<%-- 
    Document   : calculadora-calorias
    Created on : 8 de abr. de 2024, 23:04:21
    Author     : mayar
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Calculadora de Calorias</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/reset.css"/>
        <link rel="stylesheet" href="css/geral.css"/>
        <link rel="stylesheet" href="css/calculadora-calorias.css"/>
        <link rel="icon" href="favicon/calorias.ico" type="image/x-icon">
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
        <header><!-- Cabeçalho -->
            <nav>
                <ul class="menu">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="calculadora-simples.jsp">Calculadora Simples</a></li>
                    <li><a href="calculadora-imc.jsp">Calculadora de IMC</a></li>
                    <li><a href="gerenciador.jsp">Gerenciador de Tarefas</a></li>
                </ul>
            </nav>
        </header><!-- Fim Cabeçalho -->

        <div class="menu-toggle" onclick="toggleMenu()">☰</div>

        <main><!-- Conteúdo Principal -->
            <div class="principal">
                <span class="logo">Calculadora de Calorias 🍎</span>
            </div>
            <div class="calculadora-calorias">

                <form method="post">
                    <label for="calories">Calorias por porção</label>
                    <input type="number" id="calories" name="calories" placeholder="Digite as calorias" required><br>

                    <label for="quantity">Quantidade (porções)</label>
                    <input type="number" id="quantity" name="quantity" placeholder="Digite a quantidade" required><br>

                    <button type="submit">Calcular</button><br>

                    <%
                        // Processamento do formulário
                        if (request.getMethod().equalsIgnoreCase("post")) {
                            try {
                                // Obtém os parâmetros do formulário
                                double calories = Double.parseDouble(request.getParameter("calories"));
                                double quantity = Double.parseDouble(request.getParameter("quantity"));

                                // Calcula as calorias totais
                                double totalCalories = calories * quantity;

                                // Exibe o resultado
                    %>
                    <div id="result">
                        <h2>Resultado: <%= totalCalories %> calorias</h2>
                    </div>
                    <%
                            } catch (NumberFormatException e) {
                                // Trata erros de conversão de números
                    %>
                    <div id="result">
                        <h2>Erro nos parâmetros.</h2>
                    </div>
                    <%
                            }
                        }
                    %>
                </form>
            </div>
        </main><!-- Fim Conteúdo Principal -->

        <footer>
            <p class="footer-copy">Copyright &lt; MSA /&gt; 2024</p>
            <p class="footer-autor">Feito por Mayara Silva Azevedo ❤ </p>
        </footer>
    </body>
</html>


