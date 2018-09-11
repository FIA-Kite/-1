<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../model/list_header.jsp" %>


<body>

<script type="text/javascript">
//var select=${requestScope.select};
//var txt=${requestScope.txt};
$(function(){
	
	
	
	$(".sselect").on("change",function(){		//分类查询
		$(".sinput").css("display","none").prop("disabled","disabled");
		$($(".sinput")[$(".sselect").val()]).css("display","inline").removeAttr("disabled");
	});
	
	var select=$(".sselect").val();
	$(".sinput").css("display","none").prop("disabled","disabled");
	$($(".sinput")[select]).css("display","inline").removeAttr("disabled");
	
});

function delall(){
	if(confirm("确认删除")){
		var ids=[];
			$(".chk").each(function(){
				if( $(this).prop("checked")){
					ids.push($(this).attr("myid"));
				}
			});	
		if(ids.length==0){
			alert("请选择行");
			return ;
		}
		location.href="deleteall?ids="+ids;
	}
}

function del(id){
	if(confirm("确认删除")){
		location.href="delete?id="+id;
	}
	
}

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
 <option value="0">名称</option>
  <option value="1">上级ID</option>
  
 </select>
 
  <input name="txt" class="sinput" > 
  <select name="txt" class="inputselect sinput" style="height:30px;display: none;">
			<c:forEach items="${requestScope.pstatus}" var="r" varStatus="v">
				<c:if test="${requestScope.info.status!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.status==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
		</select>
			<select name="txt" class="inputselect sinput" style="height:30px;display: none;">
				<c:forEach items="${requestScope.ptype_id}" var="r" varStatus="v">			
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
						<th>名字</th>
						<th>上级</th>
						<th>备注</th>
						<th>编辑</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach items="${requestScope.list}" var="r" >
					<tr class="text-c">
				
				<th></th>
				<td>${r.id}</td>
				<td>${r.name}</td>
				<td>${r.parentid}</td>
				<td>${r.comments}</td>
				<td>	<a href="javascript:edit(${r.id});">修改</a>
						<a href="javascript:del(${r.id});">删除</a>
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
