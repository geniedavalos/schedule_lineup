package com.codingdojo.lineup.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="requests")
public class Request {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Size(min=2, message="Description must be at least 2 characters")
	private String description;
	
	private String type;
	
	@FutureOrPresent(message="Shhh. Don't tell anyone that you can time travel")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date start;
	@FutureOrPresent(message="Shhh. Don't tell anyone that you can time travel")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="employee_id")
	private Employee sender;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="manager_id")
	private Employee receiver;
	
	private Boolean approved = null;
	
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    public Request () {
    	
    }
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public Boolean getApproved() {
		return approved;
	}
	public void setApproved(Boolean approved) {
		this.approved = approved;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Employee getSender() {
		return sender;
	}
	public void setSender(Employee sender) {
		this.sender = sender;
	}
	public Employee getReceiver() {
		return receiver;
	}
	public void setReceiver(Employee receiver) {
		this.receiver = receiver;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
