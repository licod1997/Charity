package charity.com.controller;

import charity.com.service.menus.MenusBLO;
import charity.com.service.news.NewsBLO;
import charity.com.service.visitorcounter.VisitorCounterBLO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

    private void viewCount(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(20 * 60);
            visitorCounterBLO.update();
        }
    }

    private static final int maxNewsPerPage = 10;

    @GetMapping(value = "")
    protected ModelAndView doGet_page(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "page", defaultValue = "1") Integer page) {
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
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }

    @GetMapping(value = "/{id}")
    protected ModelAndView ShowNewsDetail(HttpServletRequest request, ModelAndView model, @PathVariable("id") Integer id) {
        model.setViewName("detail");
        viewCount(request);
        model.addObject("Menu", menusBLO.getMenu());
        model.addObject("NewsDetail", newsBLO.getDetailNews(id));
        model.addObject("Counter", visitorCounterBLO.getCounter());
        return model;
    }
}
