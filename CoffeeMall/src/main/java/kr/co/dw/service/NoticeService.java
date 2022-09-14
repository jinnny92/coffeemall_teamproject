package kr.co.dw.service;

import java.util.List;

import kr.co.dw.domain.NoticeDTO;
import kr.co.dw.domain.PageTO;

public interface NoticeService {
	List<NoticeDTO> list();

	void insert(NoticeDTO nDto);

	NoticeDTO read(int nno);

	void delete(int nno);

	NoticeDTO updateUI(int nno);

	void update(NoticeDTO nDto);

	NoticeDTO read(int nno, String ip);

	PageTO<NoticeDTO> list(Integer curpage);

	PageTO<NoticeDTO> search(Integer curpage, String criteria, String keyword);

	void update(NoticeDTO nDto, String[] arr, List<String> fileList);

}
