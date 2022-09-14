package kr.co.dw.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.dw.domain.QnAReplyDTO;
import kr.co.dw.service.QnAReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Autowired
	private QnAReplyService qrService;
	
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entitiy = null;
		
		
		try {
			qrService.update(map);
			entitiy = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entitiy = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entitiy;
	}
	
	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity = null;
		
		
		try {
			qrService.delete(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{qno}/all", method = RequestMethod.GET)
	public List<QnAReplyDTO> list(@PathVariable("qno") int qno){
		List<QnAReplyDTO> list = qrService.list(qno);
		
		return list;
	}
	
	@RequestMapping(value = "/{qno}/{curpage}", method = RequestMethod.GET)
	public List<QnAReplyDTO> list(@PathVariable("qno") int qno, @PathVariable("curpage") int curPage){
		List<QnAReplyDTO> list = qrService.list(qno, curPage);
		
		
		
		System.out.println(list);
		
		return list;
	}
	
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity = null;
		
		try {
			qrService.insert(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		
		
		return entity;
	}

}
