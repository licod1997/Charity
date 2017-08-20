package charity.com.service.visitorcounter;

import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Service
@Table(name = "VisitorCounter", catalog = "Charity", schema = "dbo")
public class VisitorCounter implements Serializable {
    private Integer id;
    private Integer counter;

    public VisitorCounter() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Counter", nullable = false)
    public Integer getCounter() {
        return counter;
    }

    public void setCounter(Integer counter) {
        this.counter = counter;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VisitorCounter that = (VisitorCounter) o;

        return id != null ? id.equals(that.id) : that.id == null;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "VisitorCounter{" +
                "id=" + id +
                ", counter=" + counter +
                '}';
    }
}
