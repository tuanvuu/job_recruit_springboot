package com.laptrinhoop.service.impl;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.laptrinhoop.service.IMailService;

@Service
public class MailService implements IMailService {
    @Autowired
    JavaMailSender sender;

    @Autowired
    Environment env;

    private String templateForgotPassword;
    private String templateActiveAccount = "Vui lòng click vào đường link bên dưới để kích hoạt toài khoản";
    private String templateConfirmCV;

    public MailService(Environment env) {
    }


    /**
     * JavaMailSender interface con cua MailSender , hỗ trợ tin nhắn kiểu MiME
     * Gửi email
     *
     * @param to      email người nhận
     * @param subject tiêu đề email
     * @param body    nội dung email
     * @param others  các thông số còn lại theo thứ tự sau
     *                from: email người gửi
     *                cc: chuỗi chứa danh sách email những người đồng nhận, cáchnhau dấu phẩy
     *                bcc: chuỗi chứa danh sách email những người đồng nhận bí mật, cách nhau dấu phẩy
     *                bcc: chuỗi chứa danh sách đường dẫn file đính kèm, cách  nhau dấu phẩy
     * @return true nếu gửi mail thành công, ngược lại là false
     */
    public boolean send(String to, String subject, String body, Object object, String... others) {
        try {
            MimeMessage mail = sender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(body, true);

            // Người gửi
            String from = "Kỹ thuật lập trình hướng đối tượng <tuanvuplbp@gmail.com>";
            if (others.length > 0 && others[0] != null) {
                from = String.format("%s <%s>", others[0], others[0]);
            }
            helper.setReplyTo(from);
            helper.setFrom(from);
            String template = null;
            if (object != null) {
                switch (subject) {
                    case "active":
                        template = getStringWithParamsInput(object, this.templateActiveAccount);
                        break;
                    case "foget":
                        template = getStringWithParamsInput(object, this.templateForgotPassword);
                        break;
                    case "confirm":
                        template = getStringWithParamsInput(object, this.templateConfirmCV);
                        break;
                    default:
                        template = null;
                }
                if (template != null) {
                    helper.setText(template);
                }
            }

            // Người nhận CC
            if (others.length > 1 && others[1] != null && others[1].length() > 0) {
                String[] cc = others[1].split("[,; ]+");
                helper.setCc(cc);
            }

            // Người nhận BCC
            if (others.length > 2 && others[2] != null && others[2].length() > 0) {
                String[] bcc = others[2].split("[,; ]+");
                helper.setBcc(bcc);
            }

            // File đính kèm
            if (others.length > 3 && others[3] != null && others[3].length() > 0) {
                String[] paths = others[3].split("[,; ]+");
                for (String path : paths) {
                    File file = new File(path);
                    helper.addAttachment(file.getName(), file);
                }
            }
            // Send
            sender.send(mail);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private String getStringWithParamsInput(Object object, String template) {
        Map<String, String> params = new HashMap<String, String>();
        try {
            params = (Map) object;
        } catch (Exception e) {
            e.getLocalizedMessage();
        }
        for (Map.Entry<String, String> item : params.entrySet()) {
            template.replace("%%" + item.getKey() + "%%", String.valueOf(item.getValue()));
        }

        return template;
    }

}
