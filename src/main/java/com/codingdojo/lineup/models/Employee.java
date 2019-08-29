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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Entity
@Table(name="employees")
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Size(min = 2, message="First name must be at least 2 characters")
	private String firstName;
	
	@Size(min =2, message="Last name must be at least 2 characters")
	private String lastName;
	
	@Email(message="Please enter a valid email")
	private String email;
	
	@Size(min = 8, message="Password must be at least 8 characters.")
	private String password;
	
	@Transient
    private String passwordConfirmation;
	
	private int accessLevel;
	
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name="employees_managers",
		joinColumns = @JoinColumn(name="employee_id"),
		inverseJoinColumns = @JoinColumn(name="manager_id")
			)
	private List<Employee> managers;

	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name="employees_managers",
		joinColumns=@JoinColumn(name="manager_id"),
		inverseJoinColumns = @JoinColumn(name="employee_id")
			)
	private List<Employee> employees;
	
	@OneToMany(mappedBy="sender", fetch=FetchType.LAZY)
	private List<Request> sentRequests;
	
	@OneToMany(mappedBy="receiver", fetch=FetchType.LAZY)
	private List<Request> requests;
	
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
	
	@OneToMany(mappedBy="employee", fetch=FetchType.LAZY)
	private List<Schedule> empSchedules;
	
	public Employee() {
		
	}
	public List<Request> getSentRequests() {
		return sentRequests;
	}
	public void setSentRequests(List<Request> sentRequests) {
		this.sentRequests = sentRequests;
	}
	public List<Request> getRequests() {
		return requests;
	}
	public void setRequests(List<Request> requests) {
		this.requests = requests;
	}
	public List<Employee> getManagers() {
		return managers;
	}
	public void setManagers(List<Employee> managers) {
		this.managers = managers;
	}
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}
	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAccessLevel() {
		return accessLevel;
	}
	public void setAccessLevel(int accessLevel) {
		this.accessLevel = accessLevel;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public List<Schedule> getEmpSchedules() {
		return empSchedules;
	}
	public void setEmpSchedules(List<Schedule> empSchedules) {
		this.empSchedules = empSchedules;
	}
	
	
}
