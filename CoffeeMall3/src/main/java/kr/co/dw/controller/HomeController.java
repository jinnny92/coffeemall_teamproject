package kr.co.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dw.utils.UploadUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private final String UPLOADPATH = "C:" + File.separator + "coffeeupload";
	
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {

		return "home";
	}
	


	@RequestMapping(value = "/makefolder", method = RequestMethod.GET)
	public String makeFolder(Model model) {

		String uploadpath = "C:" + File.separator + "coffeupload";

		UploadUtils.makeFolder(uploadpath);

		return "redirect:/";
	}

	@RequestMapping(value = "/displayfile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String filename) {
		ResponseEntity<byte[]> entity = null;

		InputStream in = null;
		
		

		try {
			in = new FileInputStream(new File(UPLOADPATH, filename));
			MediaType mType = UploadUtils.getMediaType(filename);

			HttpHeaders headers = new HttpHeaders();

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

				int idx = filename.indexOf("_") + 1;

				String oriName = filename.substring(idx);

				oriName = new String(oriName.getBytes("UTF-8"), "ISO-8859-1");

				headers.add("Content-Disposition", "attachmentfilename=\"" + oriName + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return entity;
	}
}
