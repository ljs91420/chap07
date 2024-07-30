package chap07.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface WebProcess {
	String process(HttpServletRequest request, HttpServletResponse response);
}
