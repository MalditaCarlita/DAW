import java.util.Vector;

public class Socio extends Persona {
	private String _sesion;
	private String _nIF;
	private String _nombre_completo;
	private String _correo_electronico;
	private String _direccion;
	public Vector<Tarjeta> _posee = new Vector<Tarjeta>();
	public Vector<Pedido> _realiza = new Vector<Pedido>();
	public Vector<Reparto> _recibido_por = new Vector<Reparto>();

	public boolean hacerPedido(Articulo aArticulo, int aCantidad, Pago aPago) {
		throw new UnsupportedOperationException();
	}

	public void visualizarPedido(Pedido aPedido) {
		throw new UnsupportedOperationException();
	}

	public void cancelarPedido(Pedido aPedido) {
		throw new UnsupportedOperationException();
	}

	public void modificarDatos(String aNombre_completo, String aCorreo_electronico, String aDireccion) {
		throw new UnsupportedOperationException();
	}

	public boolean pagar(Tarjeta aTarjeta, double aImporte) {
		throw new UnsupportedOperationException();
	}

	public Socio() {
		throw new UnsupportedOperationException();
	}

	public String getSesion() {
		return this._sesion;
	}

	public void setSesion(String aSesion) {
		this._sesion = aSesion;
	}

	public String getNIF() {
		return this._nIF;
	}

	public void setNIF(String aNIF) {
		this._nIF = aNIF;
	}

	public String getNombre_completo() {
		return this._nombre_completo;
	}

	public void setNombre_completo(String aNombre_completo) {
		this._nombre_completo = aNombre_completo;
	}

	public String getCorreo_electronico() {
		return this._correo_electronico;
	}

	public void setCorreo_electronico(String aCorreo_electronico) {
		this._correo_electronico = aCorreo_electronico;
	}

	public String getDireccion() {
		return this._direccion;
	}

	public void setDireccion(String aDireccion) {
		this._direccion = aDireccion;
	}
}