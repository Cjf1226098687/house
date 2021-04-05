package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pojo.User;
import service.UserService;

/**
 * 用户接口
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 跳转至登录页面
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/loginCheck")
    public String login(User user, Model model, HttpSession httpSession) throws Exception {

        User user1 = userService.login(user);

        if (user1 != null) {
            httpSession.setAttribute("user", user1);
            if (user1.getType().equals("tenant")) {
                return "tenant/main";
            } else {
                return "admin/main1";
            }
        } else {
            String error = "error";
            model.addAttribute("error", error);
            return "login";
        }
    }

    /**
     * 跳转至主页面
     */
    @RequestMapping("toIndex")
    public String toIndex() {
        return "admin/index";
    }
}

