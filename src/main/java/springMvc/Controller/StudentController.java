package springMvc.Controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import springMvc.Entity.Admin;
import springMvc.Entity.Course;
import springMvc.Entity.Student;
import springMvc.Service.studentService;

@Controller
@RequestMapping
public class StudentController 
{
	@Autowired
	private studentService ss;
	
	@GetMapping("/")
	public ModelAndView login()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/login")
	private ModelAndView loginValidate(@ModelAttribute("loginValidate") Admin admin)
	{
		ModelAndView mav = new ModelAndView();
		String username = "Admin";
		String password = "infotech123";
	
		if(admin.getPassword().equals(password))
		{
			mav.setViewName("redirect:home");
		}
		else {
			mav.addObject("wrong","Your password is invalid please try again");
			mav.setViewName("login");
		}
		return mav;
	}
	@RequestMapping("/home")
	public String home()
	{
		return "home";
	}
	
	@GetMapping("/registerForm")
	public ModelAndView register()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("len" , 0);
		mav.addObject("student",new Student());
		mav.addObject("form", "Student Registration");
		mav.setViewName("registerForm");
		return mav;
	}
	
	@GetMapping("/validateStudent")
	public @ResponseBody String validateEmail(HttpServletRequest req,Model model)
	{
		String ReqId = req.getParameter("id");
		int id = Integer.valueOf(ReqId);
		String email = req.getParameter("email");
		if(id!=0)
		{
			Student student = ss.findStudent(id);
			if(student.getEmail().equals(email)) return "notExisted";
		}
		String validate = ss.validateStudent(email);
		return validate;
	}
	
	@PostMapping("/addStu")
	public ModelAndView register(@ModelAttribute("student") Student stu)
	{
		ModelAndView mav = new ModelAndView();
		ss.saveStudent(stu);
		for(Course c : stu.getCourse())
		{
			if(c.getExperience()== null || c.getCourseName() == "") continue;
			c.setStudent(stu);
			ss.saveCourse(c);
		}
		mav.addObject("result","Student Added Successfully");
		mav.setViewName("success");
		return mav;
	}
	
	@PostMapping("/editForm/addStu")
	public ModelAndView update(@ModelAttribute("student") Student stu)
	{
		ModelAndView mav = new ModelAndView();
		ss.updateStudent(stu); 
		for(Course c : stu.getCourse())
		{
			if(c.getId() !=0 && c.getExperience()== null) {
				ss.deleteCourse(c.getId());
				continue;
			}
			if(c.getExperience()== null) 
				continue;
			c.setStudent(stu);
			ss.updateCourse(c); 
		}
		mav.addObject("result","Student Updated Successfully");
		mav.setViewName("success");
		return mav;
	}
	
	@GetMapping("/stuList")
	public ModelAndView Studentlist()
	{
		ModelAndView mav = new ModelAndView();
		List<Student> studentList = ss.StudentList();
		mav.addObject("Student",studentList);
		mav.setViewName("studentData");
		return mav;
	}
	
	@GetMapping("/List")
	public @ResponseBody String list(HttpServletRequest req,Model model)
	{
		int value;
		try {
		value = Integer.valueOf(req.getParameter("value"));
		}catch(NumberFormatException e){value = (int)ss.countRec();}
		if(value>ss.countRec()) value = (int)ss.countRec();
		List<Student> studentList = ss.StudentList().subList(0, value);
		for(Student s : studentList) s.setCourse(null);
	  	Gson g = new Gson();
		String json = g.toJson(studentList);
		return json; 	
	}  
	
	@PostMapping("/searchStu")
	public @ResponseBody String searchStudent(HttpServletRequest req,Model model)
	{
		String search = req.getParameter("search");
		List<Student> searchStudent = ss.searchStudent(search);
		for(Student s : searchStudent) {
			s.setCourse(null);
		}
		Gson g = new Gson();
		String json = g.toJson(searchStudent);
		return json; 
	}
	
	@GetMapping("/deleteStudent/{id}")
	public String deleteStudent(@PathVariable(value="id") int id)
	{
		ss.deleteStudent(id);
		return "redirect:/stuList";
	}
	
	@GetMapping("/editForm/{id}")
	public ModelAndView editForm(@ModelAttribute("student") Student stu, @PathVariable(value="id") int id)
	{
		ModelAndView mav = new ModelAndView();
		Student student = ss.findStudent(id);
		mav.addObject("student",student);
		
		int len = student.getCourse().size()-1;
		if(len>=0)
		mav.addObject("len", len);
		mav.addObject("form", "Update Student Details");
		mav.setViewName("registerForm");
		return mav;
	}
	
	@PostMapping("/editForm/editStudent")
	public ModelAndView editStudent(@ModelAttribute("editStudent") Student stu)
	{
		ModelAndView mav = new ModelAndView();
		ss.updateStudent(stu);
		mav.addObject("result","Student Updated Succesfully");
		mav.setViewName("success");
		return mav;
	}
	@GetMapping("/certificate/{id}")
	public ModelAndView certificate(@PathVariable("id")int id)
	{
		ModelAndView mav = new ModelAndView();
		Student student = ss.findStudent(id);
		int len = student.getCourse().size()-1;
		if(len>=0)
		mav.addObject("student",student);
		mav.addObject("len",len);
		mav.addObject("course", student.getCourse());
		mav.setViewName("certificate");
		return mav;
	}
}
