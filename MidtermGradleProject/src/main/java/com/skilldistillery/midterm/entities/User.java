package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String email;
	private String password;
	@Column(name = "create_time")
	private Date createTime;
	@Column(name = "last_login")
	private Date lastLogin;
	@Enumerated(EnumType.STRING)
	private Role role;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	@OneToMany(mappedBy = "user")
	private List<Seller> sellers;
	@OneToMany(mappedBy = "user")
	private List<Driver> drivers;
	@OneToMany(mappedBy = "user")
	private List<Buyer> buyers;
	
	
	
	
	public void addSeller(Seller seller) {
		if(sellers == null) {
			sellers = new ArrayList<>();
		}
		if(! sellers.contains(seller)) {
			sellers.add(seller);
		}
		seller.setUser(this);
	}
	
	public void removeSeller(Seller seller) {
		seller.setUser(null);
		if(sellers != null) {
			sellers.remove(seller);
		}
	}
	public void addDriver(Driver driver) {
		if(drivers == null) {
			drivers = new ArrayList<>();
		}
		if(! drivers.contains(driver)) {
			drivers.add(driver);
		}
		driver.setDriver(this);
	}
	
	public void removeDriver(Driver driver) {
		driver.setDriver(null);
		if(drivers != null) {
			drivers.remove(driver);
		}
	}
	public void addBuyer(Buyer buyer) {
		if(buyers == null) {
			buyers = new ArrayList<>();
		}
		if(! buyers.contains(buyer)) {
			buyers.add(buyer);
		}
		buyer.setUser(this);
	}
	
	public void removeBuyer(Buyer buyer) {
		buyer.setUser(null);
		if(buyers != null) {
			buyers.remove(buyer);
		}
	}
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", createTime=" + createTime + ", lastLogin=" + lastLogin + ", firstName=" + firstName + ", lastName="
				+ lastName + "]";
	}
	public User(int id, String username, String password, String email, Date createTime, Date lastLogin, Role role,
			String firstName, String lastName) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.createTime = createTime;
		this.lastLogin = lastLogin;
		this.role = role;
		this.firstName = firstName;
		this.lastName = lastName;
	}
	
	
	public User(String firstName, String lastName) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public User() {
		super();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
	

}
