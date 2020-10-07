package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Task;
import util.DBUtil;

public class TaskDAOImplementation implements TaskDAO {

	private Connection conn;

	public TaskDAOImplementation() {
		conn = DBUtil.getConnection();
	}

	@Override
	public void createTask(Task task) {
		try {
			String query = "insert into tasks (name, description, type, status, atribPara, dataConclusao, dateCreated, dateUpdated) values (?,?,?,?,?,?,?,?)";

			PreparedStatement preparedStatement = conn.prepareStatement(query);

			preparedStatement.setString(1, task.getName());
			preparedStatement.setString(2, task.getDescription());
			preparedStatement.setString(3, task.getType());
			preparedStatement.setString(4, task.getStatus());
			preparedStatement.setString(5, task.getAtribPara());
			preparedStatement.setDate(6, task.getDataConclusao());

			java.util.Date utilDate = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

			task.setDateCreated(sqlDate);
			preparedStatement.setDate(7, task.getDateCreated());

			task.setDateUpdated(sqlDate);
			preparedStatement.setDate(8, task.getDateUpdated());

			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void editTask(Task task) {
		try {
			String query = "update tasks set name=?, description=?, type=?, status=?, atribPara=?, dataConclusao=?, dateCreated=?, dateUpdated=? where id=?";

			PreparedStatement preparedStatement = conn.prepareStatement(query);

			preparedStatement.setString(1, task.getName());
			preparedStatement.setString(2, task.getDescription());
			preparedStatement.setString(3, task.getType());
			preparedStatement.setString(4, task.getStatus());
			preparedStatement.setString(5, task.getAtribPara());
			preparedStatement.setDate(6, task.getDataConclusao());
			preparedStatement.setDate(7, task.getDateCreated());

			java.util.Date utilDate = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

			task.setDateUpdated(sqlDate);
			preparedStatement.setDate(8, task.getDateUpdated());

			preparedStatement.setInt(9, task.getId());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteTask(int id) {
		try {
			String query = "delete from tasks where id=?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Task> listAllTasks() {
		List<Task> tasks = new ArrayList<Task>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from tasks");
			while (resultSet.next()) {
				Task task = new Task();
				task.setId(resultSet.getInt("id"));
				task.setName(resultSet.getString("name"));
				task.setDescription(resultSet.getString("description"));
				task.setType(resultSet.getString("type"));
				task.setStatus(resultSet.getString("status"));
				task.setAtribPara(resultSet.getString("atribPara"));
				task.setDataConclusao(resultSet.getDate("dataConclusao"));
				task.setDateCreated(resultSet.getDate("dateCreated"));
				task.setDateUpdated(resultSet.getDate("dateUpdated"));
				tasks.add(task);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tasks;
	}

	@Override
	public Task getTaskById(int id) {
		Task task = new Task();
		try {
			String query = "select * from tasks where id=?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				task.setId(resultSet.getInt("id"));
				task.setName(resultSet.getString("name"));
				task.setDescription(resultSet.getString("description"));
				task.setType(resultSet.getString("type"));
				task.setStatus(resultSet.getString("status"));
				task.setAtribPara(resultSet.getString("atribPara"));
				task.setDataConclusao(resultSet.getDate("dataConclusao"));
				task.setDateCreated(resultSet.getDate("dateCreated"));
				task.setDateUpdated(resultSet.getDate("dateUpdated"));
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return task;
	}

}
