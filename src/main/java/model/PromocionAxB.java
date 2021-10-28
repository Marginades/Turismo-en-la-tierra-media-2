package model;

import java.util.LinkedList;
import java.util.List;

public class PromocionAxB extends Promocion {

	private Comprable atraccionGratis;

	public PromocionAxB(int id, String tipo, String nombre, Comprable atraccionGratis, LinkedList<Comprable> atracciones) {
		super(id, tipo, atracciones, nombre);
		this.atraccionGratis = atraccionGratis;
	}

	public Comprable getAtraccionGratis() {
		return this.atraccionGratis;
	}

	@Override
	protected List<Comprable> getAtracciones() {
		LinkedList<Comprable> atraccionesTotales = new LinkedList<Comprable>();
		atraccionesTotales.addAll(this.atracciones);
		atraccionesTotales.add(this.getAtraccionGratis());
		return atraccionesTotales;
	}

	@Override
	public String toString() {
		String impresion = "Pack " + this.nombre + ", comprando:\n";
		for (Comprable a : atracciones) {
			impresion += a.getNombre() + "\n";
		}
		impresion += this.atraccionGratis.getNombre() + " es gratis\nTotal: " + this.getCosto();
		return impresion;
	}

	@Override
	public boolean hayCupo() {
		return super.hayCupo() && atraccionGratis.hayCupo();
	}

	@Override
	public int getCosto() {
		return super.getCosto();
	}

	@Override
	public double getDuracion() {
		return super.getDuracion() + atraccionGratis.getDuracion();
	}

	@Override
	public boolean esOContiene(Comprable atraccion) {
		if (!atraccion.equals(this.atraccionGratis)) {

			for (Comprable a : this.atracciones) {
				if (atraccion.equals(a)) {
					return true;
				}
			}

			return false;
		} else {
			return true;
		}
	}

	public boolean esComprablePor(Usuario user) {
		return false;
	}

	@Override
	public void comprarLugar() throws Exception {
		for (Comprable a : this.atracciones) {
			a.comprarLugar();
		}
		this.atraccionGratis.comprarLugar();
	}

	@Override
	public int getEntradasVendidas() {
		int entradas = 0;
		for (Comprable atraccion : this.atracciones) {
			entradas += atraccion.getEntradasVendidas();
		}
		return entradas + atraccionGratis.getEntradasVendidas();
	}

	public int getCupo() {
		// TODO Auto-generated method stub
		return 0;
	}

}
