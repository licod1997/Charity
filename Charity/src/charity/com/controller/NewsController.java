package charity.com.controller;

import charity.com.service.menus.MenusBLO;
import charity.com.service.news.News;
import charity.com.service.news.NewsBLO;
import charity.com.service.pages.PagesBLO;
import charity.com.service.photos.PhotosBLO;
import charity.com.service.visitorcounter.VisitorCounterBLO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Notebook on 30-Jul-17.
 */
@Controller
@RequestMapping(value = "/news")
public class NewsController {
    @Autowired
    NewsBLO newsBLO;
    @Autowired
    MenusBLO menusBLO;
    @Autowired
    VisitorCounterBLO visitorCounterBLO;

    private static final int maxNewsPerPage = 10;

    @RequestMapping(value = "/page/{id}")
    protected ModelAndView ShowOverview(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") Integer page) {
        ModelAndView model = new ModelAndView("news");
        model.addObject("Menu", menusBLO.getMenu());
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

    @RequestMapping(value = "/detail/{id}")
    protected ModelAndView ShowNewsDetail(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") Integer id) {
        ModelAndView model = new ModelAndView("detail");
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("NewsDetail", newsBLO.getDetailNews(id));
        String tmp = newsBLO.getDetailNews(id).toString();
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
