package charity.com.service.photos;

import charity.com.service.visitorcounter.VisitorCounter;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Notebook on 28-Jul-17.
 */
@Service
public class PhotosBLO implements Serializable {
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

    public List getNewestPhotos(int rows) {
        EntityManager em = emf.createEntityManager();
        String jpql = "select top " + rows + " Image from Photos t where t.Status = 1 order by t.CreatedDate desc";
        Query query = em.createNativeQuery(jpql);
        return query.getResultList();
    }

}
