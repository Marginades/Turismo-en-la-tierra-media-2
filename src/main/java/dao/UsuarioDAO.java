package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import jdbc.ConnectionProvider;
import model.Usuario;

public class UsuarioDAO {
	
	
	public int updateTiempo(Usuario t, int tiempoOcupado) {
		try {
		String query = "UPDATE USUARIO SET TIEMPO - ? WHERE NOMBRE = ?";
		Connection conn = ConnectionProvider.getConnection();
		
		PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, tiempoOcupado);
			statement.setString(2, t.getNombre());
			return statement.executeUpdate();
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
}
