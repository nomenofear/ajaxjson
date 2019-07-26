# 简介
  这是一个用ajax和json实现前后端交互的小项目
  
  1、在index.jsp输入框中输入任意字符串 <br>
  2、调用getHint.jsp，改jsp调用getHintController中的getHint方法，该方法返回一个User对象序列化成的JSON字符串，并由responce对象返回该字符串
  ```java
  public String getHint(String str) {
        User user = new User();
        user.setName("李冠鹏");
        user.setAge(21);
        user.setTel("13000000");
        System.out.println(JSON.toJSONString(user));
        //out.print();
        return JSON.toJSONString(user);
    }
  ```
   3、前端通过js解析json字符串，并展示在页面。
   ```javascript
    function getHint(str){
            var xmlhttp;
            if(str=="")
            {
                document.getElementById("hint").innerHTML="";
                return;
            }
            if (window.XMLHttpRequest)
            {
                // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp=new XMLHttpRequest();
            }
            else
            {
                // IE6, IE5 浏览器执行代码
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    var str1=xmlhttp.responseText;
                    showData(str1);
                }
            }
            xmlhttp.open("POST","getHint.jsp",true);
            xmlhttp.send("relText="+str);
        }
        function showData(jstr) {
            var o=JSON.parse(jstr);
            document.getElementById("hint").innerHTML= jstr;
            document.getElementById("name").innerText=o.name;
            document.getElementById("age").innerText=o.age;
            document.getElementById("tel").innerText=o.tel;
        }
        ```