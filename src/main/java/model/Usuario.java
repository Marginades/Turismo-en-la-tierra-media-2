package model;

import java.util.LinkedList;
import java.util.List;

public class Usuario {
	private int id_usuario;
	private String nombre;
	private int presupuesto;
	private double disponibilidad;
	private String preferencia;
	private List<Comprable> itinerario;

	public Usuario(String nombre, int presupuesto, double disponibilidad, String preferencia) {
		this.nombre = nombre;
		this.presupuesto = presupuesto;
		this.disponibilidad = disponibilidad;
		this.preferencia = preferencia;
		this.itinerario = new LinkedList<Comprable>();
	}

	public void comprar(Comprable producto) throws Exception {
		if (this.puedeComprar(producto)) {
			this.presupuesto -= producto.getCosto();
			this.disponibilidad -= producto.getDuracion();
			producto.comprarLugar();
			this.agregarAlItinerario(producto);
		}
	}

	private void agregarAlItinerario(Comprable producto) {
		if (producto.esPromocion()) {
			this.itinerario.addAll(((Promocion) producto).getAtracciones());
		} else if (!producto.esPromocion()) {
			this.itinerario.add(producto);
		}
	}

	public boolean puedeComprar(Comprable producto) {
		return this.presupuesto >= producto.getCosto() && this.disponibilidad >= producto.getDuracion()
				&& !this.yaCompro(producto);
	}

	public boolean yaCompro(Comprable producto) {
		boolean contiene = false;
		if (producto.esPromocion()) {
			for (Comprable atraccion : ((Promocion) producto).getAtracciones()) {
				if (this.itinerario.contains(atraccion)) {
					contiene = true;
				}
			}

		} else if (!producto.esPromocion()) {
			contiene = this.itinerario.contains(producto);
		}
		return contiene;
	}

	public String getPreferencia() {
		return this.preferencia;
	}

	public boolean estaEnCero() {
		return this.disponibilidad == 0 || this.presupuesto == 0;
	}

	@Override
	public String toString() {
		String excursiones = "";
		Double duracion = 0.0;
		int gastado = 0;

		for (Comprable p : itinerario) {
			excursiones += p.getNombre() + "\n";
			duracion += p.getDuracion();
			gastado += p.getCosto();
		}

		return "Itinerario de " + this.nombre + ":\n" + excursiones + "\nTiempo total: " + duracion + "\nGasto: "
				+ gastado;
	}

	public int getPresupuesto() {
		return presupuesto;
	}

	public double getDisponibilidad() {
		return disponibilidad;
	}

	public List<Comprable> getItinerario() {
		return itinerario;
	}

	public String getNombre() {
		return nombre;
	}

	public int getId() {
		return id_usuario;
	}

}
