package kr.co.dw.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.UserDTO;
import kr.co.dw.repository.UserDAO;
import kr.co.dw.utils.SHA256Util;

@Service
public class UserServiceImpl implements UserService {
   @Inject
   private UserDAO uDAO;

   @Override
   public void insert(UserDTO uDto) {
      // TODO Auto-generated method stub
      uDAO.insert(uDto);
   }

   @Override
   public List<UserDTO> list() {
      // TODO Auto-generated method stub
      return uDAO.list();
   }

   @Override
   public UserDTO read(String userId) {
      // TODO Auto-generated method stub
      return uDAO.read(userId);
   }

   @Override
   public UserDTO updateUI(String userId) {
      // TODO Auto-generated method stub
      return uDAO.updateUI(userId);
   }

   @Override
   public void update(UserDTO uDto) {
      // TODO Auto-generated method stub

      uDAO.update(uDto);
   }

   @Override
   public void delete(String userId) {
      // TODO Auto-generated method stub
      uDAO.delete(userId);

   }

   @Override
   public int checkId(String userId) {
      // TODO Auto-generated method stub
      return uDAO.checkId(userId);
   }

   @Override
   public int checkNk(String uNickname) {
      // TODO Auto-generated method stub
      return uDAO.checkNk(uNickname);
   }

   @Override
   public int checkEmail(String uEmail) {
      // TODO Auto-generated method stub
      return uDAO.checkEmail(uEmail);
   }

   
   
   @Override
   public int checkPhone(String uPhone) {
   	// TODO Auto-generated method stub
   	return uDAO.checkPhone(uPhone);
   }


   
   @Override
   public UserDTO login(UserDTO uDTO) {
      // TODO Auto-generated method stub
      return uDAO.login(uDTO);
   }

   @Override
   public UserDTO findid(UserDTO uDTO) {
      // TODO Auto-generated method stub

      return uDAO.findid(uDTO);
   }

   @Override
   public void findPw(HttpServletResponse response, UserDTO uDTO) throws Exception{
      // TODO Auto-generated method stub
      response.setContentType("text/html;charset=utf-8");
      UserDTO ck = uDAO.readUser(uDTO.getUserId());
      PrintWriter out = response.getWriter();
      // ????????? ???????????? ?????????
      if(checkId(uDTO.getUserId()) == 0) {
         out.print("???????????? ?????? ??????????????????.");
         out.close();
      }
      // ????????? ???????????? ?????????
      else if(checkEmail(uDTO.getuEmail()) == 0) {
         out.print("???????????? ?????? ??????????????????.");
         out.close();
		}else {
         // ?????? ???????????? ??????
         String pw = "";
		  for (int i = 0; i < 12; i++) { 
			  pw += (char) ((Math.random() * 26) + 97); 
			 
		  	}
		  
		  uDTO.setuPassword(pw);
		  
		// ???????????? ??????   
			 uDAO.updatePw(uDTO);
		  
	       // ???????????? ?????? ?????? ??????
	      sendEmail(uDTO, "findpw");
		  
	       out.print("???????????? ?????? ??????????????? ?????????????????????.");
	       
		  
		 String encryPassword = SHA256Util.encrypt(uDTO.getuPassword());
	 	uDTO.setuPassword(encryPassword); 
	 	 uDAO.updatePw(uDTO);
	 	out.close();
      }
      
   }

@Override
   public void sendEmail(UserDTO uDTO, String div) throws Exception {
      // TODO Auto-generated method stub
      String charSet = "utf-8";
      String hostSMTP = "smtp.gmail.com"; //????????? ????????? smtp.naver.com
      String hostSMTPid = "cakung9785@gmail.com";
      String hostSMTPpwd = "qiehkspfveenvokt";

      // ????????? ?????? EMail, ??????, ??????
      String fromEmail = "cakung9785@gmail.com";
      String fromName = "CoffeeMall";
      String subject = "";
      String msg = "";

      if(div.equals("findpw")) {
         subject = "????????? ?????? ???????????? ?????????.";
         msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
         msg += "<h3 style='color: blue;'>";
         msg += uDTO.getUserId() + "?????? ?????? ???????????? ?????????. ??????????????? ???????????? ???????????????.</h3>";
         msg += "<p>?????? ???????????? : ";
         msg += uDTO.getuPassword() + "</p></div>";
      }

      // ?????? ?????? E-Mail ??????
      String mail = uDTO.getuEmail();
      try {
         HtmlEmail email = new HtmlEmail();
         email.setDebug(true);
         email.setCharset(charSet);
         email.setTLS(false);
         email.setHostName(hostSMTP);
         email.setSmtpPort(587); //????????? ????????? 587

         email.setAuthentication(hostSMTPid, hostSMTPpwd);
         email.setTLS(true);
         email.addTo(mail, uDTO.getUserId());
         email.setFrom(fromEmail, fromName, charSet);
         email.setSubject(subject);
         email.setHtmlMsg(msg);
         email.send();
      } catch (Exception e) {
         System.out.println("???????????? ?????? : " + e);
      }
   }

   @Override
   public PageTO<UserDTO> list(Integer curpage) {
      // TODO Auto-generated method stub
      PageTO<UserDTO> pt = new PageTO<UserDTO>(curpage);
      
      Integer amount = uDAO.getAmountUser();
      pt.setAmount(amount);
      
      List<UserDTO> list = uDAO.list(pt);
      pt.setList(list);
      
      return pt;
   }

   @Override
   public PageTO<UserDTO> search(Integer curpage, String criteria, String keyword) {
      // TODO Auto-generated method stub
      PageTO<UserDTO> pt = new PageTO<UserDTO>(curpage);
      
      Integer amount = uDAO.getAmountSearch(criteria, keyword);
      if(amount==null) {
         amount = 0;
      }
      
      pt.setAmount(amount);
      
      List<UserDTO> list = uDAO.search(pt, criteria, keyword);
      pt.setList(list);
   
      
      return pt;
   }

   @Override
   public void modifyPw(UserDTO uDto) {
      // TODO Auto-generated method stub
      uDAO.modifyPw(uDto);
   }

@Override
public void insertNV(UserDTO uDTO) {
	// TODO Auto-generated method stub
	uDAO.insertNV(uDTO);
}

@Override
public UserDTO naverChk(UserDTO uDTO) {
	// TODO Auto-generated method stub
	return uDAO.naverChk(uDTO);
}

@Override
public UserDTO nvlogin(UserDTO uDTO) {
	// TODO Auto-generated method stub
	return uDAO.nvlogin(uDTO);
}


//?????? ???????????? ??????
  @Override
  public UserDTO getUserInfo(String userId) {
  // TODO Auto-generated method stub
  return uDAO.getUserInfo(userId);
  }


   

}