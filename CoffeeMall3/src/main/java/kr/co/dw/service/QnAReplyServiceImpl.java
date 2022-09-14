package kr.co.dw.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.dw.domain.Criteria;
import kr.co.dw.domain.PageMakerDTO;
import kr.co.dw.domain.QnAReplyDTO;
import kr.co.dw.domain.ReplyPageDTO;
import kr.co.dw.repository.QnAReplyDAO;

@Service
public class QnAReplyServiceImpl implements QnAReplyService {

	@Autowired
	private QnAReplyDAO qrDao;

	@Override
	public void insert(Map<String, Object> map) {
		qrDao.insert(map);
		
	}

	@Override
	public List<QnAReplyDTO> list(int qno) {
		// TODO Auto-generated method stub
		return qrDao.list(qno);
	}
	
	@Override
	public List<QnAReplyDTO> list(int qno, int curPage) {
		// TODO Auto-generated method stub
		return qrDao.list(qno, curPage);
	}

	@Override
	public void delete(Map<String, Object> map) {
		qrDao.delete(map);
		
	}

	@Override
	public void update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		qrDao.update(map);
	}

	@Override
	public void deleteByQno(int qno) {
		// TODO Auto-generated method stub
		qrDao.deleteByQno(qno);
	}


}
