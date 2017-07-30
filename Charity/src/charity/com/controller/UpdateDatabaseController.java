package charity.com.controller;

import charity.com.service.messages.Messages;
import charity.com.service.messages.MessagesBLO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Map;

/**
 * Created by Notebook on 28-Jul-17.
 */
@Controller
public class UpdateDatabaseController {
    @Autowired
    MessagesBLO messagesBLO;

    @RequestMapping(value = "/message")
    protected ModelAndView InsertMessage(@RequestParam Map<String, String> requestParams) {
        ModelAndView model = new ModelAndView("forward:/help");
        String name = requestParams.get("author[name]");
        String mail = requestParams.get("author[email]");
        String text = requestParams.get("text");
        if (name != null && mail != null && text != null
                && name.length() <= 256 && mail.length() <= 256 && text.length() <= 4000
                && name.length() >= 1 && mail.length() >= 1 && text.length() >= 1
                && mail.matches("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")) {
            messagesBLO.persist(new Messages(name, mail, text, new Date()));
            model.addObject("Success", "Your message has been sent!");
        } else {
            model.addObject("Error", "Your message cannot be sent!");
        }
        return model;
    }
}
