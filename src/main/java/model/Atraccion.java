package model;

public class Atraccion implements Comprable {
	private int id_atraccion;
	private String nombre;
	private int costo;
	private double duracion;
	private String tipo;
	private int entradasVendidas = 0;
	private int cupoMaximo;

	public Atraccion(int id_atraccion, String nombre, int costo, double duracion, int cupo, String tipo){
		this.id_atraccion = id_atraccion;
		this.nombre = nombre;
		this.costo = costo;
		this.duracion = duracion;
		this.cupoMaximo = cupo;
		this.tipo = tipo;
	}

	// Metodos Overrride de Comprable
	public String getNombre() {
		return nombre;
	}

	public int getCosto() {
		return this.costo;
	}

	public double getDuracion() {
		return this.duracion;
	}

	public String getTipo() {
		return tipo;
	}

	public int getCupo() {
		return this.cupoMaximo;
	}

	public int getEntradasVendidas() {
		return this.entradasVendidas;
	}

	public int getId() {
		return id_atraccion;
	}
	
	public boolean hayCupo() {
		return this.entradasVendidas < this.cupoMaximo;
	}


	// Modifica el atributo entradasVendidas
	public void comprarLugar() throws Exception {
		if (!this.hayCupo())
			throw new Exception("No Hay Mas Lugar");
		this.entradasVendidas += 1;
	}

	public boolean esOContiene(Comprable c) {
		return this.equals(c);
	}

	public boolean esComprablePor(Usuario user) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean esPromocion() {
		return false;
	}

	// Imprimir
	@Override
	public String toString() {
		return "Llevá " + this.nombre + " por " + this.costo + " monedas de oro";
	}

}
