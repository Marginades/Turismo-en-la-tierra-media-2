package model;

public class Atraccion {
	private int id_atraccion;
	private String nombre;
	private int costo;
	private double duracion;
	private int cupo;
	private String tipo;

	public Atraccion(int id_atracion, String nombre, int costo, double duracion, int cupo,
			String tipo) {
		this.nombre = nombre;
		this.costo = costo;
		this.duracion = duracion;
		this.cupo = cupo;
		this.tipo = tipo;
	}
}
