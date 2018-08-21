<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	 <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/reg.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/headbott.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ly-list.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reg.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/back.css" type="text/css"/>
<title>回报设置</title>
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
					<td class="title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_detail.action">详细描述</a></td>
					<td class="active title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_repay.action">回报设置</a></td>
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
    <!--下部form表单-->
    <div class="product-form">
        <!--上标题-->
        <div class="product-title">
            <div class="my-h4">
                <h4>设置你的回报信息</h4>
            </div>
            <div class="btn-save">
                <button id="saveDraft" class="btn btn-default" onClick="saveDraft()">保存草稿</button>
            </div>

        </div>
        <div class="clear"></div>
        <hr>
        <!--描述项目-->
        <div class="product-title">
            <div class="my-h4">
                <h4><b>回报</b></h4>
            </div>
        </div>
        <div class="clear"></div>
        <hr>
        <!--编辑信息表单-->
        <form id="ajaxbasic" action="${pageContext.request.contextPath}/repay/saveDraft.action" method="post">
			<div class="my-form">
			    <input type="hidden" name="userId" value="${user.id}"/>
			    <input type="hidden" name="psId" value = "${projects.id}"/>
                <div class="back">
                    <b>回报类型：</b>
                    <label class="radio-inline">
                        <input type="radio" name="type" id="optionsRadios3" value="1" checked> <b>实物回报(回报需邮寄)</b>
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="type" id="optionsRadios4"  value="2"> <b>虚拟回报(回报无需邮寄)</b>
                    </label>
                </div>
                <div class="back"><b>支持金额：</b><input class="input-mon" name="repayMoney" id="repayMoney" placeholder="输入需要用户支持的金额">元</div>
                <div class="back"><b>具体规则：</b>每 <input class="input-per" name="rule" id="rule" placeholder="此项必填"> 支持者抽出1名中奖者</div>
                <div class="back"><b>回报内容：</b><div><textarea rows="2" name="content" id="content" placeholder="一句话介绍一下你的项目吧"></textarea></div></div>
                <div class="back"><b>人数上限：</b><input class="input-num" name="number" id="number" placeholder="0">个<small>"0"为不需要名额</small></div>
                <div class="back"><b>回报时间：</b><input class="input-num" name="time" id="time" placeholder="0">天<small>"0"为开奖后立即发送</small></div>
                <div class="clear" id="clear"></div>
                <hr>
                <div class="text-center"><button class="btn btn-primary">删除</button><button class="btn">保存</button></div><br>
            </div>
        </form>
        <div class="text-center"><a  href="#">+继续添加新的回报</a></div>
    </div>
</div>
<%@include file="/pages/frontfoot.jsp" %>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/jquery1.12.4.min.js"></script>
<script type="text/javascript">
	function saveDraft() {
		$.ajax({
			url : "${pageContext.request.contextPath}/repay/saveDraft.action",
			method : "post",
			dataType:"json",
			data:$("#ajaxbasic").serialize(),
			success : function(data){
				alert("保存草稿成功" + data);
			},
			error : function(){
				alert("保存草稿失败 ");
			}
		})
	}
</script>
</body>
</html>