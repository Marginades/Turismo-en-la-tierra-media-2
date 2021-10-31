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
import model.*;

public class PromocionDAO {

	private Promocion toPromocion(ResultSet result) {
		try {
			
			//crear lista de atracciones
				//split group concat
				//split group_concat
			//recorres lo spliteado
			//buscas ese id en la lista de atracciones y lo agregas a la sublista para la promocion
			
			Promocion promocion = null;
			String query = "SELECT p.*, group_concat(id_atraccion) FROM promocion p LEFT JOIN promocion_atraccion pa ON p.id_promo = pa.id_promo GROUP BY p.id_promo";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet results = statement.executeQuery();
			
			String [] idGroup = results.getString(7).split(",");
			LinkedList<Comprable> atraccionesDeLaPromo = new LinkedList<Comprable>();
			AtraccionDAO atraccionDAO = new AtraccionDAO();
			
			for(String id : idGroup) {
				for(Comprable at : atraccionDAO.findAll()) {
					if(id == "" + at.getId()) {
						atraccionesDeLaPromo.add(at);
					}
				}
				
			}
			
			
			if(results.getDouble(4) != 0) {
				
				promocion = new PromocionPorcentual (results.getInt(1), results.getString(2),
						results.getString(3), results.getDouble(4), atraccionesDeLaPromo); 
			}else if(results.getDouble(5) != 0) {
				
				promocion = new PromocionAbsoluta (results.getInt(1), results.getString(2),
						results.getString(3), results.getInt(5), atraccionesDeLaPromo);
			}else if(results.getInt(6) != 0) {
				int idAtraccionGratis = results.getInt(6);
				Atraccion atraccionGratis = null;
				for (Comprable a : atraccionDAO.findAll()) {
					if(idAtraccionGratis == a.getId()) {
						atraccionGratis = (Atraccion) a;
					}
				}
				promocion = new PromocionAxB (results.getInt(1), results.getString(2),
						results.getString(3), atraccionGratis, atraccionesDeLaPromo);
			}
			return promocion;
			
		} catch (SQLException e) {
			throw new MissingDataException(e);
		}
	}

	public List<Comprable> findAll() {
		try {
			String query = "SELECT * FROM PROMOCION";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet results = statement.executeQuery();

			List<Comprable> promociones = new LinkedList<Comprable>();
			while (results.next()) {
				promociones.add((Comprable) toPromocion(results));
			}
			return promociones;

		} catch (SQLException e) {
			throw new MissingDataException(e);
		}
	}
	
	public int updateCupoPromocion(Promocion promo) {
		AtraccionDAO at = new AtraccionDAO();
		int r = 0;
		try {
			for (Comprable a : promo.getAtracciones()) {
				at.updateCupo(a);
			r +=  at.updateCupo(a);	
			}

		} catch (Exception e) {
			throw new MissingDataException(e);
		}
		return r;
	}

}
