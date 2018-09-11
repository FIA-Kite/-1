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
function openwin(parentid) {
	show("add?parentid="+parentid,400,250);
}
function edit(id) {
	alert(id)
	/* location.href="edit?id="+id; *///跳过弹窗，直接进入页面
	 show("edit?id="+id,400,250); 
}
</script>
<%-- 	<div class="demoTable">
	
	
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
	

	</div> --%>


<div class="layui-form layui-border-box layui-table-view" >
	<div class="layui-table-box">
		<div class="layui-table-body layui-table-main" >
			<table  class="layui-table">
			<thead>
			<label>${requestScope.path}</label>  <!-- //???? -->
			<tr>
				<th scope="col" colspan="10">类型列表</th>
				<a href="javascript:;" style="float:right" class="btn btn-primary radius">
				<button  class="layui-btn" type="button" onclick="openwin(${requestScope.parentid});">新增</button>
			</tr>
			<tr class="text-c">
				
				<th width="150">类型</th>
				<th width="100">类型上级</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${requestScope.list}" var="l" varStatus="ls">
			<tr class="text-c">
				<td>${l.name}</td>
				<td>${l.parent_name}</td>
				<td>
				<span class="l"><a href="javascript:;" onclick="edit(${l.id});" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6df;</i> 编辑</a>
				
				
				 <a href="type-list?parentid=${l.id}"  class="btn btn-primary radius">
				 <i class="Hui-iconfont">&#xe600;</i> 下级</a></span> 
				 </td>
				</tr>
			</c:forEach>	
				</tbody>
			</table>
		</div>
	</div>
	
	
</div>
<script type="text/javascript">
var parentid=${requestScope.parentid};
/*商品类型-增加*/
function type_add(title,url,w,h){
	layer_show(title,url+"?parentid="+parentid,w,h);
}

/*商品类型-编辑*/
function type_edit(title,url,id,w,h){
	layer_show(title,url+"?id="+id,w,h);
}
/* ajax传递数据 */
function fresh() {
			location.href="../Type/type-list";
		}
</script>
</body>

</html>
