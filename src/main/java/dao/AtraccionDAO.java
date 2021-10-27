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

			List<Comprable> bandas = new LinkedList<Comprable>();
			while (results.next()) {
				bandas.add((Comprable) toAtraccion(results));
			}
			return bandas;

		} catch (SQLException e) {
			throw new MissingDataException(e);
		}
	}

	public int update(Comprable t) {
		return 0;
	}

}
