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

    @RequestMapping(value = "/home", method = RequestMethod.GET)
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

    @RequestMapping(value = "/about", method = RequestMethod.GET)
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

    @RequestMapping(value = "/photo", method = RequestMethod.GET)
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

    @RequestMapping(value = "/help", method = RequestMethod.GET)
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

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
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

    private static final int maxNewsPerPage = 10;

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    protected ModelAndView ShowOverview(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, String> requestPram) {
        ModelAndView model = new ModelAndView("news");
        model.addObject("Menu", menusBLO.getMenu());
        int page = 1;
        try {
            page = Integer.parseInt(requestPram.get("page"));
        } catch (Exception e) {
        }
        Double totalPages = Math.ceil(Double.parseDouble(String.valueOf(newsBLO.getTotalNews())) / (1.0 * maxNewsPerPage));
        int parsedTotalPages = totalPages.intValue();
        if (page < 1) {
            page = 1;
        }
        if (page > parsedTotalPages) {
            page = parsedTotalPages;
        }
        model.addObject("News", newsBLO.getLatestNews(page, maxNewsPerPage));
        model.addObject("CurrentPage", page);
        model.addObject("TotalPages", parsedTotalPages);
        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(20 * 60);
            visitorCounterBLO.update();
        }
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @RequestMapping(value = "/news/detail", method = RequestMethod.GET)
    protected ModelAndView ShowNewsDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, String> requestPram){
        ModelAndView model = new ModelAndView("detail");
        model.addObject("Menu", menusBLO.getMenu());

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
