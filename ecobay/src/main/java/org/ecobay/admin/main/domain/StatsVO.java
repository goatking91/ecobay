package org.ecobay.admin.main.domain;

public class StatsVO {
	private String skey;
	private int val;
<<<<<<< HEAD
=======
	
	public String getSkey() {
		return skey;
	}
	public void setSkey(String skey) {
		this.skey = skey;
	}
	public int getVal() {
		return val;
	}
	public void setVal(int val) {
		this.val = val;
	}
	
	public StatsVO() {
		super();
	}
	public StatsVO(String skey, int val) {
		super();
		this.skey = skey;
		this.val = val;
	}
	
	@Override
	public String toString() {
		return "StatsVO ["
				+ "skey=" + skey 
				+ ", val=" + val 
				+ "]";
	}
>>>>>>> f53421a84dbe9cad7325ed3f48cc0efbece281af
}
