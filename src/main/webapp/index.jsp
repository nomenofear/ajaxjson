<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
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

    </script>
</head>
<body>
<h2>Hello World!</h2>
<h2>请输入：</h2>
<input type="text" id="relText">
<input type="button" value="获取" onclick="getHint(document.getElementById('relText').value)">
<h4 id="hint"></h4>
<table>
    <tr>
        <td>姓名</td>
        <td id="name"></td>
    </tr>
    <tr>
        <td>年龄</td>
        <td id="age"></td>
    </tr>
    <tr>
        <td>电话</td>
        <td id="tel"></td>
    </tr>
</table>
</body>
</html>
