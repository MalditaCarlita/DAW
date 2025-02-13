public class Pago {
	private String _codigo_transaccion;
	private Socio _socio;
	private Tarjeta _tarjeta;
	private date _fecha;
	public Tarjeta _realiza;

	public Pago() {
		throw new UnsupportedOperationException();
	}

	public String getCodigo_transaccion() {
		return this._codigo_transaccion;
	}

	public void setCodigo_transaccion(String aCodigo_transaccion) {
		this._codigo_transaccion = aCodigo_transaccion;
	}

	public Socio getSocio() {
		return this._socio;
	}

	public void setSocio(Socio aSocio) {
		this._socio = aSocio;
	}

	public Tarjeta getTarjeta() {
		return this._tarjeta;
	}

	public void setTarjeta(Tarjeta aTarjeta) {
		this._tarjeta = aTarjeta;
	}

	public date getFecha() {
		return this._fecha;
	}

	public void setFecha(date aFecha) {
		this._fecha = aFecha;
	}
}