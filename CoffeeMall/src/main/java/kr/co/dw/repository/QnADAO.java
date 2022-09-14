package kr.co.dw.repository;

import java.util.List;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QnaDTO;

public interface QnADAO {

	List<QnaDTO> list();

	void insert(QnaDTO qDto);

	QnaDTO read(int qno);

	QnaDTO updateUI(int qno);

	void update(QnaDTO qDto);

	void delete(int qno);

	void increaseReadCnt(int qno);

	Integer getAmountQna();

	List<QnaDTO> list(PageTO<QnaDTO> pt);
	
	List<QnaDTO> search(PageTO<QnaDTO> pt, String criteria, String keyword);
	
	Integer getAmountSearch(String criteria, String keyword);

}
