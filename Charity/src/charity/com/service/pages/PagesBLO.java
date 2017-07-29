package charity.com.service.pages;

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
public class PagesBLO implements Serializable {
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

    public List getContent(String name) {
        EntityManager em = emf.createEntityManager();
        String jpql = "select Content from Pages t where t.Name = '" + name + "' and t.Status = 1 order by t.DisplayOrder asc";
        Query query = em.createNativeQuery(jpql);
        return query.getResultList();
    }
}
