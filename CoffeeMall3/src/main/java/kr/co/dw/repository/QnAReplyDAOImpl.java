package kr.co.dw.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QnAReplyDTO;

@Repository
public class QnAReplyDAOImpl implements QnAReplyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dw.qnareply";

	@Override
	public void insert(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE+".insert", map);
		
	}

	@Override
	public List<QnAReplyDTO> list(int qno) {
		
		return sqlSession.selectList(NAMESPACE+".list", qno);
	}
	
	
	@Override
	public List<QnAReplyDTO> list(int qno, int curPage) {
		// TODO Auto-generated method stub
		PageTO<QnAReplyDTO> pt = new PageTO<QnAReplyDTO>(curPage);
		
		Integer amount = sqlSession.selectOne(NAMESPACE+".getAmount", qno);
		if(amount == null) amount = 0;
		pt.setAmount(amount);
		
		RowBounds rb = new RowBounds(pt.getStartNum()-1, pt.getPerPage());
		return sqlSession.selectList(NAMESPACE+".list", qno, rb);
	}

	@Override
	public void delete(Map<String, Object> map) {
		sqlSession.delete(NAMESPACE+".delete", map);
		
	}

	@Override
	public void update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".update", map);
	}

	@Override
	public void deleteByQno(int qno) {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".deleteByQno", qno);
	}


}
