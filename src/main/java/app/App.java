package app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class App {

	public static void main(String[] args) throws SQLException {
		String url = "C:\\Users\\Usuario\\Documents\\AP-eclipse\\turismo-en-la-tierra-media";
		Connection connection = DriverManager.getConnection(url);		
		
		String sql = "SELECT COUNT(*) FROM usuario u ";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet resultados = statement.executeQuery();
		
		resultados.next();
		System.out.println(resultados.getInt("TOTAL"));
		
		connection.close();
	}

}
