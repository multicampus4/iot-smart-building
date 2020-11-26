package com.vo;

public class SensorVO {
	private String SENSOR_ID;
	private String SENSOR_STAT;
	
	
	public SensorVO() {
		
	}


	public SensorVO(String SENSOR_ID, String SENSOR_STAT) {
		this.SENSOR_ID = SENSOR_ID;
		this.SENSOR_STAT = SENSOR_STAT;
	}


	public String getSENSOR_ID() {
		return SENSOR_ID;
	}


	public void setSENSOR_ID(String sENSOR_ID) {
		SENSOR_ID = sENSOR_ID;
	}


	public String getSENSOR_STAT() {
		return SENSOR_STAT;
	}


	public void setSENSOR_STAT(String sENSOR_STAT) {
		SENSOR_STAT = sENSOR_STAT;
	}


	@Override
	public String toString() {
		return "SensorVO [SENSOR_ID=" + SENSOR_ID + ", SENSOR_STAT=" + SENSOR_STAT + "]";
	}
	
	

	
	
	
}
