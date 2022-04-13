package com.laptrinhoop.controller.admin;

import com.laptrinhoop.common.HelperUtils;
import com.laptrinhoop.entity.Customer;
import com.laptrinhoop.service.IHttpService;
import com.laptrinhoop.service.IMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.laptrinhoop.entity.Apply;
import com.laptrinhoop.service.IOrderSevice;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;


@Controller
@RequestMapping("/admin/order/")
public class OrdersAdminController {
    @Autowired
    private IOrderSevice orderService;

    @Autowired
    private IHttpService service;

    @Autowired
    private IMailService mailService;

    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("order", new Apply());
        Customer customer = service.getSession("user");
        model.addAttribute("list", orderService.getAllApplysByRecruiId(customer.getId()));
        return "admin/order/index";
    }

    @RequestMapping("edit/{id}")
    public String edit(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("order", orderService.findById(id));
        Customer customer = service.getSession("user");
        model.addAttribute("list", orderService.getAllApplysByRecruiId(customer.getId()));
        return "admin/order/index";
    }

    @RequestMapping("create")
    public String create(Model model, RedirectAttributes params, @Validated Apply form,
                         BindingResult errors) {
        if (errors.hasErrors()) {
            model.addAttribute("message", "Vui lòng không bỏ trống các trường bên trên");
            model.addAttribute("list", orderService.findAll());
            return "admin/order/index";
        }
        orderService.add(form);
        params.addAttribute("message", "Thêm mới thành công");
        return "redirect:/admin/order/index"; // redirect lại để mất dữ liệu trên form
    }

    @RequestMapping("update")
    public String update(Model model, RedirectAttributes params, @Validated Apply form,
                         BindingResult errors, @RequestParam("image_file") MultipartFile file) {
        Customer customer = service.getSession("user");
        if (errors.hasErrors()) {
            model.addAttribute("message", "Vui lòng không bỏ trống bên dưới");
            model.addAttribute("list", orderService.getAllApplysByRecruiId(customer.getId()));
            return "admin/order/index";
        }
        File photo = service.saveProductPhoto(file);
        if (photo != null) {
            form.setAttach(photo.getName());
        }

        form.setOrderBy(customer.getId());
        orderService.update(form);

        params.addAttribute("message", "Cập nhật thành công");

        return "redirect:/admin/order/edit/" + form.getId(); // redirect giữ lại dữ liệu
    }

    @RequestMapping("delete/{id}")
    public String delete(Model model, RedirectAttributes params, @PathVariable("id") Integer id) {
        orderService.delete(id);
        params.addAttribute("message", "Xóa thành công");
        return "redirect:/admin/order/index";
    }


    @RequestMapping(method = RequestMethod.GET, value = "cv/view/{id}")
    public void cvReview(Model model, @PathVariable("id") Integer orderId, HttpServletResponse response) throws IOException {
		Apply order = orderService.findById(orderId);
        String fileName = order.getAttach();
		String path = HelperUtils.getCurrentDir() + "\\src\\main\\webapp\\static\\files\\cv\\";
		path += fileName;
        File pdfFile = new File(path);
        FileInputStream inputStream = new FileInputStream(pdfFile);

        response.setContentType("application/pdf");
        response.setContentLength((int) pdfFile.length());
        response.setHeader("Content-Disposition", "inline;filename=\"" + fileName + "\"");

        FileCopyUtils.copy(inputStream, response.getOutputStream());
    }
}
