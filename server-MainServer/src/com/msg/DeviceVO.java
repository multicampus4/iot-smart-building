package com.msg;

import java.util.Queue;

public class DeviceVO {
	private String DEVICE_ID;
	private String DEVICE_STAT;
	private Queue<Float> RAW_QUEUE;
	
	public DeviceVO() {
		
	}


	public DeviceVO(String DEVICE_ID, String DEVICE_STAT) {
		this.DEVICE_ID = DEVICE_ID;
		this.DEVICE_STAT = DEVICE_STAT;
	}
	

	public DeviceVO(String DEVICE_ID, String DEVICE_STAT, Queue<Float> RAW_QUEUE) {
		this.DEVICE_ID = DEVICE_ID;
		this.DEVICE_STAT = DEVICE_STAT;
		this.RAW_QUEUE = RAW_QUEUE;
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
	


	public Queue<Float> getRAW_QUEUE() {
		return RAW_QUEUE;
	}


	public void setRAW_QUEUE(Queue<Float> RAW_QUEUE) {
		this.RAW_QUEUE = RAW_QUEUE;
	}


	@Override
	public String toString() {
		return "DeviceVO [DEVICE_ID=" + DEVICE_ID + ", DEVICE_STAT=" + DEVICE_STAT + ", RAW_QUEUE=" + RAW_QUEUE + "]";
	}
	
	
	
}
