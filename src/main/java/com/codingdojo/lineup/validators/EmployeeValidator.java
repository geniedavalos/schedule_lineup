package com.codingdojo.lineup.validators;


import org.springframework.stereotype.Component;
import org.springframework.validation.Validator;
import org.springframework.validation.Errors;

import com.codingdojo.lineup.models.Employee;


@Component
public class EmployeeValidator implements Validator{
	@Override
	public boolean supports(Class<?> clazz) {
		return Employee.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		Employee employee = (Employee) target;
		
		if(!employee.getPasswordConfirmation().equals(employee.getPassword())) {
			errors.rejectValue("passwordConfirmation", "Match");
		}
	}
}
