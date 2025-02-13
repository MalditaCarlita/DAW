import java.util.Vector;

public class Tarjeta {
	private String _titular;
	private int _numero;
	private int _cVC;
	private date _fecha_validez;
	public Socio _posee;
	public Vector<Pago> _realiza = new Vector<Pago>();

	public Tarjeta() {
		throw new UnsupportedOperationException();
	}

	public String getTitular() {
		return this._titular;
	}

	public void setTitular(String aTitular) {
		this._titular = aTitular;
	}

	public int getNumero() {
		return this._numero;
	}

	public void setNumero(int aNumero) {
		this._numero = aNumero;
	}

	public int getCVC() {
		return this._cVC;
	}

	public void setCVC(int aCVC) {
		this._cVC = aCVC;
	}

	public date getFecha_validez() {
		return this._fecha_validez;
	}

	public void setFecha_validez(date aFecha_validez) {
		this._fecha_validez = aFecha_validez;
	}
}