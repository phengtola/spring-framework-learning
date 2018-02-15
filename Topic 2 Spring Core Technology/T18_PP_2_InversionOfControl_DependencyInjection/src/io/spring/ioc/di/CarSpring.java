package io.spring.ioc.di;

public class CarSpring {

	private VehicleService vehicleService;
	
	// Use for Constructor injection
//	public CarSpring(VehicleService vehicleService){
//		this.vehicleService = vehicleService;
//	}
	
	// Use for Setter Injection
	public void setVehicleService (VehicleService vehicleService){
		this.vehicleService = vehicleService;
	}
	
	public void start(){
		//vehicleService = new Car();
		vehicleService.startEngine("Car");
	}
	
}
