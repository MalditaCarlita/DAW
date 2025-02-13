public class Empleado_de_alamacén extends Empleado {
	private String _nIF;
	private String _codigo_empleado;
	private String _puesto;
	private String _cIF;

	public boolean revisarPedido(Pedido aPedido) {
		throw new UnsupportedOperationException();
	}

	public boolean completarPedido(Pedido aPedido) {
		throw new UnsupportedOperationException();
	}

	public Empleado_de_alamacén() {
		throw new UnsupportedOperationException();
	}

	public String getNIF() {
		return this._nIF;
	}

	public void setNIF(String aNIF) {
		this._nIF = aNIF;
	}

	public String getCodigo_empleado() {
		return this._codigo_empleado;
	}

	public void setCodigo_empleado(String aCodigo_empleado) {
		this._codigo_empleado = aCodigo_empleado;
	}

	public String getPuesto() {
		return this._puesto;
	}

	public void setPuesto(String aPuesto) {
		this._puesto = aPuesto;
	}

	public String getCIF() {
		return this._cIF;
	}

	public void setCIF(String aCIF) {
		this._cIF = aCIF;
	}
}