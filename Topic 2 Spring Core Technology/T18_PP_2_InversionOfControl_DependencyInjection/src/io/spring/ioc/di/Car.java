package io.spring.ioc.di;

public class Car implements VehicleService{

	@Override
	public void startEngine(String type) {
		System.out.println(type + " is starting ...");
	}

}
