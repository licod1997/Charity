package charity.com.service.visitorcounter;

import org.springframework.stereotype.Service;

import javax.persistence.*;

/**
 * Created by Notebook on 27-Jul-17.
 */
@Entity
@Table(name = "VisitorCounter", schema = "dbo", catalog = "Charity")
@Service
public class VisitorCounter {
    private int id;
    private int counter;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Counter", nullable = false)
    public int getCounter() {
        return counter;
    }

    public void setCounter(int counter) {
        this.counter = counter;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VisitorCounter that = (VisitorCounter) o;

        if (id != that.id) return false;
        if (counter != that.counter) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + counter;
        return result;
    }
}
