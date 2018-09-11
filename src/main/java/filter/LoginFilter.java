package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.weaver.tools.cache.AsynchronousFileCacheBacking.RemoveCommand;

public class LoginFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain fc)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse resp = (HttpServletResponse) arg1;
		if(check(req.getRequestURI())) {
			fc.doFilter(arg0,arg1);
		}else {
			if(req.getSession().getAttribute("user")==null) {
				System.out.println(req.getRequestURI());
				resp.sendRedirect("/login.jsp");
			}else {
				fc.doFilter(arg0,arg1);			
				}
		}
		
	}

	private boolean check(String url) {
		for(int i=0;i<remove.length;i++) {
			if(url.endsWith(remove[i])) return true;
		}
		return false;
	}
	
	String[]remove=new String[0];	
	
	
	public void init(FilterConfig cc) throws ServletException {
		remove=cc.getInitParameter("remove").split(",");
		
	}

}
