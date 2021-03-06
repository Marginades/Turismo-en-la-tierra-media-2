package model;

import java.util.Comparator;

public class ComparadorDeComprables implements Comparator<Comprable> {
	private String preferencia;

	public ComparadorDeComprables(String preferencia) {
		this.preferencia = preferencia;
	}

	public int compare(Comprable c1, Comprable c2) {
		if (this.preferencia == c1.getTipo() && this.preferencia != c2.getTipo())
			return -1;
		else if (this.preferencia != c1.getTipo() && this.preferencia == c2.getTipo())
			return 1;
		else {
			if (c1.esPromocion() && !c2.esPromocion())
				return -1;
			else if (!c1.esPromocion() && c2.esPromocion())
				return 1;
			else {
				if (c1.getCosto() > c2.getCosto())
					return -1;
				else if (c1.getCosto() < c2.getCosto())
					return 1;
				else {
					return -1 * Double.compare(c1.getDuracion(), c2.getDuracion());
				}
			}
		}
	}
}
