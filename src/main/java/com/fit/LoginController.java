package com.fit;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	@RequestMapping("/add")
	public String add(@RequestParam("username") String y,HttpServletResponse response, HttpServletRequest request)throws IOException{
		String sendTo = null;
		System.out.println("Controller START");
		try {
			 PrintWriter out = response.getWriter();
			//String y = request.getParameter("ff");
			if (null != y && !y.isEmpty()) {
				sendTo = "pages/display.jsp";
			} else {
				sendTo = "";
				out.print(0);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println(" Failed ");
		}
		System.out.println("Controller END");
		return sendTo;
	}
}
