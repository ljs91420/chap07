package chap07.webprocess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap07.web.WebProcess;

public class JstlIndexProcess implements WebProcess {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("favSnack", "감자칩");
		request.setAttribute("animals", new String[] {"강아지", "고양이", "호랑이", "소", "닭", "여우", "토끼"});
		
		return "jstl/index";
	}

}
