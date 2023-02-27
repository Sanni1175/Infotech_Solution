package springMvc.DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import springMvc.Entity.Course;
import springMvc.Entity.Student;

@Repository
public class StudentDaoImp implements StudentDao
{
	@Override
	public Student findByIdStudentDetails(int id)
	{
		Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        Student student = session.get(Student.class, id);
//        session.close();
		return student;					
	}
	
	@Override
	public Student findStudent(int id)
	{
		Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        Student student = session.get(Student.class, id);
        session.close();
		return student;					
	}
	
	@Override
	public void deleteStudentDetailsById(int id)
	{
		Student student = findStudent(id);
		if(student != null) {
		Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Transaction transaction =session.beginTransaction();
		session.delete(student);
		transaction.commit();
		session.close();
		}
	}
	
	@Override
	public void deleteCourseDetailsById(int id)
	{
		Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Transaction transaction =session.beginTransaction();
		Course course = session.get(Course.class, id);
		session.delete(course);
		transaction.commit();
		session.close();
	}
	
	@Override
	public void updateStudentDetailsById(Student stu)
	{
		try {
			Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
			Transaction transaction =session.beginTransaction();
			session.saveOrUpdate(stu);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			// TODO: handle exception
		}	
	}
	
	@Override
	public void updateCourseDetailsById(Course course)
	{
		try {
			Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
			Transaction transaction =session.beginTransaction();
			session.saveOrUpdate(course);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	@Override
	public void SaveStudentDetails(Student stu)
	{
		try {
			Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			session.save(stu);
			transaction.commit();
			session.close();					
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@Override
	public void SaveCourseDetails(Course course)
	{
		try {
			Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			session.save(course);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@Override
	public List<Student> getStudentList()
	{
		Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Transaction transaction =session.beginTransaction();
		List<Student> list = session.createQuery("FROM Student", Student.class).list();
		session.close();
		return list;
	}

	@Override
	public Student FinByEmailStudentDetails(String email) 
	{
		Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		String query = "from Student where email= :x ";
		Student result = null;
		try {
		Query stu = session.createQuery(query);
		stu.setParameter("x", email);
		result = (Student)stu.getSingleResult();
		}catch(Exception e) {}
		return result;
	}

	@Override
	public List<Student> SearchStudent(String name) {
		
		Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Criteria criteria= session.createCriteria(Student.class);
		SimpleExpression namee = Restrictions.like("name", "%"+name+"%");
		SimpleExpression email = Restrictions.like("email", "%"+name+"%");
		SimpleExpression phone = Restrictions.like("phone", "%"+name+"%");
		SimpleExpression address = Restrictions.like("address", "%"+name+"%");
		
		Disjunction or = Restrictions.or(namee, email, phone, address);	
		criteria.add(or);
		List list = criteria.list();
		
		session.close();
		return list;
	}	
	
	@Override
	public long countRecord()
	{
		Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        Query createQuery = session.createQuery("select count(*) from Student");
        long count = (long)createQuery.getSingleResult();
        session.close();
        return count;
	}
}
