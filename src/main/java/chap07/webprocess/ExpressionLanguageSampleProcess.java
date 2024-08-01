package chap07.webprocess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap07.dto.Student;
import chap07.web.WebProcess;

public class ExpressionLanguageSampleProcess implements WebProcess {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("book", "해리포터와 불의 잔");
		request.setAttribute("student", new Student("이재상", "삼일초등학교", 100, 80, 89));
		request.setAttribute("appleCount", 123);
		request.setAttribute("basketSize", 10);
		
		return "/jstl/el";
	}
}
