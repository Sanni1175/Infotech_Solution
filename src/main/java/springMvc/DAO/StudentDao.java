package springMvc.DAO;

import java.util.List;

import springMvc.Entity.Course;
import springMvc.Entity.Student;

public interface StudentDao 
{
	public Student findByIdStudentDetails(int id);
	public Student FinByEmailStudentDetails(String emial);
	public Student findStudent(int id);
	public void deleteStudentDetailsById(int id);
	public void deleteCourseDetailsById(int id);
	public void updateStudentDetailsById(Student stu);
	public void updateCourseDetailsById(Course course);
	public void SaveStudentDetails(Student stu);
	public void SaveCourseDetails(Course course);
	public List<Student> getStudentList();
	public List<Student> SearchStudent(String name);
	public long countRecord();
	
}
