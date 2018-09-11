<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../libs/css/edit.css">

<script type="text/javascript" src="../fileupload/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../fileupload/css/font-awesome.min.css">
<script type="text/javascript" src="../fileupload/js/piclist.js"></script>


<script type="text/javascript">

function  save() {
	$.post($(".f1").attr("action"),$(".f1").serialize(),function(json){
		if(json.status>0){
			parent.fresh();
			var index=parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}else{
			alert(json.text);
		}
	},"json");
}
</script>
</head>
<body>


		
	
		<c:if test="${requestScope.info==null}">
		<form class="f1" action="insert" method="post">
		</c:if>
		<c:if test="${requestScope.info!=null}">
		<form class="f1" action="update" method="post">
		<input type="hidden" name="id" value="${requestScope.info.id}">
		</c:if>
		
<div class="inputview">

		<%-- <span class="inputspan"> 
		<label class="inputtext">ID:</label> 
		 <input class="inputinput" name="id" value="${requestScope.info.id}" >
		</span> --%>

		<span class="inputspan"> 
		<label class="inputtext">用户名:</label> 
		 <input class="inputinput" name="nike" value="${requestScope.info.nike}" >
		</span>

		<span class="inputspan"> 
		<label class="inputtext">密码：</label> 
		 <input class="inputinput" name="password" value="${requestScope.info.password}" >
		</span>


		<span class="inputspan"> 
		<label class="inputtext">姓名:</label> 
		 <input class="inputinput" name="name" value="${requestScope.info.name}" >
		</span>
		
		
		<span class="inputspan"> 	
		<label class="inputtext">性别:</label>  
		<select name="sex" class="inputselect">
			<c:forEach items="${requestScope.opsex}" var="r" varStatus="v">
				<c:if test="${requestScope.info.sex!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.sex==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
		</select>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">TEL：</label> 
		 <input class="inputinput" name="tel" value="${requestScope.info.tel}" >
		</span>
		
		
		<span class="inputspan"> 	
		<label class="inputtext">状态:</label>  
		<select name="status" class="inputselect">
			<c:forEach items="${requestScope.opstatus}" var="r" varStatus="v">
				<c:if test="${requestScope.info.status!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.status==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
		</select>
		</span>
		
		<span class="inputspan"> 	
		<label class="inputtext">权限:</label>  
		<select name="power" class="inputselect">
			<c:forEach items="${requestScope.oppower}" var="r" varStatus="v">
				<c:if test="${requestScope.info.power!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.power==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
		</select>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">备注</label> 
		 <input class="inputinput" name="comments" value="${requestScope.info.comments}" >
		</span>
		
		
		<div class="inputbtpanel " style="margin-top: 100px;">
		<button class="seachbt1" type="button"  onclick="save();">保存</button>
		</div>
	</form>


</body>
</html>
