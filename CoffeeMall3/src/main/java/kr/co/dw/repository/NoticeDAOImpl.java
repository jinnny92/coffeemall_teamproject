package kr.co.dw.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.NoticeDTO;
import kr.co.dw.domain.PageTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "kr.co.dw.notice";

	@Override

	public List<NoticeDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".list");
	}

	@Override
	public void insert(NoticeDTO nDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE + ".insert", nDto);

	}

	@Override
	public NoticeDTO read(int nno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".read", nno);
	}

	@Override
	public void delete(int nno) {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE + ".delete", nno);
	}

	@Override
	public NoticeDTO updateUI(int nno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".updateUI", nno);
	}

	@Override
	public void update(NoticeDTO nDto) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE + ".update", nDto);
	}

	@Override
	public void increaseReadCnt(int nno) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE + ".increaseReadCnt", nno);

	}

	@Override
	public List<NoticeDTO> list(PageTO<NoticeDTO> pt) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds(pt.getStartNum() - 1, pt.getPerPage());
		return sqlSession.selectList(NAMESPACE + ".list", null, rb);
	}

	@Override
	public Integer getAmountSearch(String criteria, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("criteria", criteria);
		map.put("keyword", keyword);

		return sqlSession.selectOne(NAMESPACE + ".getAmountSearch", map);
	}

	@Override
	public List<NoticeDTO> search(PageTO<NoticeDTO> pt, String criteria, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("criteria", criteria);
		map.put("keyword", keyword);

		RowBounds rb = new RowBounds(pt.getStartNum() - 1, pt.getPerPage());

		return sqlSession.selectList(NAMESPACE + ".search", map, rb);
	}

	@Override
	public Integer getAmountNotice() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".getAmountNotice");
	}

}
