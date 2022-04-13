package com.laptrinhoop.controller.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.laptrinhoop.service.IHttpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.laptrinhoop.entity.Apply;
import com.laptrinhoop.service.IOrderSevice;
import com.laptrinhoop.service.impl.CartService;

@Controller
public class OrderController {

	@Autowired
	private CartService cartService;

	@Autowired
	private IOrderSevice orderService;

//	@Autowired
//	private IRabbitmqService rabbit;

	@GetMapping("/order/checkout")
	public String checkOut(Model model,RedirectAttributes attributes) {
		if (cartService.getCountCart() == 0) {
			attributes.addFlashAttribute("message","Chưa có sản phẩm trong giỏ hàng");
			return "redirect:/cart/view";
		}
		model.addAttribute("cart", cartService);
		Apply order = orderService.createOrder();
		model.addAttribute("order", order);
		return "order/checkout";
	}
	@Autowired
	private IHttpService http;

	@PostMapping("/order/checkout")
	public String checkOut(Model model, RedirectAttributes params, @Validated @ModelAttribute("order") Apply or, @RequestParam("image_file") MultipartFile file) {
		File image = http.saveFileCV(file);
		if (image != null) {
			or.setAttach(image.getName());
		}else{
			params.addFlashAttribute("message","Vui lòng đính kèm cv");
			return "redirect:/order/checkout";
		}
		or.setName(or.getCustomer().getFullname());
		 orderService.addOrderAndOrderDetail(or, cartService);
	//	rabbit.converToSendRabbit(or, cartService);
		cartService.clear();
		return "redirect:/home/index";
	}

	@RequestMapping("/order/list")
	public String listOrder(Model model) {
		List<Apply> list = orderService.getAllOrderByUser();
		model.addAttribute("orders", list);
		model.addAttribute("ordersWaiting", list.stream().filter(item -> item.getStatus() == 1).collect(Collectors.toList()).size() > 0 ?list.stream().filter(item -> item.getStatus() == 1).collect(Collectors.toList()) : new ArrayList<>());
		model.addAttribute("ordersDelivery",
				list.stream().filter(item -> item.getStatus() == 2).collect(Collectors.toList()).size() > 0 ?list.stream().filter(item -> item.getStatus() == 2).collect(Collectors.toList()): new ArrayList<>());
		model.addAttribute("ordersCancel", list.stream().filter(item -> item.getStatus() == 4).collect(Collectors.toList()).size() > 0 ?list.stream().filter(item -> item.getStatus() == 4).collect(Collectors.toList()): new ArrayList<>());
		return "order/list";
	}

	@RequestMapping("/order/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Apply order = orderService.findById(id);
		model.addAttribute("order", order);
		return "order/detail";
	}

	@RequestMapping("/order/items")
	public String getPurchasedItems(Model model) {
		model.addAttribute("list", orderService.getPurchasedItems().values());
		return "product/list";
	}
}
