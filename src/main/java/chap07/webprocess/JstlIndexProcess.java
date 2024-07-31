package chap07.webprocess;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap07.web.WebProcess;

public class JstlIndexProcess implements WebProcess {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("favSnack", "감자칩");
		request.setAttribute("animals", new String[] {"강아지", "고양이", "호랑이", "소", "닭", "여우", "토끼"});
		
		List<String> fruits = new ArrayList<>();
		request.setAttribute("fruits", fruits);
		
		fruits.add("사과");
		fruits.add("오렌지");
		fruits.add("귤");
		fruits.add("포도");
		fruits.add("사과");
		fruits.add("오렌지");
		fruits.add("귤");
		fruits.add("포도");
		
		return "/jstl/index";
	}

}
