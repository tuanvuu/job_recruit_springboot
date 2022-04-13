package com.laptrinhoop.controller.admin;

import com.laptrinhoop.entity.Apply;
import com.laptrinhoop.service.IOrderSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.*;
import java.io.File;

@Controller
public class CVController {
    @Autowired
    private IOrderSevice orderSevice;
    @RequestMapping("cv/view")
    public String cvReview(Model model,@RequestParam("cv") Integer orderId) {
        Apply order = orderSevice.findById(orderId);
        String path = "";
        try {
            path+= order.getAttach();
            File pdfFile = new File(path);

            if (pdfFile.exists()) {
                if (Desktop.isDesktopSupported()) {
                    Desktop.getDesktop().open(pdfFile);
                } else {
                    System.out.println("Awt Desktop is not supported!");
                }

            } else {
                System.out.println("File is not exists!");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/admin/order/index";
    }
}
