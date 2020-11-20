package logtest;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class PropTest {
	public static void main(String[] args) {
		FileReader resources = null;
 
		try {
			resources = new FileReader("../my.properties");
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		Properties properties = new Properties();
		try {
			properties.load(resources);
			System.out.println(properties.getProperty("tcpipIp"));
			System.out.println(properties.getProperty("tcpipPort"));
			System.out.println(properties.getProperty("websocketIp"));
			System.out.println(properties.getProperty("websocektPort"));
			System.out.println(properties.getProperty("serialPort"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
