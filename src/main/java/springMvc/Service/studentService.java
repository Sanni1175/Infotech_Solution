package springMvc.Service;

import java.util.List;

import springMvc.Entity.Course;
import springMvc.Entity.Student;

public interface studentService 
{
	abstract void saveStudent(Student stu);
	abstract void saveCourse(Course course);
	abstract void deleteStudent(int id);
	public void deleteCourse(int id);
	abstract void updateStudent(Student stu);
	public void updateCourse(Course course);
	abstract Student findStudent(int id);
	abstract List<Student> StudentList();
	abstract List<Student> searchStudent(String name);
	abstract String validateStudent(String email);
	public long countRec();
}
