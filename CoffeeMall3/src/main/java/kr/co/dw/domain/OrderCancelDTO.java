package kr.co.dw.domain;

import java.util.Objects;

public class OrderCancelDTO {
	
	private String userId;
	
	private String orderId;
	
	private String keyword;
	
	private int amount;
	
	private int pageNum;

	public OrderCancelDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderCancelDTO(String userId, String orderId, String keyword, int amount, int pageNum) {
		super();
		this.userId = userId;
		this.orderId = orderId;
		this.keyword = keyword;
		this.amount = amount;
		this.pageNum = pageNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	@Override
	public int hashCode() {
		return Objects.hash(orderId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderCancelDTO other = (OrderCancelDTO) obj;
		return Objects.equals(orderId, other.orderId);
	}

	@Override
	public String toString() {
		return "OrderCancelDTO [userId=" + userId + ", orderId=" + orderId + ", keyword=" + keyword + ", amount="
				+ amount + ", pageNum=" + pageNum + "]";
	}

	
	
}
