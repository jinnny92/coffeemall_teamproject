package kr.co.dw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QnaDTO;
import kr.co.dw.repository.QnADAO;
import kr.co.dw.repository.QnAReadCntDAO;
import kr.co.dw.repository.QnAReplyDAO;
import kr.co.dw.repository.QnaUploadDAO;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO qDao;

	@Autowired
	private QnAReplyDAO qrDao;

	@Autowired
	private QnaUploadDAO quDao;

	@Autowired
	private QnAReadCntDAO qreadCntDao;

	
	@Override
	public PageTO<QnaDTO> list(Integer curpage) {
		PageTO<QnaDTO> pt = new PageTO<QnaDTO>(curpage);

		Integer amount = qDao.getAmountQna();
		pt.setAmount(amount);

		List<QnaDTO> list = qDao.list(pt);
		pt.setList(list);

		return pt;
	}

	@Override
	public List<QnaDTO> list() {
		return qDao.list();
	}

	@Transactional
	@Override
	public void insert(QnaDTO qDto) {
		qDao.insert(qDto);

		int qno = qDto.getQno();
		List<String> list = qDto.getFilenameList();

		for (int i = 0; i < list.size(); i++) {
			String filename = list.get(i);
			quDao.insert(filename, qno);
		}
	}

	@Override
	public QnaDTO read(int qno) {

		qDao.increaseReadCnt(qno);
		QnaDTO qDto = qDao.read(qno);
		return qDto;
	}

	@Override
	public QnaDTO updateUI(int qno) {

		return qDao.updateUI(qno);
	}

	@Override
	public void update(QnaDTO qDto) {
		// TODO Auto-generated method stub
		qDao.update(qDto);
	}

	@Transactional
	@Override
	public void delete(int qno) {
		// TODO Auto-generated method stub
		qrDao.deleteByQno(qno);
		qDao.delete(qno);
	}

	@Transactional
	private void update(QnaDTO qDto, String[] arr) {
		// TODO Auto-generated method stub
		update(qDto);

		for (int i = 0; i < arr.length; i++) {
			String filename = arr[i];
			quDao.deleteUpload(filename);
		}
	}

	@Transactional
	@Override
	public void update(QnaDTO qDto, String[] arr, List<String> fileList) {
		update(qDto, arr);

		for (int i = 0; i < fileList.size(); i++) {
			String filename = fileList.get(i);
			quDao.insert(filename, qDto.getQno());
		}

	}
    
	@Transactional
	@Override
	public QnaDTO read(int qno, String ip) {
		String readIp = qreadCntDao.read(ip, qno);

		if (readIp == null) {
			qreadCntDao.insert(ip, qno);
			qDao.increaseReadCnt(qno);
		}

		QnaDTO qDto = qDao.read(qno);

		return qDto;
	}

	@Override
	public PageTO<QnaDTO> search(Integer curpage, String criteria, String keyword) {
		PageTO<QnaDTO> pt = new PageTO<QnaDTO>(curpage);

		Integer amount = qDao.getAmountSearch(criteria, keyword);
		if (amount == null) {
			amount = 0;
		}

		pt.setAmount(amount);

		List<QnaDTO> list = qDao.search(pt, criteria, keyword);
		pt.setList(list);

		return pt;
	}

}
