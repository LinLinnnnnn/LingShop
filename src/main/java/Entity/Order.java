package Entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Table(name = "Orders")
@Entity
public class Order {
	@Id	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String f_name;
	private String l_name;
	private String phone;	
	private String address;
	@Temporal(TemporalType.DATE)
	@Column(name = "created_at", nullable = false, columnDefinition = "DATE DEFAULT CURRENT_TIMESTAMP")
	private Date created_at  = new Date();
	@Temporal(TemporalType.DATE)
	@Column(name = "updated_at", nullable = false, columnDefinition = "DATE DEFAULT CURRENT_TIMESTAMP")
	private Date updated_at = new Date();
	
	@ManyToOne @JoinColumn(name = "user_id")
	private User user;
	
    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetails;
    
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	public Order() {
		super();
	}
	public Order(int id, String f_name, String l_name, String phone, String address, Date created_at, Date updated_at,
			User user, List<OrderDetail> orderDetails) {
		super();
		this.id = id;
		this.f_name = f_name;
		this.l_name = l_name;
		this.phone = phone;
		this.address = address;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.user = user;
		this.orderDetails = orderDetails;
	}

	
}
