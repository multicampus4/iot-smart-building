package com.ex.chat2.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chat.Client;

@Controller
public class MainController {
	
	Client client;
	
	public MainController() {
		client = new Client("192.168.0.6", 5555, "[WEB]");
		try {
			client.connect();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}
	
	@RequestMapping("/ledStart")
	public void ledStart(HttpServletResponse res) throws IOException {
		System.out.println("LED START ...");
		client.sendMsg("ledStart");
		
	}
	
	@RequestMapping("/ledStop")
	public void ledStop(HttpServletResponse res) throws IOException {
		System.out.println("LED STOP ...");
		client.sendMsg("ledStop");
		
	}
}
