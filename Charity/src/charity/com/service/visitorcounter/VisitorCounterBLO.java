package charity.com.service.visitorcounter;

import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Notebook on 28-Jul-17.
 */
@Service
public class VisitorCounterBLO implements Serializable{
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

    public void update() {
        EntityManager em = emf.createEntityManager();
        try {
            VisitorCounter counter = em.find(VisitorCounter.class, 1);
            counter.setCounter(counter.getCounter() + 1);
            em.getTransaction().begin();
            em.merge(counter);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public int getCounter() throws NoResultException {
        EntityManager em = emf.createEntityManager();
        String jpql = "select Counter from VisitorCounter where ID = 1";
        Query query = em.createNativeQuery(jpql);
        return (int) query.getSingleResult();
    }
}
