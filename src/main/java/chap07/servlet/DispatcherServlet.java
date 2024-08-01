package chap07.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap07.web.WebProcess;
import chap07.webprocess.ExpressionLanguageSampleProcess;
import chap07.webprocess.JstlIndexProcess;
import chap07.webprocess.NotfoundProcess;

public class DispatcherServlet extends HttpServlet {
	final private static HashMap<String, WebProcess> URI_MAPPING = new HashMap<>();
	final private static String PREFIX = "/WEB-INF/views";
	final private static String SUFFIX = ".jsp";
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		URI_MAPPING.put("GET:%s/jstl", new JstlIndexProcess());
		URI_MAPPING.put("GET:/jstl/el", new ExpressionLanguageSampleProcess());
		URI_MAPPING.put("GET:/notfound", new NotfoundProcess());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String contextPath = req.getContextPath();
		
		String method = req.getMethod();
		String uri = req.getRequestURI().substring(contextPath.length());
		
		System.out.println("요청 방식: " + method);
		System.out.println("ContextPath가 짤린 요청URI: " + uri);
		
		WebProcess wp = URI_MAPPING.get(method + ":" + uri);
		
		String nextView = null;
		
		if (wp != null) {
			nextView = wp.process(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/notfound");
			return;
		}
		
		if (nextView.startsWith("redirect:")) {
			resp.sendRedirect(nextView.substring("redirect:".length()));
		} else {
			req.getRequestDispatcher(PREFIX + nextView + SUFFIX).forward(req, resp);
		}
	}
}
