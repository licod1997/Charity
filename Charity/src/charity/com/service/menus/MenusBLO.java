package charity.com.service.menus;

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
 * Created by Notebook on 28-Jul-17.
 */
@Service
public class MenusBLO implements Serializable {
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

    public List getMenu(){
        EntityManager em = emf.createEntityManager();
        String jpql = "select t.ID, t.Name, t.URL from Menus t where t.Status = 1 order by t.DisplayOrder asc";
        Query query = em.createNativeQuery(jpql, Menus.class);
        return query.getResultList();
    }
}
