import java.util.Vector;

public class Tienda extends Empresa {
	private String _cIF;
	private String _nombre;
	private String _domicilio_fiscal;
	private articulo _articulo;
	public Vector<Artículo> _vende = new Vector<Artículo>();

	public void venderArticulos(Articulo aArticulo, int aCantidad) {
		throw new UnsupportedOperationException();
	}

	public Tienda() {
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

	public articulo getArticulo() {
		return this._articulo;
	}

	public void setArticulo(articulo aArticulo) {
		this._articulo = aArticulo;
	}
}