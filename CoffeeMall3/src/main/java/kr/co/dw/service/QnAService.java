package kr.co.dw.service;

import java.util.List;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QnaDTO;

public interface QnAService {

	PageTO<QnaDTO> list(Integer curpage);

	List<QnaDTO> list();

	void insert(QnaDTO qDto);

	QnaDTO read(int qno, String ip);

	QnaDTO updateUI(int qno);

	void update(QnaDTO qDto, String[] arr, List<String> fileList);

	void delete(int qno);

	QnaDTO read(int qno);

	void update(QnaDTO qDto);

	PageTO<QnaDTO> search(Integer curpage, String criteria, String keyword);	
	
}
