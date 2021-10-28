package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import jdbc.ConnectionProvider;
import model.Comprable;
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
	//aca yo creo que el update recibe un comprable y un usuario. Entonces al tiempo
	//de disponibilidad del usuario se le resta la duracion, y el costo del comorable

	public int update(Usuario u, Comprable c) {
		try {
		String query = "UPDATE USUARIO SET PRESUPUESTO = ?, TIEMPO = ? WHERE ID_USUARIO = ?";
		Connection conn = ConnectionProvider.getConnection();
		
		PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, (u.getPresupuesto() - c.getCosto()));
			statement.setDouble(2, (u.getDisponibilidad() - c.getDuracion()));
			statement.setInt(3, u.getId());
			return statement.executeUpdate();
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

}
