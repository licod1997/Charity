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

    public List getLatestNews(int row) {
        EntityManager em = emf.createEntityManager();
        String jpql = "select top " + row + " t.ID, t.Name, t.Entry, t.CreatedDate from News t where t.Status = 1 order by t.CreatedDate desc";
        Query query = em.createNativeQuery(jpql, News.class);
        return query.getResultList();
    }

    public News getDetailNews(int id) {
        EntityManager em = emf.createEntityManager();
        String jpql = "select t.Name, t.Entry, t.CreatedDate from News t where t.Status = 1 and t.ID = " + id + " order by t.CreatedDate desc";
        Query query = em.createNativeQuery(jpql, News.class);
        return (News)query.getSingleResult();
    }
}
