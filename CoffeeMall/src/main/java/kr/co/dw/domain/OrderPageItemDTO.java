package kr.co.dw.domain;

import java.io.Serializable;

public class OrderPageItemDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int pno;
	private int cartCount;
	private String pName;
	private int pPrice;
	private int totalPrice;
	
	public OrderPageItemDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderPageItemDTO(int pno, int cartCount, String pName, int pPrice, int totalPrice) {
		super();
		this.pno = pno;
		this.cartCount = cartCount;
		this.pName = pName;
		this.pPrice = pPrice;
		this.totalPrice = totalPrice;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getcartCount() {
		return cartCount;
	}

	public void setcartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderPageItemDTO other = (OrderPageItemDTO) obj;
		return pno == other.pno;
	}



	public void settingTotalPrice() {
		this.totalPrice = this.pPrice*this.cartCount;
	}

	@Override
	public String toString() {
		return "OrderPageItemDTO [pno=" + pno + ", cartCount=" + cartCount + ", pName=" + pName + ", pPrice=" + pPrice
				+ ", totalPrice=" + totalPrice + "]";
	}
	
	
	
}
