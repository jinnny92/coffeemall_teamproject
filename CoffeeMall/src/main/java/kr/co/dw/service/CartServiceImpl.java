package kr.co.dw.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dw.domain.CartDTO;
import kr.co.dw.domain.ProductDTO;
import kr.co.dw.repository.CartDAO;
import kr.co.dw.repository.ProUploadDAO;
import kr.co.dw.repository.UploadDAO;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cDao;
	
	@Autowired
	private ProUploadDAO uDao;
	
	
	@Override
	public int addCart(CartDTO cDto) {
		// TODO Auto-generated method stub
		CartDTO checkCart = cDao.checkCart(cDto);
		
		if (checkCart != null) {
			return 2;
		}
		try {
			return cDao.addcart(cDto);
		} catch (Exception e) {
			return 0;
		}
		
		
	}


	@Override
	public List<CartDTO> getCartList(String userId) {
		// TODO Auto-generated method stub
		List<CartDTO> cart = cDao.getCart(userId);
		for (CartDTO cDto : cart) {
			cDto.settingTotalPrice();
			
			int pno = cDto.getPno();
			List<String> filenameList = uDao.getAllUpload(pno);
			
			cDto.setGetAllUpload(filenameList);
		}
		
		return cart;
	}


	@Override
	public int updateCount(CartDTO cDto) {
		// TODO Auto-generated method stub
		return cDao.updateCount(cDto);
	}


	@Override
	public int deleteCart(int cartId) {
		// TODO Auto-generated method stub
		return cDao.deleteCart(cartId);
	}





	/*
	 * @Override public List<CartDTO> getCartList(String userId) { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 */

}
