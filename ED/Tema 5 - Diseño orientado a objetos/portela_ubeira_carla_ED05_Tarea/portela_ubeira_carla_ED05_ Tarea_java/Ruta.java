import java.util.Vector;

public class Ruta {
	private String _codigo_ruta;
	private String _ar�as_influencia;
	private String _dias_reparto;
	public Vector<Empresa_de_transporte> _realiza = new Vector<Empresa_de_transporte>();

	public Ruta() {
		throw new UnsupportedOperationException();
	}

	public String getCodigo_ruta() {
		return this._codigo_ruta;
	}

	public void setCodigo_ruta(String aCodigo_ruta) {
		this._codigo_ruta = aCodigo_ruta;
	}

	public String getAr�as_influencia() {
		return this._ar�as_influencia;
	}

	public void setAr�as_influencia(String aAr�as_influencia) {
		this._ar�as_influencia = aAr�as_influencia;
	}

	public String getDias_reparto() {
		return this._dias_reparto;
	}

	public void setDias_reparto(String aDias_reparto) {
		this._dias_reparto = aDias_reparto;
	}
}