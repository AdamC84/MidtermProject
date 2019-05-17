package com.skilldistillery.midterm.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class DeliveryDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "date_time_delivered")
	private Date dateTimeDelivered;
	@Column(name = "date_time_pickedup")
	private Date dateTimePickedup;
	@Column(name = "date_time_begin")
	private Date dateTimeSchedBegin;
	@Column(name = "date_time_end")
	private Date dateTimeSchedEnd;
	@ManyToOne
	@JoinColumn(name = "driver_id")
	private Driver driver;
	
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDateTimeDelivered() {
		return dateTimeDelivered;
	}
	public void setDateTimeDelivered(Date dateTimeDelivered) {
		this.dateTimeDelivered = dateTimeDelivered;
	}
	public Date getDateTimePickedup() {
		return dateTimePickedup;
	}
	public void setDateTimePickedup(Date dateTimePickedup) {
		this.dateTimePickedup = dateTimePickedup;
	}
	public Date getDateTimeSchedBegin() {
		return dateTimeSchedBegin;
	}
	public void setDateTimeSchedBegin(Date dateTimeSchedBegin) {
		this.dateTimeSchedBegin = dateTimeSchedBegin;
	}
	public Date getDateTimeSchedEnd() {
		return dateTimeSchedEnd;
	}
	public void setDateTimeSchedEnd(Date dateTimeSchedEnd) {
		this.dateTimeSchedEnd = dateTimeSchedEnd;
	}
	public Driver getDriver() {
		return driver;
	}
	public void setDriver(Driver driver) {
		this.driver = driver;
	}
	public DeliveryDetails(int id, Date dateTimeDelivered, Date dateTimePickedup, Date dateTimeSchedBegin,
			Date dateTimeSchedEnd, Driver driver) {
		super();
		this.id = id;
		this.dateTimeDelivered = dateTimeDelivered;
		this.dateTimePickedup = dateTimePickedup;
		this.dateTimeSchedBegin = dateTimeSchedBegin;
		this.dateTimeSchedEnd = dateTimeSchedEnd;
		this.driver = driver;
	}
	public DeliveryDetails() {
		super();
	}
	@Override
	public String toString() {
		return "DeliveryDetails [id=" + id + ", dateTimeDelivered=" + dateTimeDelivered + ", dateTimePickedup="
				+ dateTimePickedup + ", dateTimeSchedBegin=" + dateTimeSchedBegin + ", dateTimeSchedEnd="
				+ dateTimeSchedEnd + ", driver=" + driver + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dateTimeDelivered == null) ? 0 : dateTimeDelivered.hashCode());
		result = prime * result + ((dateTimePickedup == null) ? 0 : dateTimePickedup.hashCode());
		result = prime * result + ((dateTimeSchedBegin == null) ? 0 : dateTimeSchedBegin.hashCode());
		result = prime * result + ((dateTimeSchedEnd == null) ? 0 : dateTimeSchedEnd.hashCode());
		result = prime * result + ((driver == null) ? 0 : driver.hashCode());
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
		DeliveryDetails other = (DeliveryDetails) obj;
		if (dateTimeDelivered == null) {
			if (other.dateTimeDelivered != null)
				return false;
		} else if (!dateTimeDelivered.equals(other.dateTimeDelivered))
			return false;
		if (dateTimePickedup == null) {
			if (other.dateTimePickedup != null)
				return false;
		} else if (!dateTimePickedup.equals(other.dateTimePickedup))
			return false;
		if (dateTimeSchedBegin == null) {
			if (other.dateTimeSchedBegin != null)
				return false;
		} else if (!dateTimeSchedBegin.equals(other.dateTimeSchedBegin))
			return false;
		if (dateTimeSchedEnd == null) {
			if (other.dateTimeSchedEnd != null)
				return false;
		} else if (!dateTimeSchedEnd.equals(other.dateTimeSchedEnd))
			return false;
		if (driver == null) {
			if (other.driver != null)
				return false;
		} else if (!driver.equals(other.driver))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	
	
}
