package charity.com.service.news;

import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Notebook on 27-Jul-17.
 */
@Service
public class NewsBLO implements Serializable {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Charity-PU");

    public void persist(Object object) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public List getLatestNews(int page, int maxRow) {
        EntityManager em = emf.createEntityManager();
        long limit = maxRow * page;
        String jpql = "select * from ( select ROW_NUMBER () OVER (ORDER BY t.CreatedDate desc) AS RowNum, t.ID, t.Name, t.PageEntry, t.CreatedDate from News t where t.PageStatus = 1 ) sub where RowNum >= " + (limit - maxRow + 1) + " and RowNum <= " + limit;
        Query query = em.createNativeQuery(jpql, News.class);
        return query.getResultList();
    }

    public Object getTotalNews() throws NoResultException {
        EntityManager em = emf.createEntityManager();
        String jpql = "select count(*) from News where PageStatus = 1";
        Query query = em.createNativeQuery(jpql);
        return query.getSingleResult();
    }

    public News getDetailNews(int id) throws NoResultException {
        EntityManager em = emf.createEntityManager();
        String jpql = "select * from News t where t.ID = " + id + " and t.PageStatus = 1";    //this return t.Content = null, need optimizing
//        String jpql = "News.findById";
        Query query = em.createNativeQuery(jpql, News.class);
//        Query query = em.createNamedQuery(jpql);
//        query.setParameter("id", id);
        News news = (News) query.getSingleResult();
        System.out.println(news);
//        jpql = "select Content from News t where t.ID = " + id + " and t.Status = 1";   //get the missing Content
//        query = em.createNativeQuery(jpql);
//        news.setContent((String) query.getSingleResult());
        return news;
    }
}
