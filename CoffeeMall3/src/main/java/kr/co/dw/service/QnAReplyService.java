package kr.co.dw.service;

import java.util.List;
import java.util.Map;

import kr.co.dw.domain.QnAReplyDTO;

public interface QnAReplyService {

	void insert(Map<String, Object> map);

	List<QnAReplyDTO> list(int qno);
	List<QnAReplyDTO> list(int qno, int curPage);

	void delete(Map<String, Object> map);

	void update(Map<String, Object> map);

	void deleteByQno(int qno);


}
