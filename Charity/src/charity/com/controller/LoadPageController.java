package charity.com.controller;

import charity.com.service.menus.MenusBLO;
import charity.com.service.news.NewsBLO;
import charity.com.service.pages.PagesBLO;
import charity.com.service.photos.PhotosBLO;
import charity.com.service.visitorcounter.VisitorCounterBLO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    private void defaultPageContent(ModelAndView model, String name){
        model.addObject("Menu", menusBLO.getMenu());    //load menu bar
        model.addObject(name, pageBLO.getContent(name));  //load page content
        model.addObject("Counter", visitorCounterBLO.getCounter()); //load visitor counter
    }

    @GetMapping(value = "/home")
    protected ModelAndView doGet_home(HttpServletRequest request, ModelAndView model) {
        model.setViewName("home");
        viewCount(request);
        defaultPageContent(model, "Home");
        model.addObject("News", newsBLO.getLatestNews(1, 2));   //load 2 latest news
        return model;
    }

    @GetMapping(value = "/about")
    protected ModelAndView doGet_about(HttpServletRequest request, ModelAndView model) {
        model.setViewName("about");
        viewCount(request);
        defaultPageContent(model,"About");
        return model;
    }

    @GetMapping(value = "/photo")
    protected ModelAndView doGet_photo(HttpServletRequest request, ModelAndView model) {
        model.setViewName("photo");
        viewCount(request);
        model.addObject("Menu", menusBLO.getMenu());    //load menu bar
        model.addObject("Photo", photosBLO.getNewestPhotos(9));  //load content
        model.addObject("Counter", visitorCounterBLO.getCounter()); //load visitor counter
        return model;
    }

    @GetMapping(value = "/help")
    protected ModelAndView doGet_help(HttpServletRequest request, ModelAndView model) {
        model.setViewName("help");
        viewCount(request);
        defaultPageContent(model, "Help");
        return model;
    }

    @GetMapping(value = "/contact")
    protected ModelAndView doGet_contact(HttpServletRequest request, ModelAndView model) {
        model.setViewName("contact");
        viewCount(request);
        defaultPageContent(model, "Contact");
        return model;
    }


}
