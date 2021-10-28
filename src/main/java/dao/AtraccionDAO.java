package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import jdbc.ConnectionProvider;
import model.Atraccion;
import model.Comprable;

public class AtraccionDAO {

	private Atraccion toAtraccion(ResultSet result) {
		try {
			return new Atraccion (result.getInt(1), result.getString(2), result.getInt(3),
								  result.getDouble(4), result.getInt(5), result.getString(6));
		} catch (SQLException e) {
			throw new MissingDataException(e);
		}
	}
	
	public List<Comprable> findAll() {
		try {
			String query = "SELECT * FROM USUARIO";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet results = statement.executeQuery();

			List<Comprable> atracciones = new LinkedList<Comprable>();
			while (results.next()) {
				atracciones.add((Comprable) toAtraccion(results));
			}
			return atracciones;

		} catch (SQLException e) {
			throw new MissingDataException(e);
		}
	}

	public int updateCupo(Comprable t) {
		try {
		String query = "UPDATE ATRACCION SET CUPO = ? WHERE NOMBRE = ?";
		Connection conn = ConnectionProvider.getConnection();
		
		PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, t.getCupo() - 1);
			statement.setString(2, t.getNombre());
			return statement.executeUpdate();
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	
	public int insert(Comprable atraccion) {
		try {
			String query = "INSERT INTO ATRACCION (NOMBRE, COSTO, DURACION, CUPO, TIPO) VALUES(?, ?, ?, ?, ?)";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, atraccion.getNombre());
			statement.setDouble(2, atraccion.getCosto());
			statement.setDouble(3, atraccion.getDuracion());
			statement.setInt(4, atraccion.getCupo());
			statement.setString(5, atraccion.getTipo());
			return statement.executeUpdate();
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int delete(Comprable atraccion) {
		try {
			String query = "DELETE FROM ATRACCION WHERE NOMBRE = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, atraccion.getNombre());
			return statement.executeUpdate();
		} catch (Exception e) {
			throw new MissingDataException(e);
		}

	}

}
