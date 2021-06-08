package com.chb.interceptor;

import com.chb.service.TelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    @Qualifier("TelServiceImpl")
    private TelService telService;
    //在请求处理的方法之前执行
    //如果返回true执行下一个拦截器
    //如果返回false就不执行下一个拦截器
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session=httpServletRequest.getSession();
        //测试ajax
        if(httpServletRequest.getRequestURI().contains("ajax")||httpServletRequest.getRequestURI().contains("test")){
            return  true;
        }
        //是登录页面则放行
        if (httpServletRequest.getRequestURI().contains("login")){
            return true;
        }
        //如果用户已登录也放行
        if(session.getAttribute("user")!=null){
            return true;
        }
        //用户没有登录跳转到登录页面
        httpServletRequest.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(httpServletRequest,httpServletResponse);
        return false;
    }

    //在请求处理方法执行之后执行
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    //在dispatcherServlet处理后执行,做清理工作.
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}
