package Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Table(name = "ProductComments")
@Entity
public class ProductComment {
	@Id 	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String content;
	private int rating;
	@Temporal(TemporalType.DATE)
	@Column(name = "created_at", nullable = false, columnDefinition = "DATE DEFAULT CURRENT_TIMESTAMP")
	private Date created_at = new Date();
	@Temporal(TemporalType.DATE)
	@Column(name = "updated_at", nullable = false, columnDefinition = "DATE DEFAULT CURRENT_TIMESTAMP")
	private Date updated_at = new Date();

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	public ProductComment(int id, String content, int rating, Date created_at, Date updated_at, User user,
			Product product) {
		super();
		this.id = id;
		this.content = content;
		this.rating = rating;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.user = user;
		this.product = product;
	}

	

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public int getRating() {
		return rating;
	}



	public void setRating(int rating) {
		this.rating = rating;
	}



	public Date getCreated_at() {
		return created_at;
	}



	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}



	public Date getUpdated_at() {
		return updated_at;
	}



	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	public ProductComment() {
		super();
	}
}
