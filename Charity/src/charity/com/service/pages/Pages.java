package charity.com.service.pages;

import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Notebook on 27-Jul-17.
 */
@Entity
@Table(name = "Pages", schema = "dbo", catalog = "Charity")
@Service
public class Pages implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private int id;
    @Basic(optional = false)
    @Column(name = "Name", nullable = false, length = 256)
    private String name;
    @Column(name = "Content", nullable = true, length = 2147483647)
    private String content;
    @Column(name = "DisplayOrder", nullable = true)
    private Integer displayOrder;
    @Column(name = "CreatedDate", nullable = true)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "Status", nullable = true)
    private Boolean status;

    public Pages() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(Integer displayOrder) {
        this.displayOrder = displayOrder;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Pages pages = (Pages) o;

        if (id != pages.id) return false;
        if (name != null ? !name.equals(pages.name) : pages.name != null) return false;
        if (content != null ? !content.equals(pages.content) : pages.content != null) return false;
        if (displayOrder != null ? !displayOrder.equals(pages.displayOrder) : pages.displayOrder != null) return false;
        if (createdDate != null ? !createdDate.equals(pages.createdDate) : pages.createdDate != null) return false;
        return status != null ? status.equals(pages.status) : pages.status == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (displayOrder != null ? displayOrder.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
