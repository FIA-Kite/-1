<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../model/list_header.jsp" %>


<body>

<script type="text/javascript">
//var select=${requestScope.select};
//var txt=${requestScope.txt};
$(function(){
	
	$(".selectall").on("click",function(){//全选
		if(event.target.checked)
		$(".chk").prop("checked","checked");
		else
		$(".chk").prop("checked","");
	});
	
	$(".sselect").on("change",function(){		//分类查询
		$(".sinput").css("display","none").prop("disabled","disabled");
		$($(".sinput")[$(".sselect").val()]).css("display","inline").removeAttr("disabled");
	});
	
	var select=$(".sselect").val();
	$(".sinput").css("display","none").prop("disabled","disabled");
	$($(".sinput")[select]).css("display","inline").removeAttr("disabled");
	
});



function fresh() {
	location.href="index";
}
function openwin() {
	show("add",600,650);
}
function edit(id) {
	/* location.href="edit?id="+id; *///跳过弹窗，直接进入页面
	 show("edit?id="+id,600,650); 
}
</script>
	<div class="demoTable">
	
	
<form action="index" method="post">
 <select class="sselect" name="select">
 <option value="0">姓名查询</option>
  <option value="1">状态查询</option>
   <option value="2">性别查询</option>
 </select>
 
  <input name="txt" class="sinput" > 
  <select name="txt" class="inputselect sinput" style="height:30px;display: none;">
			<c:forEach items="${requestScope.opstatus}" var="r" varStatus="v">
				<c:if test="${requestScope.info.status!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.status==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
		</select>
			<select name="txt" class="inputselect sinput" style="height:30px;display: none;">
				<c:forEach items="${requestScope.opsex}" var="r" varStatus="v">			
					<option value="${v.index}">${r}</option>
			</c:forEach>
			</select> 
  
  <button  class="layui-btn" type="submit">查询</button>

<button  class="layui-btn" type="button" onclick="openwin();">新增</button>

</form>
	

	</div>


<div class="layui-form layui-border-box layui-table-view" >
	<div class="layui-table-box">
		<div class="layui-table-body layui-table-main" >
			<table  class="layui-table">
			<thead>
					<tr>
						
						<th></th>
						<th>ID</th>
						<th>用户名</th>
					
						<th>姓名</th>
						<th>性别</th>
						<th>TEL</th>
						<th>状态</th>
						<th>权限</th>
						<th>备注</th>
						<th>编辑</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach items="${requestScope.list}" var="r" >
					<tr class="text-c">
				
				<th></th>
				<td>${r.id}</td>
				<td>${r.nike}</td>
				
				<td>${r.name}</td>
				<td>${requestScope.opsex[r.sex]}</td>
				<td>${r.tel}</td>
				<td>${requestScope.opstatus[r.status]}</td>
				<td>${requestScope.oppower[r.power]}</td>
				<td>${r.comments}</td>
				<td>	<a href="javascript:edit(${r.id});">修改信息</a>
					</td>
					</tr>
			</c:forEach>
			
				</tbody>
			</table>
		</div>
	</div>
	
	
	
</div>

</body>
</html>
