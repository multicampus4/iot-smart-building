package com.chat;

import java.util.LinkedList;
import java.util.Queue;

public class AutoController {
	public void AA(String s) {
		System.out.println(s);
	}
	
	public static void main(String[] args) {
		AutoController ac = new AutoController();
		ac.AA("SSS");
		
		Queue<Float> temp = new LinkedList<>();
		temp.add((float) 5.12);
		temp.add((float) 4.43);
		temp.add((float) 15.13);
		temp.add((float) 1.18);
		
		System.out.println(temp);
		System.out.println(temp.iterator());
		
		float t = 0;
		for(float f : temp) {
			t += f;
		}
		System.out.println(t/temp.size());
		
	}
}
