public class Complemento extends Artículo {
	private String _codigo_articulo;
	private String _nombre;
	private String _descripcion;
	private String _color;
	private int _talla;
	private Firma _fabricacion;

	public Complemento() {
		throw new UnsupportedOperationException();
	}

	public String getCodigo_articulo() {
		return this._codigo_articulo;
	}

	public void setCodigo_articulo(String aCodigo_articulo) {
		this._codigo_articulo = aCodigo_articulo;
	}

	public String getNombre() {
		return this._nombre;
	}

	public void setNombre(String aNombre) {
		this._nombre = aNombre;
	}

	public String getDescripcion() {
		return this._descripcion;
	}

	public void setDescripcion(String aDescripcion) {
		this._descripcion = aDescripcion;
	}

	public String getColor() {
		return this._color;
	}

	public void setColor(String aColor) {
		this._color = aColor;
	}

	public int getTalla() {
		return this._talla;
	}

	public void setTalla(int aTalla) {
		this._talla = aTalla;
	}

	public Firma getFabricacion() {
		return this._fabricacion;
	}

	public void setFabricacion(Firma aFabricacion) {
		this._fabricacion = aFabricacion;
	}
}