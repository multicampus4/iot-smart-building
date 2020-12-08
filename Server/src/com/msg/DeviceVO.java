package com.msg;

public class DeviceVO {
	private String DEVICE_ID;
	private String DEVICE_STAT;
	
	
	public DeviceVO() {
		
	}


	public DeviceVO(String DEVICE_ID, String DEVICE_STAT) {
		this.DEVICE_ID = DEVICE_ID;
		this.DEVICE_STAT = DEVICE_STAT;
	}


	public String getDEVICE_ID() {
		return DEVICE_ID;
	}


	public void setDEVICE_ID(String DEVICE_ID) {
		this.DEVICE_ID = DEVICE_ID;
	}


	public String getDEVICE_STAT() {
		return DEVICE_STAT;
	}


	public void setDEVICE_STAT(String DEVICE_STAT) {
		this.DEVICE_STAT = DEVICE_STAT;
	}


	@Override
	public String toString() {
		return "DeviceVO [DEVICE_ID=" + DEVICE_ID + ", DEVICE_STAT=" + DEVICE_STAT + "]";
	}
	
	

	
	
	
}
