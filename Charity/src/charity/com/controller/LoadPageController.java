package charity.com.controller;

import charity.com.service.menus.MenusBLO;
import charity.com.service.news.News;
import charity.com.service.news.NewsBLO;
import charity.com.service.pages.PagesBLO;
import charity.com.service.photos.PhotosBLO;
import charity.com.service.visitorcounter.VisitorCounterBLO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Notebook on 27-Jul-17.
 */
@Controller
public class LoadPageController {
    @Autowired
    PagesBLO pageBLO;
    @Autowired
    NewsBLO newsBLO;
    @Autowired
    MenusBLO menusBLO;
    @Autowired
    VisitorCounterBLO visitorCounterBLO;
    @Autowired
    PhotosBLO photosBLO;

    @RequestMapping(value = "/home")
    protected ModelAndView ShowHome(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView model = new ModelAndView("/home");
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("Home", pageBLO.getContent("Home"));
        model.addObject("News", newsBLO.getLatestNews(1, 2));
        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(20 * 60);
            visitorCounterBLO.update();
        }
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @RequestMapping(value = "/about")
    protected ModelAndView ShowAbout(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView model = new ModelAndView("/about");
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("About", pageBLO.getContent("About"));
        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(20 * 60);
            visitorCounterBLO.update();
        }
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @RequestMapping(value = "/photo")
    protected ModelAndView ShowPhoto(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView model = new ModelAndView("/photo");
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("Photo", photosBLO.getNewestPhotos());
        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(20 * 60);
            visitorCounterBLO.update();
        }
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @RequestMapping(value = "/help")
    protected ModelAndView ShowHelp(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView model = new ModelAndView("/help");
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("Help", pageBLO.getContent("Help"));
        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(20 * 60);
            visitorCounterBLO.update();
        }
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @RequestMapping(value = "/contact")
    protected ModelAndView ShowContact(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView model = new ModelAndView("/contact");
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("Contact", pageBLO.getContent("Contact"));
        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(20 * 60);
            visitorCounterBLO.update();
        }
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }


}
