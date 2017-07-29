package charity.com.service.news;

import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
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
        String jpql = "select * from ( select ROW_NUMBER () OVER (ORDER BY t.CreatedDate desc) AS RowNum, t.ID, t.Name, t.Entry, t.CreatedDate from News t where t.Status = 1 ) sub where RowNum >= " + (limit - maxRow + 1) + " and RowNum <= " + limit;
        Query query = em.createNativeQuery(jpql, News.class);
        return query.getResultList();
    }

    public Object getTotalNews(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Charity-PU");
        EntityManager em = emf.createEntityManager();
        String jpql = "select count(*) from News where Status = 1";
        Query query = em.createNativeQuery(jpql);
        return query.getSingleResult();
    }

    public News getDetailNews(int id) {
        EntityManager em = emf.createEntityManager();
        String jpql = "select t.ID, t.Name, t.Entry, t.CreatedDate from News t where t.Status = 1 and t.ID = " + id + " order by t.CreatedDate desc";
        Query query = em.createNativeQuery(jpql, News.class);
        return (News) query.getSingleResult();
    }
}
