public class Pedido {
	private String _codigo_pedido;
	private date _fecha;
	private double _importe;
	private Socio _socio;
	private articulo___cantidad___int _articulo;
	private boolean _pagado;
	private boolean _revisado;
	private boolean _completado;
	private boolean _en_reparto;
	private boolean _entregado;
	private Pago _pago;
	public Socio _realiza;
	public Almacén _se_prepara_en;

	public Pedido() {
		throw new UnsupportedOperationException();
	}

	public String getCodigo_pedido() {
		return this._codigo_pedido;
	}

	public void setCodigo_pedido(String aCodigo_pedido) {
		this._codigo_pedido = aCodigo_pedido;
	}

	public date getFecha() {
		return this._fecha;
	}

	public void setFecha(date aFecha) {
		this._fecha = aFecha;
	}

	public double getImporte() {
		return this._importe;
	}

	public void setImporte(double aImporte) {
		this._importe = aImporte;
	}

	public Socio getSocio() {
		return this._socio;
	}

	public void setSocio(Socio aSocio) {
		this._socio = aSocio;
	}

	public articulo___cantidad___int getArticulo() {
		return this._articulo;
	}

	public void setArticulo(articulo___cantidad___int aArticulo) {
		this._articulo = aArticulo;
	}

	public boolean getPagado() {
		return this._pagado;
	}

	public void setPagado(boolean aPagado) {
		this._pagado = aPagado;
	}

	public boolean getRevisado() {
		return this._revisado;
	}

	public void setRevisado(boolean aRevisado) {
		this._revisado = aRevisado;
	}

	public boolean getCompletado() {
		return this._completado;
	}

	public void setCompletado(boolean aCompletado) {
		this._completado = aCompletado;
	}

	public boolean getEn_reparto() {
		return this._en_reparto;
	}

	public void setEn_reparto(boolean aEn_reparto) {
		this._en_reparto = aEn_reparto;
	}

	public boolean getEntregado() {
		return this._entregado;
	}

	public void setEntregado(boolean aEntregado) {
		this._entregado = aEntregado;
	}

	public Pago getPago() {
		return this._pago;
	}

	public void setPago(Pago aPago) {
		this._pago = aPago;
	}
}