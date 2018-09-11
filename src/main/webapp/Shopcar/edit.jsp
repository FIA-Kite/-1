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
<script type="text/javascript" charset="utf-8" src="../utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../utf8-jsp/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../utf8-jsp/lang/zh-cn/zh-cn.js"></script>

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


		
	<!-- 判断进行查询还是修改 -->
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
		<label class="inputtext">商品类型:</label>  
		<select name="type_id" class="inputselect">
			<c:forEach items="${requestScope.ptype_id}" var="r" varStatus="v">
				<c:if test="${requestScope.info.type_id!=v.index}">
					<option value=${v.index}>${r}</option>
				</c:if>
				<c:if test="${requestScope.info.type_id==v.index}">
					<option selected="selected" value=${v.index}>${r}</option>
				</c:if>
			</c:forEach>
		</select>
		</span>

		<span class="inputspan"> 
		<label class="inputtext">商品全名：</label> 
		 <input class="inputinput" name="fullname" value="${requestScope.info.fullname}" >
		</span>


		<span class="inputspan"> 
		<label class="inputtext">活动:</label> 
		 <input class="inputinput" name="activity" value="${requestScope.info.activity}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">提示信息:</label> 
		 <input class="inputinput" name="tip" value="${requestScope.info.tip}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">促销信息:</label> 
		 <input class="inputinput" name="sale" value="${requestScope.info.sale}" >
		</span>
		
		<%-- <span class="inputspan"> 
		<label class="inputtext">详情:</label> 
		 <input class="inputinput" name="info" value="${requestScope.info.info}" >
		</span> --%>
		 <!-- 加载编辑器的容器 -->
    <script id="container" name="info" type="text/plain">
        ${requestScope.info.info}
    </script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>
		
		
		
		<span class="inputspan"> 
		<label class="inputtext">原价格：</label> 
		 <input class="inputinput" name="price" value="${requestScope.info.price}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">现价格：</label> 
		 <input class="inputinput" name="nowprice" value="${requestScope.info.nowprice}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">销售数量：</label> 
		 <input class="inputinput" name="salecount" value="${requestScope.info.salecount}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">收藏人数：</label> 
		 <input class="inputinput" name="collectcount" value="${requestScope.info.collectcount}" >
		</span>
		
		<span class="inputspan"> 	
		<label class="inputtext">优先级:</label>  
		<select name="priority" class="inputselect">
			<c:forEach items="${requestScope.ppriority}" var="r" varStatus="v">
				<c:if test="${requestScope.info.priority!=v.index}">
					<option value=${v.index}>${r}</option>
				</c:if>
				<c:if test="${requestScope.info.priority==v.index}">
					<option selected="selected" value=${v.index}>${r}</option>
				</c:if>
			</c:forEach>
		</select>
		</span>
		
		<div class="layui-form-item">
   			 <label class="layui-form-label">图片预览:</label>
    		<div class="layui-input-inline">
       		<div class="picList" name="pics"  width="500"  height="400" rows="3" cols="5" >
				<c:forEach items="${requestScope.info.piclist}" var="p">
				<item url="${p}" ></item>
				</c:forEach>
	   </div>
    </div>
  </div>
		
		
		
		<%-- <span class="inputspan"> 
		<label class="inputtext">图片：</label> 
		 <input class="inputinput" name="pics" value="${requestScope.info.pics}" >
		</span> --%>
		
		
		<span class="inputspan"> 	
		<label class="inputtext">状态:</label>  
		<select name="status" class="inputselect">
			<c:forEach items="${requestScope.pstatus}" var="r" varStatus="v">
				<c:if test="${requestScope.info.status!=v.index}">
					<option value=${v.index}>${r}</option>
				</c:if>
				<c:if test="${requestScope.info.status==v.index}">
					<option selected="selected" value=${v.index}>${r}</option>
				</c:if>
			</c:forEach>
		</select>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">备注</label> 
		 <input class="inputinput" name="comments" value="${requestScope.info.comments}" >
		</span>
		
		
		<!-- <span class="inputspan"> //上传照片
			<div class="picList" name="pics"  width="300"  height="200+" rows="2" cols="5" >
			</div>
		</span> -->
		</div>
		
		
		<div class="inputbtpanel " style="margin-top: 100px;">
		<button class="seachbt1" type="button"  onclick="save();">保存</button>
		</div>
	</form>


</body>
</html>
