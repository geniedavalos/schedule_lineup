package com.codingdojo.lineup.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.lineup.models.Employee;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Long>{
	List<Employee> findAll();
	Employee findByEmail(String email);
	
	@Query(value="SELECT * FROM employees WHERE access_level = 9", nativeQuery=true)
	List<Employee> findManagers();
	
 }
