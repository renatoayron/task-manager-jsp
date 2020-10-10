<%@ page language="java" contentType="text/html  charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Editor de Tarefas</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>
<body>
	<a href="index.jsp">Home</a><br>
	<div align=center class="container">
		<div class="center">
			<h1>Registro de Tarefas</h1>
			<form action='TaskController.do' action='DatePicker' method='post'>
				<div class="row">
					<table>
						<tr>
							<td></td>
							<td><input type='hidden' name='id' value="${task.id}" /></td>
						</tr>
						<tr>
							<td>Nome:</td>
							<td><input type='text' name='name' value="${task.name}" /></td>
						</tr>
						<tr>
							<td>Descrição:</td>
							<td><input type='text' name='description'
								value="${task.description}" /></td>
						</tr>
						<tr>
							<td>Tipo:</td>
							<td><input type='text' name='type' value="${task.type}" /></td>
						</tr>
						<div class="input-field col s12">
							<tr>
								<td>Status:</td>
								<td><select class="browser-default" type='text' name='status' value="${task.status}">
										<option value="" selected disabled>Escolha o status</option>
										<option value="1">Planejada</option>
										<option value="2">Em Andamento</option>
										<option value="3">Concluída</option>
								</select></td>
							</tr>
						</div>
						<tr>
							<td>Atribuído para:</td>
							<td><input type='text' name='atribPara'
								value="${task.atribPara}" /></td>
						</tr>
						<tr>
							<td>Data de Conclusão:</td>
							<td><input type="date" name="dataConclusao"
								value="${task.dataConclusao}" /></td>
							<td><errors path="task.dataConclusao" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type='hidden' name='dateCreated'
								value="${task.dateCreated}" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type='hidden' name='dateUpdated'
								value="${task.dateUpdated}" /></td>
						</tr>
						<tr>
							<td colspan='2'><input type='submit' value='Salvar' /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	<!-- Compiled and minified JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js">
	</script>

	<script>
		$(document).ready(function() {
			$('select').formSelect();
		});
	</script>

</body>
</html>