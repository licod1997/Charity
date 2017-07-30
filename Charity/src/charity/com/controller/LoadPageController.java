package charity.com.controller;

import charity.com.service.menus.MenusBLO;
import charity.com.service.news.News;
import charity.com.service.news.NewsBLO;
import charity.com.service.pages.PagesBLO;
import charity.com.service.photos.PhotosBLO;
import charity.com.service.visitorcounter.VisitorCounterBLO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

    private void viewCount(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(20 * 60);
            visitorCounterBLO.update();
        }
    }

    @GetMapping(value = "/home")
    protected ModelAndView doGet_home(HttpServletRequest request, ModelAndView model) {
        model.setViewName("/home");
        viewCount(request);
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("Home", pageBLO.getContent("Home"));
        model.addObject("News", newsBLO.getLatestNews(1, 2));
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @RequestMapping(value = "/about")
    protected ModelAndView doGet_about(HttpServletRequest request, ModelAndView model) {
        model.setViewName("/about");
        viewCount(request);
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("About", pageBLO.getContent("About"));
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @RequestMapping(value = "/photo")
    protected ModelAndView doGet_photo(HttpServletRequest request, ModelAndView model) {
        model.setViewName("/photo");
        viewCount(request);
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("Photo", photosBLO.getNewestPhotos());
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @RequestMapping(value = "/help")
    protected ModelAndView doGet_help(HttpServletRequest request, ModelAndView model) {
        model.setViewName("/help");
        viewCount(request);
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("Help", pageBLO.getContent("Help"));
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @RequestMapping(value = "/contact")
    protected ModelAndView doGet_contact(HttpServletRequest request, ModelAndView model) {
        model.setViewName("/contact");
        viewCount(request);
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("Contact", pageBLO.getContent("Contact"));
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }


}
