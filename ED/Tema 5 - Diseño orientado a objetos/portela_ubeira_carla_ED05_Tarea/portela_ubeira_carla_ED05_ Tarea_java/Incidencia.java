public class Incidencia {
	private String _c�digo_reparto;
	private date _fecha_incidencia;
	private String _descripcion;
	public Reparto _se_produce;

	public Incidencia() {
		throw new UnsupportedOperationException();
	}

	public String getC�digo_reparto() {
		return this._c�digo_reparto;
	}

	public void setC�digo_reparto(String aC�digo_reparto) {
		this._c�digo_reparto = aC�digo_reparto;
	}

	public date getFecha_incidencia() {
		return this._fecha_incidencia;
	}

	public void setFecha_incidencia(date aFecha_incidencia) {
		this._fecha_incidencia = aFecha_incidencia;
	}

	public String getDescripcion() {
		return this._descripcion;
	}

	public void setDescripcion(String aDescripcion) {
		this._descripcion = aDescripcion;
	}
}