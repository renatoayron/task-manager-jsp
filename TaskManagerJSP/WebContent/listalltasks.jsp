<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>List of all tasks</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
</head>
<body>
	<table id="alter" border="1" width="100%">
		<thead>
			<tr>
				<th>ID da Tarefa</th>
				<th>Nome</th>
				<th>Descrição</th>
				<th>Tipo</th>
				<th>Status</th>
				<th>Atribuído para</th>
				<th>Data de Conclusão</th>
				<th>Data da criação</th>
				<th>Data da atualização</th>
				<th colspan="2">Ações</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${tasks}" var="task">
				<tr>
					<td><c:out value="${task.id}" /></td>
					<td><c:out value="${task.name}" /></td>
					<td><c:out value="${task.description}" /></td>
					<td><c:out value="${task.type}" /></td>
					<td><c:out value="${task.status}" /></td>
					<td><c:out value="${task.atribPara}" /></td>
					<td><c:out value="${task.dataConclusao}" /></td>
					<td><c:out value="${task.dateCreated}" /></td>
					<td><c:out value="${task.dateUpdated}" /></td>
					<td><a
						href="TaskController.do?action=edit&id=<c:out value="${task.id}"/>">Editar</a></td>
					<td><a
						href="TaskController.do?action=delete&id=<c:out value="${task.id}"/>">Remover</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="TaskController.do?action=create">Criar tarefa</a>
	</p>
</body>
</html>