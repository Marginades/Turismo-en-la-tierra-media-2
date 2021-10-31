package model;

import java.util.List;

public abstract class Promocion implements Comprable {
	protected int id_promo;
	protected List<Comprable> atracciones;
	protected String tipo;
	protected String nombre;

	// Constructor
	public Promocion(int id, String tipo, List<Comprable> atracciones, String nombre) {
		this.id_promo = id;
		this.tipo = tipo;
		this.nombre = nombre;
		this.atracciones = atracciones;
	}

	public List<Comprable> getAtracciones() {
		return this.atracciones;
	}

	// Metodos Overrride de Comprable
	public int getId() {
		return this.id_promo;
	}
	
	public String getNombre() {
		return this.nombre;
	}

	public String getTipo() {
		return this.tipo;
	}

	public int getCosto() {
		int contador = 0;
		for (Comprable atraccion : this.atracciones) {
			contador += atraccion.getCosto();
		}
		return contador;
	}

	public double getDuracion() {
		double duracion = 0;
		for (Comprable a : this.atracciones) {
			duracion += a.getDuracion();
		}
		return duracion;
	}

	public boolean hayCupo() {
		for (Comprable a : this.atracciones) {
			if (!a.hayCupo()) {
				return false;
			}
		}
		return true;
	}

	public int getEntradasVendidas() {
		int entradas = 0;
		for (Comprable atraccion : this.atracciones) {
			entradas += atraccion.getEntradasVendidas();
		}
		return entradas;
	}

	public void comprarLugar() throws Exception {
		for (Comprable a : this.atracciones) {
			a.comprarLugar(); // este metodo ya captura la excepcion en la clase atraccion
		}
	}

	public boolean esPromocion() {
		return true;
	}

	public boolean esOContiene(Comprable atraccion) {
		for (Comprable a : this.atracciones) {
			if (atraccion.equals(a)) {
				return true;
			}
		}

		return false;
	}

	// Imprimir
	@Override
	public String toString() {
		return "Llevá " + this.getNombre() + " por " + this.getCosto() + " monedas de oro";
	}

}
