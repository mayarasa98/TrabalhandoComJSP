<%-- 
    Document   : calculadora-simples
    Created on : 9 de abr. de 2024, 00:05:04
    Author     : mayar
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Calculadora Simples</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/reset.css"/>
        <link rel="stylesheet" href="css/calculadora-simples.css"/>
        <link rel="stylesheet" href="css/geral.css"/>
        <link rel="icon" href="favicon/calculadora.ico" type="image/x-icon">
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
                    <li><a href="calculadora-imc.jsp">Calculadora de IMC</a></li>
                    <li><a href="gerenciador.jsp">Gerenciador de Tarefas</a></li>
                    <li><a href="calculadora-calorias.jsp">Calculadora de Calorias</a></li>
                </ul>
            </nav>
        </header><!--Fim Cabeçalho-->

        <!-- Ícone de Menu -->
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>

        <main><!--Conteúdo Principal-->
            <div class="principal">
                <span class="logo">Calculadora Simples 🧮</span>
            </div>
            <div class="calculadora-simples">
                <form method="post">
                    <label for="num1">Número 1</label>
                    <input type="number" id="num1" name="num1" placeholder="Digite o primeiro número" required><br>

                    <label for="num2">Número 2</label>
                    <input type="number" id="num2" name="num2" placeholder="Digite o segundo número" required><br>

                    <label for="operacao">Operação</label>
                    <select id="operacao" name="operacao">
                        <option value="soma">Soma</option>
                        <option value="subtracao">Subtração</option>
                        <option value="multiplicacao">Multiplicação</option>
                        <option value="divisao">Divisão</option>
                        <option value="radiciacao">Radiciação</option>
                        <option value="resto">Resto da Divisão</option>
                        <option value="exponenciacao">Exponenciação</option>
                    </select><br>

                    <input type="submit" value="Calcular">
                </form>

                <div id="resultado">
                    <%
                        // Processamento do formulário
                        if (request.getMethod().equalsIgnoreCase("post")) {
                            try {
                                // Obtendo os parâmetros do formulário
                                double num1 = Double.parseDouble(request.getParameter("num1"));
                                double num2 = Double.parseDouble(request.getParameter("num2"));
                                String operacao = request.getParameter("operacao");
                                double resultado = 0;

                                switch(operacao) {
                                    case "soma":
                                        resultado = num1 + num2;
                                        break;
                                    case "subtracao":
                                        resultado = num1 - num2;
                                        break;
                                    case "multiplicacao":
                                        resultado = num1 * num2;
                                        break;
                                    case "divisao":
                                        if(num2 != 0) {
                                            resultado = num1 / num2;
                                        } else{
                                            out.println("Erro: Divisão por zero.");
                                            return;
                                        }
                                        break;
                                    case "resto":
                                        resultado = num1 % num2;
                                        break;
                                    case "exponenciacao":
                                        resultado = Math.pow(num1, num2);
                                        break;
                                    case "radiciacao":
                                        resultado = Math.sqrt(num1);
                                        break;
                                }

                                // Exibindo o resultado
                    %>
                    <h2>Resultado: <%= String.format("%.2f", resultado) %></h2>
                    <%
                            } catch (NumberFormatException e) {
                                // Tratando erros de conversão
                    %>
                    <p>Erro: Certifique-se de inserir valores válidos para os números.</p>
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
