package io.spring.core;

public class Truck implements Vehicle{

	@Override
	public void startEngine(String type) {
		System.out.println(type +  " is starting...");
	}

}
