package com.codingdojo.lineup.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.codingdojo.lineup.models.Employee;
import com.codingdojo.lineup.repositories.EmployeeRepository;

@Service
public class EmployeeService {
	private final EmployeeRepository empRepo;
	
	public EmployeeService(EmployeeRepository empRepo) {
		this.empRepo = empRepo;
	}
	
	//register employee
		public Employee registerEmployee(Employee employee) {
			String hashed = BCrypt.hashpw(employee.getPassword(), BCrypt.gensalt());
			employee.setPassword(hashed);
			return empRepo.save(employee);
		}
		
		// find employee by email
		public Employee findByEmail(String email) {
			return empRepo.findByEmail(email);
		}
		
		//find employee by id
		public Employee findById(Long id) {
			Optional<Employee> u = empRepo.findById(id);
			if(u.isPresent()) {
				return u.get();
			} else {
				return null;
			}
		}
		
		//authentication
		public boolean authenticateEmployee(String email, String password) {
			Employee employee = empRepo.findByEmail(email);
			if(employee==null) {
				return false;
			} else {
				if(BCrypt.checkpw(password,  employee.getPassword())) {
					return true;
				} else {
					return false;
				}
			}
		}
}

