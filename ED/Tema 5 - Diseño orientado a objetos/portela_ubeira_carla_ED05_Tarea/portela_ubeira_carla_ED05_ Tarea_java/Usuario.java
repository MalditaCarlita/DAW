public class Usuario extends Persona {
	private String _sesion;

	/**
	 * El usuario navega  en una página web, para lo cual introduce una dirección url
	 */
	public void navegar(String aUrl) {
		throw new UnsupportedOperationException();
	}

	public void registrar(String aNombre_completo, String aCorreo_electronico, String aDireccion) {
		throw new UnsupportedOperationException();
	}

	public Usuario() {
		throw new UnsupportedOperationException();
	}

	public String getSesion() {
		return this._sesion;
	}

	public void setSesion(String aSesion) {
		this._sesion = aSesion;
	}
}