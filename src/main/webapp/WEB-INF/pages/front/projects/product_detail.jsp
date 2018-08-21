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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css" type="text/css"/>
<title>详细描述</title>
</head>
<body>
<!--上部导航栏开始-->
<%@include file="/pages/frontheader.jsp" %>
<div class="product">
    <!--头上表格-->
    <div class="product-table">
        <div class="product-left">
            <table class="table table-bordered">
				<tr class="text-center">
					<td class="title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_basic.action">基本信息</a></td>
					<td class="title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_info.action">项目信息</a></td>
					<td class="active title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_detail.action">详细描述</a></td>
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
                <h4>描述你的项目详情</h4>
            </div>
            <div class="btn-save">
               <button id="saveDraft" onClick="saveDraft()" class="btn btn-default">保存草稿</button>
            </div>

        </div>
        <div class="clear"></div>
        <hr>
        <!--表单-->
        <!--宣传视频-->
        <div>
            <form>
                <div class="detail"><b>宣传视频：</b><input class="detail-input" name="video" id="video" placeholder="填写视频在线播放地址"></div>
            </form>
        </div>
        <div class="clear"></div>
        <hr>
        <!--编辑信息表单-->
        <form id="ajaxbasic" action="${pageContext.request.contextPath}/projects/saveDraft.action" method="post">
			<div class="my-form">
			    <input type="hidden" name="userId" value="${user.id}"/>
			    <input type="hidden" name="psId" value = "${projects.id}"/>
                <div class="detail"><b>项目故事：</b><div><textarea rows="2"  name="story" id="story"placeholder="一句话介绍一下你的项目吧"></textarea></div></div>
                <div class="detail"><b>更多支持：</b><div><textarea rows="2" name="support" id="support" placeholder="一句话介绍一下你的项目吧"></textarea></div></div>
                <div class="detail"><b>提供回报：</b><div><textarea rows="2" name="repay" id="repay" placeholder="一句话介绍一下你的项目吧"></textarea></div></div>
                <div class="detail"><b>关于我：</b><div><textarea rows="2" name="aboutMe" id="aboutMe" placeholder="一句话介绍一下你的项目吧"></textarea></div></div>
            </div>
        </form>
    </div>
</div>
<!-- feet -->
<%@ include file="/pages/frontfoot.jsp" %>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/jquery1.12.4.min.js"></script>
<script type="text/javascript">

	function saveDraft() {
		$.ajax({
			url : "${pageContext.request.contextPath}/projects/saveDraft.action",
			method : "post",			
			data:$("#ajaxbasic").serialize(),
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