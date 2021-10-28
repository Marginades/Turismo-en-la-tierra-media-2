package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import jdbc.ConnectionProvider;
import model.Comprable;
import model.Usuario;

public class ItinerarioDAO {
	
	public int insert(Usuario u, Comprable c) {
		try {
			if(c.esPromocion()) {
				String query = "INSERT INTO ITINERARIO (ID_USUARIO, ID_PROMO) VALUES(?, ?)";
				Connection conn = ConnectionProvider.getConnection();
	
				PreparedStatement statement = conn.prepareStatement(query);
				statement.setInt(1, u.getId());
				statement.setInt(2, c.getId());
				
			}else {
				String query = "INSERT INTO ITINERARIO (ID_USUARIO, ID_ATRACCION) VALUES(?, ?)";
				Connection conn = ConnectionProvider.getConnection();
	
				PreparedStatement statement = conn.prepareStatement(query);
				statement.setInt(1, u.getId());
				statement.setInt(2, c.getId());
			}
			//CON EL PREPARED STATEMENT ASIGNAMOS A LOS SIGNOS "?" LOS VALORES DEL OBJETO QUE ENTRA POR PARAMETRO
			
			ResultSet results = statement.executeQuery();

			List<Comprable> itinerario = new LinkedList<Comprable>();
			while (results.next()) {
				// un result es una fina. Si hacemos results.nex va a la siguiente fila
				itinerario.add((Comprable) results);
			}
			return statement.executeUpdate();

		} catch (SQLException e) {
			throw new MissingDataException(e);
		}
	}
	
	public int insert2(Usuario u, Comprable c) {
		
	}
/*
 * saveItinerario(Usuario u) {
		Connection conn;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			UPDATE USARIO
			for(atraccion comprada) {
				INSERT ITENERARIO
				UPDATE ATRACCION
			}
		} catch (SQLException e) {
			conn.rollback();
		} finally {
			conn.commit();
		}
	}
	
	*/
}
