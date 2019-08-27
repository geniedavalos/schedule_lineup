package com.codingdojo.lineup.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.lineup.models.Employee;
import com.codingdojo.lineup.services.EmployeeService;
import com.codingdojo.lineup.services.ScheduleService;
import com.codingdojo.lineup.validators.EmployeeValidator;


@Controller
public class AuthController {
	private final EmployeeService empServ;
	private final EmployeeValidator empValidator;
	private final ScheduleService scheServ;
	
	public AuthController(EmployeeValidator empVal, EmployeeService empServ, ScheduleService scheduleService) {
		empValidator = empVal;
		this.empServ = empServ;
		scheServ = scheduleService;
		
	}
	
	@RequestMapping("")
	public String index(@ModelAttribute("employee") Employee e, Model model) {
		model.addAttribute("employee", e);
		return "testForm.jsp";
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("employee") Employee e, BindingResult result, HttpSession session) {
	empValidator.validate(e, result);
	if(result.hasErrors()) {
		return "testForm.jsp";
	} else {
		Employee emp = empServ.registerEmployee(e);
		session.setAttribute("emp_id", emp.getId());
		return "redirect:/schedule";
		}
	}
	
	@RequestMapping("/login")
	public String loginPage() {
		return "testLogin.jsp";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
		System.out.println(email);
		System.out.println(password);
		if(empServ.authenticateEmployee(email, password) == false ) {
			model.addAttribute("error", "Invalid Credentials, please try again!");
			return "redirect:/";
		} else{
			Employee emp = empServ.findByEmail(email);
			session.setAttribute("emp_id", emp.getId());
			return "redirect:/schedule";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
