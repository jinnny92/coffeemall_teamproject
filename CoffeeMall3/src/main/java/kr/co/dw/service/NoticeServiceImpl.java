package kr.co.dw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.NoticeDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.repository.NoticeDAO;
import kr.co.dw.repository.NoticeUploadDAO;
import kr.co.dw.repository.ReadCntDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO nDao;

	@Autowired
	private NoticeUploadDAO uDao;

	@Autowired
	private ReadCntDAO readCntDao;

	@Override
	public List<NoticeDTO> list() {
		// TODO Auto-generated method stub
		return nDao.list();
	}

	@Transactional
	@Override
	public void insert(NoticeDTO nDto) {
		// TODO Auto-generated method stub
		nDao.insert(nDto);

		int nno = nDto.getNno();
		List<String> list = nDto.getFilenameList();

		for (int i = 0; i < list.size(); i++) {
			String filename = list.get(i);
			uDao.insert(filename, nno);

		}
	}

	@Override
	public NoticeDTO read(int nno) {
		nDao.increaseReadCnt(nno);
		NoticeDTO nDto = nDao.read(nno);
		// String nContent =
		// nDto.getnContent().replaceAll("<br>",System.lineSeparator());
		// nDto.setnContent(nContent);

		return nDto;
	}

	@Override
	public void delete(int nno) {
		// TODO Auto-generated method stub
		nDao.delete(nno);
	}

	@Override
	public NoticeDTO updateUI(int nno) {
		// TODO Auto-generated method stub
		return nDao.updateUI(nno);
	}

	@Override
	public void update(NoticeDTO nDto) {
		// TODO Auto-generated method stub
		nDao.update(nDto);

	}

	@Override
	public NoticeDTO read(int nno, String ip) {
		String readIp = readCntDao.read(ip, nno);

		if (readIp == null) {
			readCntDao.insert(ip, nno);
			nDao.increaseReadCnt(nno);
		}
		NoticeDTO nDto = nDao.read(nno);

		return nDto;
	}

	@Override
	public PageTO<NoticeDTO> list(Integer curpage) {
		PageTO<NoticeDTO> pt = new PageTO<NoticeDTO>(curpage);

		Integer amount = nDao.getAmountNotice();
		pt.setAmount(amount);

		List<NoticeDTO> list = nDao.list(pt);
		pt.setList(list);

		return pt;
	}

	@Override
	public PageTO<NoticeDTO> search(Integer curpage, String criteria, String keyword) {
		// TODO Auto-generated method stub
		PageTO<NoticeDTO> pt = new PageTO<NoticeDTO>(curpage);

		Integer amount = nDao.getAmountSearch(criteria, keyword);
		if (amount == null) {
			amount = 0;
		}

		pt.setAmount(amount);

		List<NoticeDTO> list = nDao.search(pt, criteria, keyword);
		pt.setList(list);

		return pt;
	}

	@Transactional
	@Override
	public void update(NoticeDTO nDto, String[] arr, List<String> fileList) {
		// TODO Auto-generated method stub
		update(nDto, arr);

		for (int i = 0; i < fileList.size(); i++) {
			String filename = fileList.get(i);
			uDao.insert(filename, nDto.getNno());
		}

	}

	@Transactional
	private void update(NoticeDTO nDto, String[] arr) {
		// TODO Auto-generated method stub
		update(nDto);

		for (int i = 0; i < arr.length; i++) {
			String filename = arr[i];
			uDao.deleteUpload(filename);
		}
	}
}
