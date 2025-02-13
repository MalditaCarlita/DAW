public class Bolso extends Artículo {
	private String _codigo_articulo;
	private String _nombre;
	private String _descripcion;
	private String _color;
	private enum _tipo;
	private Firma _fabricacion;

	public Bolso() {
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

	public enum getTipo() {
		return this._tipo;
	}

	public void setTipo(enum aTipo) {
		this._tipo = aTipo;
	}

	public Firma getFabricacion() {
		return this._fabricacion;
	}

	public void setFabricacion(Firma aFabricacion) {
		this._fabricacion = aFabricacion;
	}
}