import java.util.Vector;

public class Firma extends Empresa {
	private String _cIF;
	private String _nombre;
	private String _domicilio_fiscal;
	private Articulo _articulo;
	public Vector<Artículo> _fabrica = new Vector<Artículo>();

	public Firma() {
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

	public Articulo getArticulo() {
		return this._articulo;
	}

	public void setArticulo(Articulo aArticulo) {
		this._articulo = aArticulo;
	}
}