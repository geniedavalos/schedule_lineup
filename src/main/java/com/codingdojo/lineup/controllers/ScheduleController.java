package com.codingdojo.lineup.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codingdojo.lineup.models.Employee;
import com.codingdojo.lineup.models.Request;
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
	public String dashboard(@ModelAttribute("schedule") Schedule s, @ModelAttribute("request")Request req, Model model, HttpSession session) {
		if(session.getAttribute("emp_id") == null) {
			return "redirect:/";
		} else {
		model.addAttribute("schedule", s);
		model.addAttribute("request",req);
		List<Schedule> schedules = scheServ.getSchedules();
		model.addAttribute("schedules", schedules);
		return "/calendar/calendar.jsp";
		}
	}
	@RequestMapping("/swap-request")
	public String swap(@ModelAttribute("schedule") Schedule s, Model model, HttpSession session) {
		List<Schedule> schedules = scheServ.getSchedules();
		model.addAttribute("schedules", schedules);	
		return "/calendar/swapRequest.jsp";
	}
	
	@RequestMapping("/manager")
	public String managerdashboard(@ModelAttribute("schedule") Schedule s, Model model, HttpSession session) {
		Long id = (Long) session.getAttribute("emp_id");
		if(id==null) {
			return "redirect:/";
		} else {
			Employee manager = scheServ.getEmp(id);
			if(manager.getAccessLevel() != 9) {
				return "redirect:/schedule";
			} else {
				List<Request> requests = manager.getRequests();
				model.addAttribute("requests", requests);
				List<Schedule> schedules = scheServ.schedulesOrderByWorkDate();
				model.addAttribute("schedules", schedules);
				List<Employee> employees = scheServ.getEmployees();
				model.addAttribute("allEmployees", employees);
				model.addAttribute("schedule", s);
				return "/calendar/manager.jsp";
			}
		}
	}
	
	@RequestMapping(value="/addSchedule", method=RequestMethod.POST)
	public String addSchedule(@ModelAttribute("schedule")Schedule s, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println(result);
			return "/calendar/manager.jsp";
		} else if (s.getWorkDate() == null || s.getStartHour() == null || s.getEndHour() == null) {
			return "/calendar/manager.jsp";
		} else {
			scheServ.addSchedule(s);
			return "redirect:/schedule/manager";
		}
	}
	
	@RequestMapping("/settings")
	public String settingsPage(@ModelAttribute("employees")Employee e, Model model, HttpSession session) {
		Long id = (Long) session.getAttribute("emp_id");
		if(id==null) {
			return "redirect:/";
		} else {
			Employee manager = scheServ.getEmp(id);
			if(manager.getAccessLevel() != 9) {
				return "redirect:/schedule";
			} else {
			List<Employee> employees = scheServ.getEmployees();
			model.addAttribute("employee", e);
			model.addAttribute("allEmployees", employees);
			return "/calendar/settings.jsp";
			}
		}
	}
	
	@RequestMapping(value="/{id}/changeAccess", method=RequestMethod.POST)
	public String updateAccess(@PathVariable("id")Long id, @RequestParam("accessLvl") int accLvl) {
		Employee e = scheServ.getEmp(id);
		if(accLvl == 9) {
			e.setAccessLevel(accLvl);
			List<Employee> managers = e.getManagers();
			if(e.getEmployees().contains(e)) {
				e.getEmployees().remove(e);
			}
			if(!managers.contains(e)) {
				managers.add(e);
			}
			scheServ.registerEmployee(e);
		}
		if(accLvl == 1) {
			e.setAccessLevel(accLvl);
			List<Employee>employees = e.getEmployees();
			if(e.getManagers().contains(e)) {
				e.getManagers().remove(e);
			}
			if(!employees.contains(e)) {
				employees.add(e);
			}
			scheServ.registerEmployee(e);
		}

		return "redirect:/schedule/settings";
	}
	
	@RequestMapping("/allStaff")
	public String showStaff(Model model) {
		List<Employee> employees = scheServ.getEmployees();
		model.addAttribute("allEmployees", employees);
		return "/calendar/settings.jsp";
	}
	
	@RequestMapping(value="/employees/{id}", method=RequestMethod.DELETE)
	public String deleteStaff(@PathVariable("id") Long id) {
		scheServ.deleteStaff(id);
		List<Schedule> schedules = scheServ.empSchedules(id);
		for(Schedule schedule: schedules) {
			scheServ.deleteSchedule(schedule.getId());
		}
		return "redirect:/schedule/settings";
	}
	
	@RequestMapping("/addStaff")
	public String addStaffPage(@ModelAttribute("employee") Employee e, Model model) {
		model.addAttribute("employee", e);
		return "/calendar/settings.jsp";
	}
	
	@RequestMapping(value="/addStaff", method=RequestMethod.POST)
	public String addStaff(@ModelAttribute("employee") Employee e, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println(result);
			return "/calendar/settings.jsp";
		} else {
			scheServ.addStaff(e);
			return "redirect:/schedule/settings";
		}
	}
