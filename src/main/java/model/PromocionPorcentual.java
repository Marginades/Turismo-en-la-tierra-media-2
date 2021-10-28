package model;

import java.util.LinkedList;

public class PromocionPorcentual extends Promocion {

	private double descuento;

	public PromocionPorcentual(int id, String tipo, String nombre, double descuento,
			LinkedList<Comprable> atracciones) {
		super(id, tipo, atracciones, nombre);
		this.descuento = descuento;
	}

	public double getDescuento() {
		return this.descuento;
	}

	@Override
	public String toString() {
		String impresion = "Pack " + this.nombre + ", llevando:\n";
		for (Comprable a : atracciones) {
			impresion += a.getNombre() + "\n";
		}
		impresion += "Tenés un " + this.descuento * 100 + "% de descuento\nTOTAL: " + this.getCosto()
				+ " monedas de oro";
		return impresion;
	}

	@Override
	public int getCosto() {
		int precio = super.getCosto();
		double descuento = precio * this.descuento;
		return (int) (precio - descuento);
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
