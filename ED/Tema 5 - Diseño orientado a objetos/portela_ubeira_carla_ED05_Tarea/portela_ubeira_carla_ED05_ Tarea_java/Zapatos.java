public class Zapatos extends Artículo {
	private String _codigo_articulo;
	private String _nombre;
	private String _descripcion;
	private String _color;
	private int _numero;
	private String _tipo;
	private Firma _fabricacion;

	public Zapatos() {
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

	public int getNumero() {
		return this._numero;
	}

	public void setNumero(int aNumero) {
		this._numero = aNumero;
	}

	public String getTipo() {
		return this._tipo;
	}

	public void setTipo(String aTipo) {
		this._tipo = aTipo;
	}

	public Firma getFabricacion() {
		return this._fabricacion;
	}

	public void setFabricacion(Firma aFabricacion) {
		this._fabricacion = aFabricacion;
	}
}