<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
<%@ include file="model/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title> - 登录</title>
    
    <link href="libs/css/bootstrap.min.css" rel="stylesheet">
    <link href="libs/css/font-awesome.css" rel="stylesheet">
    <link href="libs/css/animate.css" rel="stylesheet">
    <link href="libs/css/style.css" rel="stylesheet">
    <link href="libs/css/login.css" rel="stylesheet">
    
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
        var a=0;
        function changerimg(o) {
			o.src="img?a="+(a++);
		}
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-12">
                <form id="login-form" method="post" action="Operater/login">
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">登录到后台框架</p>
                    
                    <input type="text" id="username" name="nike" class="form-control uname" placeholder="用户名" />
                    <input type="password" id="password" name="password" class="form-control pword m-b" placeholder="密码" />
                    <input type="text"  name="code" class="form-control" style="width:180px;display: inline;" placeholder="验证码" />
                    <img src="/img" onclick="changerimg(this);">
                    
                    <a href="">忘记密码了？</a>
               
                <button class="btn btn-success btn-block" type="submit">登录</button>
                 </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 
            </div>
        </div>
    </div>
   
</body>

</html>
