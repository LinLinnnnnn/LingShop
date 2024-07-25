package Filter;

import java.io.IOException;


import javax.servlet.DispatcherType;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utils.RRSharer;


@WebFilter(filterName = "UTF8Filter",urlPatterns = {"/*"},dispatcherTypes = DispatcherType.REQUEST)
public class AppFilter implements HttpFilter{

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Appfilter - utf8");
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		RRSharer.add(req, resp);
		chain.doFilter(req, resp);
		//RRSharer.remove(req, resp);
	}

}
