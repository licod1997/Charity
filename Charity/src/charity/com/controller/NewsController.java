package charity.com.controller;

import charity.com.service.menus.MenusBLO;
import charity.com.service.news.News;
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

    private void viewCount(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(20 * 60);    //set session for 20 mins
            visitorCounterBLO.update(); //update visitor counter in database
        }
    }

    private static final int maxNewsPerPage = 10;

    @GetMapping(value = "")
    protected ModelAndView doGet_page(HttpServletRequest request, ModelAndView model,
                                      @RequestParam(value = "page", defaultValue = "1") String pageStr) {
        int parsedTotalPages = new Double(Math.ceil(Double.parseDouble(String.valueOf(newsBLO.getTotalNews())) / (1.0 * maxNewsPerPage))).intValue();   //parse double value to int (ceil is double). incorrect int value if double exceed int value
        int page = 1;   //page default value

        try {
            page = Integer.parseInt(pageStr);   //parse value from param if possible else the value is 1
            if (page < 1) {                     //if page is below 1
                page = 1;                       //the default value
            }
            if (page > parsedTotalPages) {      //if page is higher than the total page
                page = parsedTotalPages;        //the total number of pages
            }
        } catch (Exception e) {
        }

        model.setViewName("news");
        viewCount(request);
        model.addObject("Menu", menusBLO.getMenu());                            //load menu bar
        model.addObject("News", newsBLO.getLatestNews(page, maxNewsPerPage));   //load 10 news on the page
        model.addObject("CurrentPage", page);                                   //add the current page to be handled by javascript in jsp page
        model.addObject("TotalPages", parsedTotalPages);                        //add the total number of page to be handled by javascript in jsp page
        model.addObject("Counter", visitorCounterBLO.getCounter());             //load visitor counter
        return model;
    }

    @GetMapping(value = "/{id}")
    protected ModelAndView ShowNewsDetail(HttpServletRequest request, ModelAndView model,
                                          @PathVariable("id") String idStr) {
        News news;
        int id;

        try {
            id = Integer.parseInt(idStr);   //parse value from param if possible else the value is 0
            news = newsBLO.getDetailNews(id);
        } catch (Exception e) {
            news = new News();
            news.setName("No record was found");    //in case exception. no record was found will be displayed on jsp page
        }

        model.setViewName("detail");
        viewCount(request);
        model.addObject("Menu", menusBLO.getMenu());                //set page menu bar
        model.addObject("NewsDetail", news);                        //set page content
        model.addObject("Counter", visitorCounterBLO.getCounter()); //set page visitor counter
        return model;
    }
}
