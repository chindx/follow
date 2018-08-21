<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/reg.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/headbott.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ly-list.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reg.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript"
		src="${pageContext.request.contextPath}/js/address.js"></script>
<title>项目信息</title>
</head>
<body>
<!--上部导航栏开始-->
<%@include file="/pages/frontheader.jsp" %>
<!--中间核心-->
<div class="product">
    <!--头上表格-->
    <div class="product-table">
        <div class="product-left">
            <table class="table table-bordered">
				<tr class="text-center">
					<td class="title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_basic.action">基本信息</a></td>
					<td class="active title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_info.action">项目信息</a></td>
					<td class="title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_detail.action">详细描述</a></td>
					<td class="title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_repay.action">回报设置</a></td>
				</tr>
			</table>
        </div>
        <div class="product-right">
            <table class="table table-bordered">
                <tr class="text-center">
                    <td class="title-td">预览</td>
                </tr>
            </table>
        </div>
    </div>
    <!--下部foem表单-->
    <div class="product-form">
        <!--上标题-->
        <div class="product-title">
            <div class="my-h4">
                <h4>创建你的项目信息</h4>
            </div>
            <div class="btn-save">
                <button id="saveDraft" onClick="saveDraft()" class="btn btn-default">保存草稿</button>
            </div>

        </div>
        <div class="clear"></div>
        <hr>
        <!--表单-->           
        <form id="ajaxbasic" action="#" method="post" enctype="multipart/form-data">
			<div class="my-form">
			    <input type="hidden" name="userId" value="${user.id}"/>
			    <input type="hidden" name="psId" value = "${projects.id}"/>			   
                <div class="product-info-input">
                <b>设置封面：</b>
                <input type="file" name="file">                    
                </div>
                <div class="product-info-input"><b>项目标题：</b><input class="text" type="text" name="name" id="name" placeholder="给自己的项目起个漂亮的名字吧"></div>
                <div class="product-info-input"><b>筹款目的：</b><textarea rows="2" name="goal" id="goal" placeholder="一句话介绍一下你的项目吧"></textarea></div>               
                  <!-- 项目地点 -->
                  <div class="product-info-select">
                  <input type="hidden" name="address" id="address" value=""/>
                    <div class="product-info-text"><b>项目地点：</b></div>
                    <div class="product-info-select1">
                        <select class="info-select1" name="province" id="province" onchange="getCity(this.value)">
                            <option>请选择</option>
                        </select>
                    </div>
                    <div class="product-info-select2">
                        <select class="info-select2" name="city" id="city" onchange="getArea(this.value)">
                            <option>请选择</option>
                        </select>
                    </div>
                    <div class="product-info-select3">
                        <select class="info-select3" name="area" id="area" onchange="getAddress(this.value)">
                            <option>请选择</option>
                        </select>
                    </div>
                </div>
                <div class="product-info-input"><b>筹资金额：</b><input class="text" type="text" name="money" id="money" placeholder="输入你需要的金额，最少500元">元</div>
                <div class="product-info-input"><b>筹资天数：</b><input class="text" type="text" name="days" id="days" placeholder="">天</div>
            </div>
        </form>
    </div>
</div>
<%@include file="/pages/frontfoot.jsp"%>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/jquery1.12.4.min.js"></script>
<script type="text/javascript">
	function saveDraft() {			
		var form = new FormData(document.getElementById("ajaxbasic"));		
		$.ajax({			
			url : "${pageContext.request.contextPath}/projects/saveDraft.action",
			method : "post",
			dataType: "json",			
			data: form,
			/* async: true, */
			processData: false,
			contentType: false,
			success : function(data){
				alert("保存草稿成功" + data.projects);
			},
			error : function(){
				alert("保存草稿失败!!!");
			}
		})	
	}
</script>
</body>
</html>