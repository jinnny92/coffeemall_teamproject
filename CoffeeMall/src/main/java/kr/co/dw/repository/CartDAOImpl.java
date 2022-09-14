package kr.co.dw.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.dw.domain.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO{

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "kr.co.dw.cart";
	
	
	@Override
	public int addcart(CartDTO cDto) {
		// TODO Auto-generated method stub
		System.out.println(sqlSession);
		System.out.println(cDto);
		return sqlSession.insert(NAMESPACE+".addcart", cDto);
	}

	@Override
	public int deleteCart(int cartId) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+".deleteCart", cartId);
	}

	@Override
	public int updateCount(CartDTO cDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+".updateCount", cDto);
	}

	@Override
	public List<CartDTO> getCart(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".getCart", userId);
	}

	@Override
	public CartDTO checkCart(CartDTO cDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".checkCart", cDto);
	}

	@Override
	public int deleteOrderCart(CartDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+".deleteOrderCart", dto);
	}


	
	
}
