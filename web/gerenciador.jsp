<%-- 
    Document   : gerenciador
    Created on : 8 de abr. de 2024, 21:54:36
    Author     : mayar
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gerenciador de Tarefas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/reset.css"/>
        <link rel="stylesheet" href="css/gerenciador.css"/>
        <link rel="stylesheet" href="css/geral.css"/>
        <link rel="icon" href="favicon/gerenciador.ico" type="image/x-icon">
        <!-- GOOGLE FONTS -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Teko:wght@300..700&display=swap" rel="stylesheet">
        <!-- FIM GOOGLE FONTS -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <script>
            // Array para armazenar as tarefas
            var tarefas = [];
            // Função para adicionar uma nova tarefa
            function adicionarTarefa() {
                var titulo = document.getElementById("titulo").value;
                var descricao = document.getElementById("descricao").value;
                var dueDate = document.getElementById("dueDate").value;

                // Adiciona a nova tarefa ao array de tarefas
                tarefas.push({titulo: titulo, descricao: descricao, dueDate: dueDate});

                // Limpa os campos do formulário
                document.getElementById("titulo").value = "";
                document.getElementById("descricao").value = "";
                document.getElementById("dueDate").value = "";

                // Exibe uma mensagem de sucesso
                document.getElementById("mensagem").innerText = "Tarefa adicionada com sucesso!";
            }

            function validarFormulario() {
                const titulo = document.getElementById('titulo').value;
                const descricao = document.getElementById('descricao').value;
                const dueDate = document.getElementById('dueDate').value;
                if (titulo && descricao && dueDate) {
                    return true; // Envie o formulário
                } else {
                    alert('Por favor, preencha todos os campos.');
                    return false; // Não envie o formulário
                }
            }

            // Função para exibir as tarefas em um popup
            function visualizarTarefas() {
                // Define as dimensões e posição do popup
                var width = 400;
                var height = 300;
                var left = (screen.width / 2) - (width / 2);
                var top = (screen.height / 2) - (height / 2);

                // Cria um popup
                var popup = window.open("", "_blank", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);

                // Escreve o conteúdo HTML do popup
                var htmlContent = "<!DOCTYPE html>";
                htmlContent += "<html>";
                htmlContent += "<head>";
                htmlContent += "<title>Visualizar Tarefas</title>";
                htmlContent += "<style>";
                htmlContent += "body { font-family: Arial, sans-serif; background-color: #f2f2f2; margin: 0; padding: 20px; }";
                htmlContent += "h2 { color: #333; margin-top: 0; }";
                htmlContent += "ul { list-style-type: none; padding: 0; }";
                htmlContent += "li { margin-bottom: 30px; }";
                htmlContent += "strong { color: #007bff; }";
                htmlContent += "</style>";
                htmlContent += "</head>";
                htmlContent += "<body>";
                htmlContent += "<h2>Tarefas Salvas:</h2>";

                if (tarefas.length === 0) {
                    htmlContent += "<p>Nenhuma tarefa foi adicionada ainda.</p>";
                } else {
                    htmlContent += "<ul>";
                    tarefas.forEach(function (tarefa) {
                        var dueDate = new Date(tarefa.dueDate);
                        var formattedDueDate = dueDate.toLocaleDateString('pt-BR'); // Formata a data para o formato brasileiro
                        htmlContent += "<li><strong>" + tarefa.titulo + "</strong><br>" + tarefa.descricao + "<br>Data de Vencimento: " + formattedDueDate + "</li>";
                    });
                    htmlContent += "</ul>";
                }

                htmlContent += "</body>";
                htmlContent += "</html>";

                // Escreve o conteúdo HTML no popup
                popup.document.write(htmlContent);
                popup.document.close();
            }

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
                    <li><a href="calculadora-simples.jsp">Calculadora Simples</a></li>
                    <li><a href="calculadora-calorias.jsp">Calculadora de Calorias</a></li>
                </ul>
            </nav>
        </header><!--Fim Cabeçalho-->

        <!-- Ícone de Menu -->
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>

        <main><!-- Conteúdo principal -->
            <div class="principal">
                <span class="logo">Gerenciador de Tarefas 📘</span>
            </div>
            <div class="gerenciador">
                <form method="post">
                    <label for="titulo">Título</label>
                    <input type="text" id="titulo" name="titulo" required>

                    <label for="descricao">Descrição</label>
                    <textarea id="descricao" name="descricao" required></textarea><br>

                    <label for="dueDate">Data de Vencimento</label>
                    <input type="date" id="dueDate" name="dueDate" required><br>

                    <button type="button" onclick="adicionarTarefa()">Adicionar Tarefa</button><br>

                    <button type="button" onclick="visualizarTarefas()">Visualizar Tarefas</button><br>
                </form>

                <ul id="taskList"></ul>
                <div id="mensagem"></div>

                <%
    // Processamento do formulário
    if (request.getMethod().equalsIgnoreCase("post")) {
        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        String dueDate = request.getParameter("dueDate");
              
        // Exibição dos dados inseridos
        out.println("<div><strong>Tarefa adicionada:</strong><br>Título: " + titulo + "<br>Descrição: " + descricao + "<br>Data de Vencimento: " + dueDate + "</div>");
    }
                %>
            </div>
        </main><!-- Fim Conteúdo principal -->

        <footer><!--Rodapé-->
            <p class="footer-copy">Copyright &lt; MSA /&gt; 2024</p>
            <p class="footer-autor">Feito por Mayara Silva Azevedo ❤ </p>
        </footer><!--Fim Rodapé-->
    </body>
</html>
