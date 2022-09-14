package kr.co.dw.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dw.domain.AdminDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QnaDTO;
import kr.co.dw.domain.UserDTO;
import kr.co.dw.service.QnAService;
import kr.co.dw.service.QnAUploadService;
import kr.co.dw.utils.UploadUtils;

@Controller
@RequestMapping("/qna")
public class QnAController {

	@Autowired
	private QnAService qService;

	@Autowired
	private QnAUploadService quService;

	private final String UPLOADPATH = "C:" + File.separator + "coffeeupload";

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(Integer curpage, String criteria, String keyword, Model model) {
		if (curpage == null) {
			curpage = 1;
		}

		PageTO<QnaDTO> pt = qService.search(curpage, criteria, keyword);
		model.addAttribute("list", pt.getList());
		model.addAttribute("pt", pt);
		model.addAttribute("criteria", criteria);
		model.addAttribute("keyword", keyword);
	}

	@RequestMapping(value = "/{qno}/uploadall", method = RequestMethod.GET)
	public ResponseEntity<List<String>> getAllUpload(@PathVariable("qno") int qno) {
		ResponseEntity<List<String>> entity = null;

		try {
			List<String> list = quService.getAllUpload(qno);
			entity = new ResponseEntity<List<String>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/delete/{qno}", method = RequestMethod.POST)
	public String delete(@PathVariable("qno") int qno) {

		List<String> list = quService.getAllUpload(qno);
		System.out.println(list);

		qService.delete(qno);

		for (int i = 0; i < list.size(); i++) {
			String filename = list.get(i);
			UploadUtils.deleteFile(UPLOADPATH, filename);
		}

		return "redirect:/qna/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> update(MultipartHttpServletRequest request) {
		ResponseEntity<String> entity = null;

		try {
			String sQno = request.getParameter("qno");
			int qno = Integer.parseInt(sQno);

			String qTitle = request.getParameter("qTitle");

			String userid = request.getParameter("userid");

			String qContent = request.getParameter("qContent");

			String deleteFilenames = request.getParameter("deleteFilenameArr");
			String[] arr = deleteFilenames.split(",");
			Map<String, MultipartFile> map = request.getFileMap();
			List<String> fileList = new ArrayList<String>();

			Set<String> set = map.keySet();
			
			Iterator<String> it = set.iterator();
			while (it.hasNext()) {
				String key = it.next();

				MultipartFile file = map.get(key);
				String orgFilename = file.getOriginalFilename();
				try {
					String uploadedFilename = UploadUtils.uploadFile(UPLOADPATH, orgFilename, file.getBytes());
					fileList.add(uploadedFilename);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

            QnaDTO qDto = new QnaDTO(qno, userid, qTitle, qContent, null, null, 0, null);

			qService.update(qDto, arr, fileList);

			for (int i = 0; i < arr.length; i++) {
				String deletFilename = arr[i];
				UploadUtils.deleteFile(UPLOADPATH, deletFilename);
			}

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}


	@RequestMapping(value = "/update/{qno}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("qno") int qno, Model model, HttpSession session, ModelMap mm, QnaDTO qDto) {
		
		UserDTO login = (UserDTO)session.getAttribute("login");	
		AdminDTO adminLogin = (AdminDTO)session.getAttribute("adminLogin");
	

		if (adminLogin == null) {
			if (login == null) {
				return "redirect:/";
			}
		}
		
		
		qDto = qService.updateUI(qno);
		model.addAttribute("qDto", qDto);

		return "/qna/update";
	}

	@RequestMapping(value = "/read/{qno}", method = RequestMethod.GET)
	public String read(@PathVariable("qno") int qno, Model model, HttpServletRequest request) {

		String ip = request.getRemoteAddr();

		QnaDTO qDto = qService.read(qno, ip);
		model.addAttribute("qDto", qDto);
		
		return "/qna/read";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> insert(MultipartHttpServletRequest request) {

		ResponseEntity<String> entity = null;

		String qTitle = request.getParameter("qTitle");
		String userid = request.getParameter("userid");
		String qContent = request.getParameter("qContent");

		QnaDTO qDto = new QnaDTO(0, userid, qTitle, qContent, null, null, 0);

		try {

        //List<MultipartFile> list = request.getFiles("file");

			Map<String, MultipartFile> map = request.getFileMap();
			Set<String> set = map.keySet();
			Iterator<String> it = set.iterator();

			List<String> filenameList = new ArrayList<String>();

			while (it.hasNext()) {
				String key = it.next();
				MultipartFile file = map.get(key);

				String uploadedFilename = UploadUtils.uploadFile(UPLOADPATH, file.getOriginalFilename(),
						file.getBytes());

				filenameList.add(uploadedFilename);
			}

			qDto.setFilenameList(filenameList);

			qService.insert(qDto);

			entity = new ResponseEntity<String>(qDto.getQno() + "", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(-1 + "", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertUI(HttpSession session, HttpServletResponse response) throws Exception {
		
		UserDTO login = (UserDTO)session.getAttribute("login");
		
		if (login == null) {
			return "redirect:/";
		}
		
		return "/qna/insert";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Integer curpage, Model model) {
		if (curpage == null) {
			curpage = 1;
		}

		PageTO<QnaDTO> pt = qService.list(curpage);
		model.addAttribute("list", pt.getList());
		model.addAttribute("pt", pt);

		return "/qna/list";
	}

}
