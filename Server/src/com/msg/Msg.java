package com.msg;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;


public class Msg implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HashMap<String, Msg> maps;
	private ArrayList<String> ips;
	private String id;
	private String msg;
	private String type;
	
	public Msg() {
	}
	
	public Msg(String id, String msg) {
		this.id = id;
		this.msg = msg;
	}
	
	public Msg(String id, String msg, String type) {
		super();
		this.id = id;
		this.msg = msg;
		this.type = type;
	}

	public Msg(ArrayList<String> ips, String id, String msg) {
		this.ips = ips;
		this.id = id;
		this.msg = msg;
	}

	public Msg(HashMap<String, Msg> maps, ArrayList<String> ips, String id, String msg) {
		this.maps = maps;
		this.ips = ips;
		this.id = id;
		this.msg = msg;
	}
	
	public Msg(HashMap<String, Msg> maps, ArrayList<String> ips, String id, String msg, String type) {
		super();
		this.maps = maps;
		this.ips = ips;
		this.id = id;
		this.msg = msg;
		this.type = type;
	}

	public HashMap<String, Msg> getMaps() {
		return maps;
	}

	public void setMaps(HashMap<String, Msg> maps) {
		this.maps = maps;
	}

	public ArrayList<String> getIps() {
		return ips;
	}

	public void setIps(ArrayList<String> ips) {
		this.ips = ips;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Msg [maps=" + maps + ", ips=" + ips + ", id=" + id + ", msg=" + msg + ", type=" + type + "]";
	}
	
	
}