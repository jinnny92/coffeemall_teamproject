package kr.co.dw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dw.domain.Criteria;
import kr.co.dw.domain.OLPageDTO;
import kr.co.dw.domain.OrderAllDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderItemDTO;
import kr.co.dw.domain.OrderPageDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.ProductDTO;
import kr.co.dw.domain.UserDTO;
import kr.co.dw.service.OrderService;
import kr.co.dw.service.ProUploadService;
import kr.co.dw.service.ProductService;
import kr.co.dw.service.UploadService;
import kr.co.dw.service.UserService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	@Autowired
	private UserService uService;
	
	@Autowired 
	private UploadService pService;
	
	@RequestMapping(value="/stock", method = RequestMethod.GET)
	public String stock(Integer curpage,  Model model) {
		if(curpage == null) {
			curpage = 1;
			
		}

		PageTO<OrderAllDTO> pt = oService.stocklist(curpage);
		System.out.println(pt);
	    
		
		  for (int i = 0; i < pt.getList().size(); i++) { 
			  int pno =
				  pt.getList().get(i).getPno();
				 
				  List<String> filenameList = pService.list(pno);
				  pt.getList().get(i).setFilenameList(filenameList); }
		
		model.addAttribute("stocklist", pt.getList());
		model.addAttribute("pt", pt);
		
		
		
		return "/order/stock";
	}
	
	
	
	

	
	
	@RequestMapping(value = "/{userId}", method = RequestMethod.GET)
	public String orderPageGet(@PathVariable("userId") String userId, OrderPageDTO opDto, Model model, HttpSession session) {
		System.out.println("userId : "+userId);
		System.out.println("orders :"+opDto.getOrders());
		
		UserDTO login = (UserDTO)session.getAttribute("login");
		if (!login.getUserId().equals(userId)) {
			return "redirect:/";
			
		}
		
		model.addAttribute("orderList", oService.getProductInfo(opDto.getOrders()));
		model.addAttribute("userInfo", uService.getUserInfo(userId));
		System.out.println(model);
		return "/order/order";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String orderPagePost(OrderDTO oDto, HttpServletRequest request) {
			System.out.println(oDto);
			oService.order(oDto);
		//return "redirect:/";
			return "redirect:/order/myorder/" + oDto.getUserId();
			
	}
	
	
	@RequestMapping(value = "/myorder/{userId}", method = RequestMethod.GET)
	public String myOrder(@PathVariable("userId") String userId, Model model, HttpSession session) {
		
		UserDTO login = (UserDTO)session.getAttribute("login");
		if (!login.getUserId().equals(userId)) {
			return "redirect:/";
			
		}
		
		List<OrderItemDTO> molist = oService.myOrder(userId);
			model.addAttribute("molist", molist);
		return "/order/myOrder";
	}
	
}
