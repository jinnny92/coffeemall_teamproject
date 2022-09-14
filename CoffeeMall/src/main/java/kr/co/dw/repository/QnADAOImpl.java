package kr.co.dw.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QnaDTO;

@Repository
public class QnADAOImpl implements QnADAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "kr.co.dw.qna";

	@Override
	public List<QnaDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".list");
	}

	@Override
	public void insert(QnaDTO qDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE + ".insert", qDto);
	}

	@Override
	public QnaDTO read(int qno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".read", qno);
	}

	@Override
	public QnaDTO updateUI(int qno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".updateUI", qno);
	}

	@Override
	public void update(QnaDTO qDto) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE + ".update", qDto);
	}

	@Override
	public void delete(int qno) {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE + ".delete", qno);
	}

	@Override
	public void increaseReadCnt(int qno) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE + ".increaseReadCnt", qno);
	}

	@Override
	public Integer getAmountQna() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".getAmountQna");
	}

	@Override
	public List<QnaDTO> list(PageTO<QnaDTO> pt) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds(pt.getStartNum() - 1, pt.getPerPage());

		return sqlSession.selectList(NAMESPACE + ".list", null, rb);
	}

	@Override
	public List<QnaDTO> search(PageTO<QnaDTO> pt, String criteria, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("criteria", criteria);

		RowBounds rb = new RowBounds(pt.getStartNum() - 1, pt.getPerPage());

		return sqlSession.selectList(NAMESPACE + ".search", map, rb);
	}

	@Override
	public Integer getAmountSearch(String criteria, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("criteria", criteria);
		map.put("keyword", keyword);

		return sqlSession.selectOne(NAMESPACE + ".getAmountSearch", map);

	}

}
