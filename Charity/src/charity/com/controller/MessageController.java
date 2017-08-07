package charity.com.controller;

import charity.com.service.messages.Messages;
import charity.com.service.messages.MessagesBLO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * Created by Notebook on 28-Jul-17.
 */
@Controller
public class MessageController {
    @Autowired
    private MessagesBLO messagesBLO;

    @PostMapping(value = "/message")
    protected ModelAndView doPost_message(@RequestParam(value = "author[name]", defaultValue = "") String name,
                                          @RequestParam(value = "author[email]", defaultValue = "") String mail,
                                          @RequestParam(value = "text", defaultValue = "") String text,
                                          ModelAndView model) {
        model.setViewName("forward:/help");
        name = name.trim();
        mail = mail.trim();
        text = text.trim();
        if (name.length() <= 256 && mail.length() <= 256 && text.length() <= 4000
                && !name.isEmpty() && !mail.isEmpty() && !text.isEmpty()
                && mail.matches("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")) {
            messagesBLO.persist(new Messages(name, mail, text, new Date()));    //insert new message into database
        }
        return model;
    }
}
