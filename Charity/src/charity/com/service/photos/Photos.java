package charity.com.service.photos;

import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Service
@Table(name = "Photos", catalog = "Charity", schema = "dbo")
public class Photos implements Serializable {
    private Integer id;
    private String image;
    private Date createdDate;
    private Boolean status;

    public Photos() {
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
    @Column(name = "Image", nullable = false, length = 256)
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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
    @Column(name = "Status", nullable = true)
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

        Photos photos = (Photos) o;

        if (id != null ? !id.equals(photos.id) : photos.id != null) return false;
        if (image != null ? !image.equals(photos.image) : photos.image != null) return false;
        if (createdDate != null ? !createdDate.equals(photos.createdDate) : photos.createdDate != null) return false;
        return status != null ? status.equals(photos.status) : photos.status == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Photos{" +
                "id=" + id +
                ", image='" + image + '\'' +
                ", createdDate=" + createdDate +
                ", status=" + status +
                '}';
    }
}
