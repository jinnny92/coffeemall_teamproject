package kr.co.dw.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

public class OrderAllDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String userId;
	private int uPostnumber;
	private String uAddress;
	private String udetailAddress;
	private String uName;
	private String uNickname;
	private String uPassword;
	private String uBirth;
	private String uPhone;
	private String uEmail;
	private String uGrade;
	private String uSigndate;
	private int uPoint;
	private int pno;
	private int pPrice;
	private String pName;
	private String pContent;
	private int pStock;
	private String pCategory;
	private String pSize;
	private String pOrigin;
	private String orderId;
	private String orderState;
	private int deliveryCost;
	private String orderDate;
	private int orderItemId;
	private int cartCount;
	private List<String> filenameList;
	
	public OrderAllDTO() {
		// TODO Auto-generated constructor stub
	}

	
	

	public OrderAllDTO(String userId, int uPostnumber, String uAddress, String udetailAddress, String uName,
			String uNickname, String uPassword, String uBirth, String uPhone, String uEmail, String uGrade,
			String uSigndate, int uPoint, int pno, int pPrice, String pName, String pContent, int pStock,
			String pCategory, String pSize, String pOrigin, String orderId, String orderState, int deliveryCost,
			String orderDate, int orderItemId, int cartCount, List<String> filenameList) {
		super();
		this.userId = userId;
		this.uPostnumber = uPostnumber;
		this.uAddress = uAddress;
		this.udetailAddress = udetailAddress;
		this.uName = uName;
		this.uNickname = uNickname;
		this.uPassword = uPassword;
		this.uBirth = uBirth;
		this.uPhone = uPhone;
		this.uEmail = uEmail;
		this.uGrade = uGrade;
		this.uSigndate = uSigndate;
		this.uPoint = uPoint;
		this.pno = pno;
		this.setpPrice(pPrice);
		this.pName = pName;
		this.pContent = pContent;
		this.pStock = pStock;
		this.pCategory = pCategory;
		this.pSize = pSize;
		this.pOrigin = pOrigin;
		this.orderId = orderId;
		this.orderState = orderState;
		this.deliveryCost = deliveryCost;
		this.orderDate = orderDate;
		this.orderItemId = orderItemId;
		this.cartCount = cartCount;
		this.filenameList = filenameList;
	}




	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getuPostnumber() {
		return uPostnumber;
	}

	public void setuPostnumber(int uPostnumber) {
		this.uPostnumber = uPostnumber;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public String getUdetailAddress() {
		return udetailAddress;
	}

	public void setUdetailAddress(String udetailAddress) {
		this.udetailAddress = udetailAddress;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuNickname() {
		return uNickname;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	public String getuBirth() {
		return uBirth;
	}

	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuGrade() {
		return uGrade;
	}

	public void setuGrade(String uGrade) {
		this.uGrade = uGrade;
	}

	public String getuSigndate() {
		return uSigndate;
	}

	public void setuSigndate(String uSigndate) {
		this.uSigndate = uSigndate;
	}

	public int getuPoint() {
		return uPoint;
	}

	public void setuPoint(int uPoint) {
		this.uPoint = uPoint;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public int getpStock() {
		return pStock;
	}

	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public String getpSize() {
		return pSize;
	}

	public void setpSize(String pSize) {
		this.pSize = pSize;
	}

	public String getpOrigin() {
		return pOrigin;
	}

	public void setpOrigin(String pOrigin) {
		this.pOrigin = pOrigin;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public int getDeliveryCost() {
		return deliveryCost;
	}

	public void setDeliveryCost(int deliveryCost) {
		this.deliveryCost = deliveryCost;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(orderItemId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderAllDTO other = (OrderAllDTO) obj;
		return orderItemId == other.orderItemId;
	}

	@Override
	public String toString() {
		return "OrderAllDTO [userId=" + userId + ", uPostnumber=" + uPostnumber + ", uAddress=" + uAddress
				+ ", udetailAddress=" + udetailAddress + ", uName=" + uName + ", uNickname=" + uNickname
				+ ", uPassword=" + uPassword + ", uBirth=" + uBirth + ", uPhone=" + uPhone + ", uEmail=" + uEmail
				+ ", uGrade=" + uGrade + ", uSigndate=" + uSigndate + ", uPoint=" + uPoint + ", pno=" + pno + ", pName="
				+ pName + ", pContent=" + pContent + ", pStock=" + pStock + ", pCategory=" + pCategory + ", pSize="
				+ pSize + ", pOrigin=" + pOrigin + ", orderId=" + orderId + ", orderState=" + orderState
				+ ", deliveryCost=" + deliveryCost + ", orderDate=" + orderDate + ", orderItemId=" + orderItemId
				+ ", cartCount=" + cartCount + "]";
	}

	public List<String> getFilenameList() {
		return filenameList;
	}

	public void setFilenameList(List<String> filenameList) {
		this.filenameList = filenameList;
	}




	public int getpPrice() {
		return pPrice;
	}




	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}


	
	
	
	
	
	
	

}
