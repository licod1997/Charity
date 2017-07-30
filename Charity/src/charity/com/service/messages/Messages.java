package charity.com.service.messages;

import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Notebook on 27-Jul-17.
 */
@Entity
@Table(name = "Messages", schema = "dbo", catalog = "Charity")
@Service
public class Messages implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private int id;
    @Column(name = "VisitorName", nullable = false, length = 256)
    private String visitorName;
    @Column(name = "Email", nullable = false, length = 256)
    private String email;
    @Column(name = "Content", nullable = false, length = 2147483647)
    private String content;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CreatedDate", nullable = true)
    private Date createdDate;

    public Messages(String visitorName, String email, String content, Date createdDate) {
        this.visitorName = visitorName;
        this.email = email;
        this.content = content;
        this.createdDate = createdDate;
    }

    public Messages() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVisitorName() {
        return visitorName;
    }

    public void setVisitorName(String visitorName) {
        this.visitorName = visitorName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Messages messages = (Messages) o;

        if (id != messages.id) return false;
        if (visitorName != null ? !visitorName.equals(messages.visitorName) : messages.visitorName != null)
            return false;
        if (email != null ? !email.equals(messages.email) : messages.email != null) return false;
        if (content != null ? !content.equals(messages.content) : messages.content != null) return false;
        return createdDate != null ? createdDate.equals(messages.createdDate) : messages.createdDate == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (visitorName != null ? visitorName.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        return result;
    }
}
