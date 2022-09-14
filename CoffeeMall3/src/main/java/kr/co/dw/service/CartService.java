package kr.co.dw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.dw.domain.CartDTO;


public interface CartService {

	public int addCart(CartDTO cDto) throws Exception;

	public List<CartDTO> getCartList(String userId);
	
	public int updateCount(CartDTO cDto);
	
	public int deleteCart(int cartId);

}
