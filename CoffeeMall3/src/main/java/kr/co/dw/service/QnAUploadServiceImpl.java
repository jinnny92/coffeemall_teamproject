package kr.co.dw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.QnaDTO;
import kr.co.dw.repository.QnaUploadDAO;

@Service
@Transactional
public class QnAUploadServiceImpl implements QnAUploadService {

	@Autowired
	private QnaUploadDAO quDao;
	
	@Override
	public List<String> getAllUpload(int qno) {
		return quDao.getAllUpload(qno);
	}

	@Override
	public void insert(QnaDTO qDto) {
		List<String> list = qDto.getFilenameList();
		
		for(int i=0; i<list.size(); i++) {
			String filename = list.get(i);
			quDao.insert(filename, qDto.getQno());
		}
		
	}


}
