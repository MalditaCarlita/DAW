import java.util.Vector;

public class Empresa_de_transporte extends Empresa {
	private String _cIF;
	private String _nombre;
	private String _domicilio_fiscal;
	private pedido _pedido;
	private ruta _ruta;
	public Vector<Reparto> _realiza = new Vector<Reparto>();
	public Vector<Almacén> _recogido_por = new Vector<Almacén>();

	public boolean repartirPedido(Pedido aPedido, Almacen aAlmacen, String aDestino) {
		throw new UnsupportedOperationException();
	}

	public Empresa_de_transporte() {
		throw new UnsupportedOperationException();
	}

	public String getCIF() {
		return this._cIF;
	}

	public void setCIF(String aCIF) {
		this._cIF = aCIF;
	}

	public String getNombre() {
		return this._nombre;
	}

	public void setNombre(String aNombre) {
		this._nombre = aNombre;
	}

	public String getDomicilio_fiscal() {
		return this._domicilio_fiscal;
	}

	public void setDomicilio_fiscal(String aDomicilio_fiscal) {
		this._domicilio_fiscal = aDomicilio_fiscal;
	}

	public pedido getPedido() {
		return this._pedido;
	}

	public void setPedido(pedido aPedido) {
		this._pedido = aPedido;
	}

	public ruta getRuta() {
		return this._ruta;
	}

	public void setRuta(ruta aRuta) {
		this._ruta = aRuta;
	}
}