//	
//	@RequestMapping("/swap")
//	public String swapPage(@ModelAttribute("scheduleObj")Schedule s, Model model, HttpSession session) {
//		Long id = (Long) session.getAttribute("emp_id");
//		List<Schedule> mySchedules = scheServ.empSchedules(id);
//		System.out.println(mySchedules);
//		model.addAttribute("mySchedules", mySchedules);
//		model.addAttribute("scheduleObj", s);
//		return "swap.jsp";
//	}
//	@RequestMapping(value="/schedule/{id}/swap", method= RequestMethod.PUT)
//	public String swap(@ModelAttribute("scheduleObj") Schedule s, BindingResult result) {
//		scheServ.get
//	}
	@RequestMapping(value="/requestOff", method=RequestMethod.POST)
	public String requestOff(@ModelAttribute("request") Request req, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println(result);
			return "/calendar/calendar.jsp";
		} else if (req.getStart() == null || req.getEnd() == null || req.getDescription() == null){
			System.out.println("error");
			return "/calendar/calendar.jsp";
			} else {
			List<Employee> managers = scheServ.getManagers();
			for(Employee manager: managers) {
				Request newReq = req;
				newReq.setReceiver(manager);
				scheServ.sendRequest(newReq);
			}
			
			return "redirect:/schedule";
		}
	}
	@RequestMapping("/request/{id}/{status}")
	public String requestApproval(@PathVariable("status") String status, @PathVariable("id")Long id) {
		if(status.equals("accepted")) {
			Request req = scheServ.getRequest(id);
			req.setApproved(true);
			scheServ.sendRequest(req);
		}
		if(status.equals("denied")) {
			Request req = scheServ.getRequest(id);
			req.setApproved(false);
			scheServ.sendRequest(req);
		}
		return "redirect:/schedule/manager";
	}
	
//	@PostMapping("/getByDay")
//	public @ResponseBody String getByDay(@RequestParam("date") String date) {
//		LocalDate startDate = LocalDate.parse(date);
//		LocalDate endDate = startDate.plusDays(1);
//		List<Schedule> schedules = scheServ.getByDay(startDate, endDate);
//		String s = "{'people':[";
//		for(int i = 0; i < schedules.size();i++) {
//			Employee e = schedules.get(i).getEmployee();
//			Schedule sch = schedules.get(i);
//			s += "{";
//			s += "'id':";
//			s += "'"+e.getId() + "',";
//			s += "'first_name':";
//			s += "'"+e.getFirstName() + "',";
//			s += "'last_name':";
//			s += "'"+e.getLastName() + "',";
//			s += "'start_hour':";
//			s += "'"+sch.getStartHour() + "',";
//			s += "'end_hour':";
//			s += "'"+sch.getEndHour() + "'";
//			
//			if(i == schedules.size() - 1) {
//				s += "}";
//			} else {	
//				s += "},";
//			}
//			
//		}
//		s += "]}";
//		System.out.println(s);
//		return s;
//		
//	}
	
}

