package io.spring.ioc.di;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyRun {

	public static void main(String[] args) {
		//CarSpring carSpring = new CarSpring();
		
		ClassPathXmlApplicationContext context = 
				new ClassPathXmlApplicationContext("applicationContext.xml");
		
		CarSpring carSpring = context.getBean("carSpring" , CarSpring.class);
		
		carSpring.start();
		
		context.close();
	}
	
}
