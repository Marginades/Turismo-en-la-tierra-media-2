package model;

import java.util.LinkedList;

public class PromocionAbsoluta extends Promocion {

	private int precio;

	public PromocionAbsoluta(int id, String tipo, String nombre, int precio, LinkedList<Comprable> atracciones) {
		super(id, tipo, atracciones, nombre);
		this.precio = precio;
	}


	@Override
	public String toString() {
		String impresion = "Pack " + this.nombre + ", llevá:\n";
		for (Comprable a : atracciones) {
			impresion += a.getNombre() + "\n";
		}
		impresion += "a tan solo " + this.getCosto();
		return impresion;
	}

	@Override
	public int getCosto() {
		int precio = super.getCosto();
		return precio - this.precio;
	}

	public boolean esComprablePor(Usuario user) {
		// TODO Auto-generated method stub
		return false;
	}

	public int getCupo() {
		// TODO Auto-generated method stub
		return 0;
	}

}
