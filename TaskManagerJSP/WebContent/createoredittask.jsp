<%@ page language="java" contentType="text/html  charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Editor de tarefas</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function comparaData(data) {
		let parts = data.split('/') // separa a data pelo caracter '/'
		let today = new Date() // pega a data atual

		data = new Date(parts[2], parts[1] - 1, parts[0]) // formata 'date'

		// compara se a data informada é maior que a data atual
		// e retorna true ou false
		return data >= today ? true : false
	}

	function alertaAtrasos() {
		if (document.status.val().toLower() === 'concluída'
				&& document.dataConclusao.val().comparaData() == true) {
			alert("Nenhuma Tarefa em Atraso");
		} else {
			alert("Há atividades em atraso");
		}
	}
</script>
</head>
<body>
	<div align=center class=container>
		<div class=center>
			<h1>Registro de Tarefas</h1>
			<form action='TaskController.do' action='DatePicker' method='post'>
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
					<tr>
						<td>Status:</td>
						<td><select type='text' name='status' value="${task.status}">
								<option selected disabled>Escolha o status</option>
								<option>Planejada</option>
								<option>Em Andamento</option>
								<option>Concluída</option>
						</select></td>
					</tr>
					<tr>
						<td>Atribuído para:</td>
						<td><input type='text' name='atribPara'
							value="${task.atribPara}" /></td>
					</tr>
					<%--<tr>
						<td>Data de Conclusão:</td>
						<td><input type='text' path="dueDate" class="date"
							name='dataConclusao' value="${task.dataConclusao}" required
							pattern="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" /></td>
					</tr>--%>
					<%--<label for="datepicker">Data de Conclusão:</label>
                	<input type="text" name="dataConclusao" id="datepicker"> --%>
					<tr>
						<td><label for='date'>Data de Conclusão:</label></td>
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
			</form>
		</div>
	</div>
</body>
</html>