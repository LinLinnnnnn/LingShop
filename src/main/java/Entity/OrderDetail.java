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
import javax.persistence.UniqueConstraint;
@Table(name = "OrderDetail",uniqueConstraints = {
		@UniqueConstraint(columnNames = {"order_id", "product_id"})
})
@Entity
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int quantity;	
	@Temporal(TemporalType.DATE)
	@Column(name = "created_at", nullable = false, columnDefinition = "DATE DEFAULT CURRENT_TIMESTAMP")
	private Date created_at  = new Date();
	
	@ManyToOne @JoinColumn(name = "order_id")
	private Order order;
	
	@ManyToOne @JoinColumn(name = "product_id")
	private Product product;
	
	public OrderDetail(int id, int quantity, Date created_at, Order order, Product product) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.created_at = created_at;
		this.order = order;
		this.product = product;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public OrderDetail() {
		super();
	}
}
