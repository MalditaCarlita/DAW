public class Incidencia {
	private String _código_reparto;
	private date _fecha_incidencia;
	private String _descripcion;
	public Reparto _se_produce;

	public Incidencia() {
		throw new UnsupportedOperationException();
	}

	public String getCódigo_reparto() {
		return this._código_reparto;
	}

	public void setCódigo_reparto(String aCódigo_reparto) {
		this._código_reparto = aCódigo_reparto;
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