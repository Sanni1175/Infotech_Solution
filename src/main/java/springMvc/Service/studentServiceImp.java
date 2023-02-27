package springMvc.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.cj.x.protobuf.MysqlxCrud.Delete;

import springMvc.DAO.StudentDao;
import springMvc.Entity.Course;
import springMvc.Entity.Student;

@Service
public class studentServiceImp implements studentService 
{
	@Autowired
	private StudentDao sd;
	
	@Override
	public void saveStudent(Student stu)
	{
		sd.SaveStudentDetails(stu);
	}
	
	@Override
	public void saveCourse(Course course)
	{
		sd.SaveCourseDetails(course);
	}
	
	@Override
	public void deleteStudent(int id)
	{
		sd.deleteStudentDetailsById(id);
	}
	
	@Override
	public void deleteCourse(int id)
	{
		sd.deleteCourseDetailsById(id);
	}
	
	@Override
	public void updateStudent(Student stu)
	{
		sd.updateStudentDetailsById(stu);
	}
	@Override
	public void updateCourse(Course course)
	{
		sd.updateCourseDetailsById(course);
	}
	
	@Transactional
	public Student findStudent(int id)
	{
		Student stu = sd.findByIdStudentDetails(id);
		Hibernate.initialize(stu.getCourse());
		return stu;
	}
	
	@Override
	public List<Student> StudentList()
	{
		return sd.getStudentList();
	}

	@Override
	public List<Student> searchStudent(String name) 
	{
		return sd.SearchStudent(name);
	}
	
	@Override
	public String validateStudent(String email) 
	{
		Student student = sd.FinByEmailStudentDetails(email);
		if(student!=null) return "existed";
		else return "notExisted";
	}
	
	@Override
	public long countRec()
	{
		return sd.countRecord();
	}
}
