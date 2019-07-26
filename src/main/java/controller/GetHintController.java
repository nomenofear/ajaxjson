package controller;

import bean.User;
import com.alibaba.fastjson.JSON;
import javax.servlet.*;

public class GetHintController {

    public String getHint(String str) {
        User user = new User();
        user.setName("李冠鹏");
        user.setAge(21);
        user.setTel("13000000");
        System.out.println(JSON.toJSONString(user));
        //out.print();
        return JSON.toJSONString(user);
    }

}
