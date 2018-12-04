package com.somesing.mail;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class PropertyTest {

	@Test
	public void Test() throws Exception{
		Properties properties = new Properties();
		ClassPathResource resource = new ClassPathResource("/country/country.properties");
		properties.load(new FileInputStream(resource.getFile()));
		
		for(String key : properties.stringPropertyNames()) {
		    String value = properties.getProperty(key);
		    System.out.println(key + " => " + value);
		}
	}
}


/*public static List<Map<String, String>> conturyLoad() throws Exception{
	
	 Properties properties = new Properties();
	 
	 try {
	      properties.load(new FileInputStream("example01.properties"));
	      
	      properties.get
	      
	      
	    } catch (IOException e) {
	    }

	    String avalue = properties.getProperty("a");
	    System.out.println(avalue);
	    properties.setProperty("a", "properties test");
	    return null;
}*/


/*String propFileName = "application.properties";  // properties파일명

InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
properties.load(inputStream);
for(String key : properties.stringPropertyNames()) {
    String value = properties.getProperty(key);
    System.out.println(key + " => " + value);
}
*/
