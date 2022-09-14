package kr.co.dw.repository;

import java.util.List;
import java.util.Map;

import kr.co.dw.domain.QnAReplyDTO;

public interface QnAReplyDAO {

	void insert(Map<String, Object> map);

	List<QnAReplyDTO> list(int qno);
	List<QnAReplyDTO> list(int qno, int curPage);

	void delete(Map<String, Object> map);

	void update(Map<String, Object> map);

	void deleteByQno(int qno);


}
