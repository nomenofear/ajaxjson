<%--
  TODO:
  User: 李冠鹏
  Date: 2019/7/24
  Time: 13:52
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="controller.*,javax.servlet.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.xml.ws.Response" %>
<%
    PrintWriter pw = response.getWriter();
    GetHintController gtController = new GetHintController();
    pw.print(gtController.getHint(request.getParameter("relText")));

    // out.print(); out.write()区别。  会被缓存到response，最后一次性给浏览器

%>

