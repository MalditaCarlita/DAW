import java.util.Vector;

public class Almacén {
	private String _cIF;
	private Object _codigo_departamento;
	private Pedido _pedido;
	private Empleado _empleado;
	public Vector<Pedido> _se_prepara_en = new Vector<Pedido>();
	public Vector<Empresa_de_transporte> _recogido_por = new Vector<Empresa_de_transporte>();
	public Almacen _unnamed_Almacen_;

	public Almacén() {
		throw new UnsupportedOperationException();
	}

	public String getCIF() {
		return this._cIF;
	}

	public void setCIF(String aCIF) {
		this._cIF = aCIF;
	}

	public void getCodigo_departamento() {
		return this._codigo_departamento;
	}

	public void setCodigo_departamento(Object aCodigo_departamento) {
		this._codigo_departamento = aCodigo_departamento;
	}

	public Pedido getPedido() {
		return this._pedido;
	}

	public void setPedido(Pedido aPedido) {
		this._pedido = aPedido;
	}

	public Empleado getEmpleado() {
		return this._empleado;
	}

	public void setEmpleado(Empleado aEmpleado) {
		this._empleado = aEmpleado;
	}
}