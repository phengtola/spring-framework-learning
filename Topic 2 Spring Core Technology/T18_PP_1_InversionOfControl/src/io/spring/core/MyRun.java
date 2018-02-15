package io.spring.core;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyRun {
	
	public static void main(String[] args) {
		
		// 1. Create Object
		// Vehicle vehicle = new Car();
		// 2. Call Method
		// vehicle.startEngine("car");
		
		// 1. Add Library 
		
		// 2. Create XML file to define beans
		
		// 3. Load Spring Container
		ClassPathXmlApplicationContext context = 
				new ClassPathXmlApplicationContext("applicationContext.xml");
		
		// 4. Get Beans
		Vehicle vehicleCar = (Car) context.getBean("car");
		Vehicle vehicleTruck = context.getBean("truck" , Truck.class);
	
		// 5. Call Method from beans 
		vehicleCar.startEngine("car");
		vehicleTruck.startEngine("truck");
		
		// 6. Close Context
		context.close();
		
		
		
		
		
		
		
		
		
		
	}

}
