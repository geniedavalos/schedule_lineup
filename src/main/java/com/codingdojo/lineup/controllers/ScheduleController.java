package com.codingdojo.lineup.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.lineup.models.Employee;
import com.codingdojo.lineup.models.Schedule;
import com.codingdojo.lineup.services.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	private final ScheduleService scheServ;
	
	public ScheduleController(ScheduleService scheduleService) {
		scheServ = scheduleService;
	}
	
	@RequestMapping("")
	public String dashboard(Model model) {
		List<Schedule> schedules = scheServ.getSchedules();
		model.addAttribute("schedules", schedules);
		return "/testDashboard.jsp";
	}
	
	@RequestMapping("/addSchedule")
	public String addForm(@ModelAttribute("schedule") Schedule s, Model model) {
		List<Employee> employees = scheServ.getEmployees();
		model.addAttribute("schedule", s);
		model.addAttribute("allEmployees", employees);
		return "testAddSchedule.jsp";
	}
	
	@RequestMapping(value="/addSchedule", method=RequestMethod.POST)
	public String addSchedule(@ModelAttribute("schedule")Schedule s, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println(result);
			return "testAddSchedule.jsp";
		} else {
			scheServ.addSchedule(s);
			return "redirect:/schedule";
		}
	}
	
	@RequestMapping("/settings")
	public String settingsPage(@ModelAttribute("employees")Employee e, Model model) {
		List<Employee> employees = scheServ.getEmployees();
		model.addAttribute("employee", e);
		model.addAttribute("allEmployees", employees);
		return "settings.jsp";
	}
	
	@RequestMapping(value="/{id}/changeAccess", method=RequestMethod.POST)
	public String updateAccess(@PathVariable("id")Long id, @RequestParam("accessLvl") int accLvl) {
		Employee e = scheServ.getEmp(id);
		e.setAccessLevel(accLvl);
		scheServ.registerEmployee(e);
		return "redirect:/schedule";
	}
	
	@RequestMapping("/allStaff")
	public String showStaff(Model model) {
		List<Employee> employees = scheServ.getEmployees();
		model.addAttribute("allEmployees", employees);
		return "/staffList.jsp";
	}
	
	@RequestMapping(value="/employees/{id}", method=RequestMethod.DELETE)
	public String deleteStaff(@PathVariable("id") Long id) {
		scheServ.deleteStaff(id);
		List<Schedule> schedules = scheServ.empSchedules(id);
		for(Schedule schedule: schedules) {
			scheServ.deleteSchedule(schedule.getId());
		}
		return "redirect:/schedule";
	}
	
	@RequestMapping("/addStaff")
	public String addStaffPage(@ModelAttribute("employee") Employee e, Model model) {
		model.addAttribute("employee", e);
		return "addStaff.jsp";
	}
	
	@RequestMapping(value="/addStaff", method=RequestMethod.POST)
	public String addStaff(@ModelAttribute("employee") Employee e, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println(result);
			return "addStaff.jsp";
		} else {
			scheServ.addStaff(e);
			return "redirect:/schedule";
		}
	}
	@RequestMapping("/byDay")
	public String searchByDay(@RequestParam(name="daySearch", required=false ) String date, Model model) {
		System.out.println(date);
		LocalDate startDate = LocalDate.parse(date);
		LocalDate endDate = startDate.plusDays(1);
		List<Schedule> scheByDay = scheServ.getByDay(startDate, endDate);
		System.out.println(scheByDay);
		model.addAttribute("byDay", scheByDay);
		return "testByDay.jsp";
	}
	
	@RequestMapping("/swap")
	public String swapPage(@ModelAttribute("scheduleObj")Schedule s, Model model, HttpSession session) {
		Long id = (Long) session.getAttribute("emp_id");
		List<Schedule> mySchedules = scheServ.empSchedules(id);
		System.out.println(mySchedules);
		model.addAttribute("mySchedules", mySchedules);
		model.addAttribute("scheduleObj", s);
		return "swap.jsp";
	}
	
//	@RequestMapping(value="/schedule/{id}/swap", method= RequestMethod.PUT)
//	public String swap(@ModelAttribute("scheduleObj") Schedule s, BindingResult result) {
//		scheServ.get
//	}
	
	
	
}

