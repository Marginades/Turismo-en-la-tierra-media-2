package model;

@SuppressWarnings("serial")
public class TipoInvalidoException extends RuntimeException{
	public TipoInvalidoException(String string) {
		super(string);
	}
}