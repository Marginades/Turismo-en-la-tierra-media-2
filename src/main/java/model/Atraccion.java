package model;

public class Atraccion implements Comprable {
	private int id_atraccion;
	private String nombre;
	private double costo;
	private double duracion;
	private int cupo;
	private String tipo;

	public Atraccion(int id_atracion, String nombre, double costo, double duracion, int cupo, String tipo) {
		this.nombre = nombre;
		this.costo = costo;
		this.duracion = duracion;
		this.cupo = cupo;
		this.tipo = tipo;
	}

	// Metodos Overrride de Comprable
	@Override
	public String getNombre() {
		return nombre;
	}

	@Override
	public double getCosto() {
		return this.costo;
	}

	@Override
	public double getDuracion() {
		return this.duracion;
	}

	@Override
	public String getTipo() {
		return tipo;
	}

	@Override
	public boolean hayCupo() {
		return this.entradasVendidas < this.cupoMaximo;
	}

	public int getCupoMaximo() {
		return this.cupoMaximo;
	}

	public int getEntradasVendidas() {
		return this.entradasVendidas;
	}

	// Setters con excepciones
	private void setCosto(int costo) {
		if (costo < 0)
			throw new MontoInvalidoException("El monto debe ser mayor a 0");
		this.costo = costo;
	}

	private void setDuracion(double duracion) {
		if (duracion <= 0)
			throw new DuracionInvalidaException("La duracion debe ser mayor a 0");
		this.duracion = duracion;
	}

	private void setCupoMaximo(int cupoMaximo) {
		if (cupoMaximo <= 0)
			throw new CupoMaximoInvalidoException("El cupo debe ser mayor a 0");
		this.cupoMaximo = cupoMaximo;
	}

	// Modifica el atributo entradasVendidas
	public void comprarLugar() {
		if (!this.hayCupo())
			throw new CupoMaximoAlcanzadoException("No Hay Mas Lugar");
		this.entradasVendidas += 1;
	}

	@Override
	public boolean esOContiene(Comprable c) {
		return this.equals(c);
	}

	@Override
	public boolean esComprablePor(Usuario user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean esPromocion() {
		return false;
	}

	// Imprimir
	@Override
	public String toString() {
		return "Llevá " + this.nombre + " por " + this.costo + " monedas de oro";
	}
}
