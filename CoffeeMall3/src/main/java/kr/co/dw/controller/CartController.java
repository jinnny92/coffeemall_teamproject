package kr.co.dw.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dw.domain.CartDTO;
import kr.co.dw.domain.ProductDTO;
import kr.co.dw.domain.UserDTO;
import kr.co.dw.service.CartService;
import kr.co.dw.service.UserService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Inject
	private CartService cService;
	
	@Inject
	private UserService uService;
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteCart(CartDTO cDto) {
		cService.deleteCart(cDto.getCartId());
		return "redirect:/cart/" + cDto.getUserId();
				
	}
	

	
	
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateCart(CartDTO cDto) {
		cService.updateCount(cDto);
		
		return "SUCCESS";
		
	}
	
	
	
	@RequestMapping(value = "/{userId}", method = RequestMethod.GET)
	public String cartPageGet(@PathVariable("userId") String userId, Model model, HttpSession session) {
		UserDTO login = (UserDTO)session.getAttribute("login");
		if (!login.getUserId().equals(userId)) {
			return "redirect:/";
			
		}
		
		model.addAttribute("cartInfo", cService.getCartList(userId));
		
		
		return "/cart/cart";
	}
	
	
	 
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String addCart(CartDTO cDto, HttpServletRequest request) throws Throwable  {
	HttpSession session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("login");
		if (dto == null) {
			System.out.println(dto);
			return "5";
		}
		int result = cService.addCart(cDto);
		
		return result + "";
	}
}
