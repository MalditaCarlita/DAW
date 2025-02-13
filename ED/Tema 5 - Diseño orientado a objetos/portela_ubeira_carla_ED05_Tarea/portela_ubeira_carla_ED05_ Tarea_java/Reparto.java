import java.util.Vector;

public class Reparto {
	private String _c�digo_reparto;
	private date _fecha_reparto;
	private Pedido _pedido;
	private Ruta _ruta;
	private String _destino;
	private Incidencia _incidencia;
	public Socio _recibido_por;
	public Empresa_de_transporte _realiza;
	public Vector<Incidencia> _se_produce = new Vector<Incidencia>();

	public Reparto() {
		throw new UnsupportedOperationException();
	}

	public String getC�digo_reparto() {
		return this._c�digo_reparto;
	}

	public void setC�digo_reparto(String aC�digo_reparto) {
		this._c�digo_reparto = aC�digo_reparto;
	}

	public date getFecha_reparto() {
		return this._fecha_reparto;
	}

	public void setFecha_reparto(date aFecha_reparto) {
		this._fecha_reparto = aFecha_reparto;
	}

	public Pedido getPedido() {
		return this._pedido;
	}

	public void setPedido(Pedido aPedido) {
		this._pedido = aPedido;
	}

	public Ruta getRuta() {
		return this._ruta;
	}

	public void setRuta(Ruta aRuta) {
		this._ruta = aRuta;
	}

	public String getDestino() {
		return this._destino;
	}

	public void setDestino(String aDestino) {
		this._destino = aDestino;
	}

	public Incidencia getIncidencia() {
		return this._incidencia;
	}

	public void setIncidencia(Incidencia aIncidencia) {
		this._incidencia = aIncidencia;
	}
}