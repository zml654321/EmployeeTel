package com.chb.interceptor;

import com.chb.service.TelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class TelInterceptor implements HandlerInterceptor {
    @Autowired
    @Qualifier("TelServiceImpl")
    private TelService telService;
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String operate_grade=telService.queryOperate_grade((String) session.getAttribute("user"));
        // 如果用户已登陆也放行
        if (operate_grade.equals("0")) {
            // 用户没有登陆跳转到登陆页面
            request.getRequestDispatcher("/WEB-INF/jsp/info.jsp").forward(request, response);
            return false;
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
