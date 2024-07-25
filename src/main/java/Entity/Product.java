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
	
	
	@Table(name = "Products")
	@Entity
	public class Product {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int id;
		@Column(name = "name")
		private String name;
		@Column(name = "description")
		private String description;
		@Column(name = "price")
		private float price;
		@Column(name = "quantity")
		private int quantity;
		@Column(name = "discount")
		private float discount;
		@Column(name = "tag")
		private String tag;
		@Column(name = "color")
		private String color;
		@Column(name = "size")
		private String size;
	
		@Temporal(TemporalType.DATE)
		@Column(name = "created_at", nullable = false, columnDefinition = "DATE DEFAULT CURRENT_TIMESTAMP")
		private Date created_at = new Date();
	
		@Temporal(TemporalType.DATE)
		@Column(name = "updated_at", nullable = false, columnDefinition = "DATE DEFAULT CURRENT_TIMESTAMP")
		private Date updated_at = new Date();
	
		@Column(name = "isActive")
		private boolean isActive = true;
	
		@ManyToOne
		@JoinColumn(name = "product_category_id")
		private Category category;
	
		@ManyToOne
		private Brand brand;
	
		@OneToMany(mappedBy = "product")
		private List<ProductComment> productComments;
	
		@OneToMany(mappedBy = "product")
		private List<OrderDetail> orderDetails;
	
		@OneToMany(mappedBy = "product")
		private List<ProductImage> productImages;
	
		public int getId() {
			return id;
		}
	
		public Product(int id, String name, String description, float price, int quantity, float discount, String tag,
				String color, String size, Date created_at, Date updated_at, boolean isActive, Category category, Brand brand,
				List<ProductComment> productComments, List<OrderDetail> orderDetails, List<ProductImage> productImages) {
			super();
			this.id = id;
			this.name = name;
			this.description = description;
			this.price = price;
			this.quantity = quantity;
			this.discount = discount;
			this.tag = tag;
			this.color = color;
			this.size = size;
			this.created_at = created_at;
			this.updated_at = updated_at;
			this.isActive = isActive;
			this.category = category;
			this.brand = brand;
			this.productComments = productComments;
			this.orderDetails = orderDetails;
			this.productImages = productImages;
		}
	
		
	
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public float getPrice() {
			return price;
		}

		public void setPrice(float price) {
			this.price = price;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		public float getDiscount() {
			return discount;
		}

		public void setDiscount(float discount) {
			this.discount = discount;
		}

		public String getTag() {
			return tag;
		}

		public void setTag(String tag) {
			this.tag = tag;
		}

		public String getColor() {
			return color;
		}

		public void setColor(String color) {
			this.color = color;
		}

		public String getSize() {
			return size;
		}

		public void setSize(String size) {
			this.size = size;
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

		public boolean isActive() {
			return isActive;
		}

		public void setActive(boolean isActive) {
			this.isActive = isActive;
		}

		public Category getCategory() {
			return category;
		}

		public void setCategory(Category category) {
			this.category = category;
		}

		public Brand getBrand() {
			return brand;
		}

		public void setBrand(Brand brand) {
			this.brand = brand;
		}

		public List<ProductComment> getProductComments() {
			return productComments;
		}

		public void setProductComments(List<ProductComment> productComments) {
			this.productComments = productComments;
		}

		public List<OrderDetail> getOrderDetails() {
			return orderDetails;
		}

		public void setOrderDetails(List<OrderDetail> orderDetails) {
			this.orderDetails = orderDetails;
		}

		public List<ProductImage> getProductImages() {
			return productImages;
		}

		public void setProductImages(List<ProductImage> productImages) {
			this.productImages = productImages;
		}

		public void setId(int id) {
			this.id = id;
		}

		public Product() {
			super();
		}
	
		
	
	}
