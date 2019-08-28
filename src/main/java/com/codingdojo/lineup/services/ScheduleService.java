package com.codingdojo.lineup.services;

import java.time.LocalDate;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.codingdojo.lineup.models.Employee;
import com.codingdojo.lineup.models.Request;
import com.codingdojo.lineup.models.Schedule;
import com.codingdojo.lineup.repositories.EmployeeRepository;
import com.codingdojo.lineup.repositories.RequestRepository;
import com.codingdojo.lineup.repositories.ScheduleRepository;

@Service
public class ScheduleService {
	private final ScheduleRepository scheRepo;
	private final EmployeeRepository empRepo;
	private final RequestRepository reqRepo;
	
	public ScheduleService(ScheduleRepository scheRepo, EmployeeRepository empRepo, RequestRepository reqRepo) {
		this.scheRepo = scheRepo;
		this.empRepo = empRepo;
		this.reqRepo = reqRepo;
	}
	
	public Employee registerEmployee(Employee e) {
		return empRepo.save(e);
	}
	
	public List<Schedule> getSchedules(){
		return scheRepo.findAll();
	}
	
	public List<Employee> getEmployees(){
		return empRepo.findAll();
	}
	
	public Schedule addSchedule(Schedule s) {
		return scheRepo.save(s);
	}
	
	public Employee getEmp(Long id) {
		return empRepo.findById(id).get();
	}
	
	public void deleteStaff(Long id) {
		empRepo.deleteById(id);
	}
	
	public List<Schedule> empSchedules(Long id){
		return scheRepo.findAllByEmployeeId(id);
	}
	
	public void deleteSchedule(Long id) {
		scheRepo.deleteById(id);
	}
	
	public Employee addStaff(Employee e) {
		String hashed = BCrypt.hashpw(e.getPassword(), BCrypt.gensalt());
		e.setPassword(hashed);
		return empRepo.save(e);
	}
	public List<Schedule> getByDay(LocalDate startDate, LocalDate endDate){
		return scheRepo.findByDate(startDate, endDate);
	}
	
	public List<Employee> getManagers(){
		return empRepo.findManagers();
	}
	
	public Request sendRequest(Request r) {
		return reqRepo.save(r);
	}
	
	public Request getRequest(Long id) {
		return reqRepo.findById(id).get();
	}

}
