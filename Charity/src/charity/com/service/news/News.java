package charity.com.service.news;

import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Service
@Table(name = "News", catalog = "Charity", schema = "dbo")
public class News implements Serializable {
    private Integer id;
    private String name;
    private String entry;
    private String pageContent;
    private Date createdDate;
    private Boolean pageStatus;

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
    @Column(name = "Name", nullable = false, length = 256)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Entry", nullable = true, length = 256)
    public String getEntry() {
        return entry;
    }

    public void setEntry(String entry) {
        this.entry = entry;
    }

    @Basic
    @Column(name = "PageContent", nullable = true, length = 2147483647)
    public String getPageContent() {
        return pageContent;
    }

    public void setPageContent(String pageContent) {
        this.pageContent = pageContent;
    }

    @Basic
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CreatedDate", nullable = true)
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Basic
    @Column(name = "PageStatus", nullable = true)
    public Boolean getPageStatus() {
        return pageStatus;
    }

    public void setPageStatus(Boolean pageStatus) {
        this.pageStatus = pageStatus;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        News news = (News) o;

        return id != null ? id.equals(news.id) : news.id == null;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", entry='" + entry + '\'' +
                ", pageContent='" + pageContent + '\'' +
                ", createdDate=" + createdDate +
                ", pageStatus=" + pageStatus +
                '}';
    }
}
