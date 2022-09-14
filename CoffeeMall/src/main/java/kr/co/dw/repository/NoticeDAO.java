package kr.co.dw.repository;

import java.util.List;

import kr.co.dw.domain.NoticeDTO;
import kr.co.dw.domain.PageTO;

public interface NoticeDAO {
	
	List<NoticeDTO> list();

	void insert(NoticeDTO nDto);

	NoticeDTO read(int nno);

	void delete(int nno);

	NoticeDTO updateUI(int nno);

	void update(NoticeDTO nDto);

	void increaseReadCnt(int nno);

	Integer getAmountNotice();

	List<NoticeDTO> list(PageTO<NoticeDTO> pt);

	Integer getAmountSearch(String criteria, String keyword);

	List<NoticeDTO> search(PageTO<NoticeDTO> pt, String criteria, String keyword);


}
