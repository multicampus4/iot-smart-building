package com.vo;

public class SensorVO {
	
	String sensorname;
	int outcome;
	public SensorVO() {
		super();
	}
	public SensorVO(String sensorname, int outcome) {
		super();
		this.sensorname = sensorname;
		this.outcome = outcome;
	}
	public String getSensorname() {
		return sensorname;
	}
	public void setSensorname(String sensorname) {
		this.sensorname = sensorname;
	}
	public int getOutcome() {
		return outcome;
	}
	public void setOutcome(int outcome) {
		this.outcome = outcome;
	}
	@Override
	public String toString() {
		return "SensorVO [sensorname=" + sensorname + ", outcome=" + outcome + "]";
	}
	

}
