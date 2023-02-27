package springMvc.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;

@Data
//@Entity
public class Admin 
{
//	@Id
//	@GenericGenerator(name="inc",strategy="increment")
//	@GeneratedValue(generator="inc")
	private int id;
	private String username;
	private String password;
}
