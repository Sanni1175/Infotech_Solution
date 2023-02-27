package springMvc.Entity;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;


@Data
@Entity
@Table(name="StudentData")
public class Student 
{
	@Id
	@GeneratedValue( generator = "increment" )
	@GenericGenerator( name = "increment", strategy = "increment" )
	private int id;
	private String name;
	private String email;
	private String phone;
	private String date;
	private String address;
	
	@OneToMany(cascade= CascadeType.REMOVE,mappedBy="student",fetch = FetchType.LAZY)
	private List<Course> course = new ArrayList();

}

