/**
 * 使用ajax获取公益类型
 */

// 由于${pageContext.request.contextPath}只能在jsp中识别，js中不能识别。
function getRealPath(){
	//获取当前网址，如： http://localhost:8083/myproj/view/ahha.jsp
	var curWwwPath=window.document.location.href;
	//获取主机地址之后的目录，如： myproj/view/ahha.jsp
	var pathName=window.document.location.pathname;
	var pos=curWwwPath.indexOf(pathName);
	//获取主机地址，如： http://localhost:8080
	var localhostPaht=curWwwPath.substring(0,pos);
	//获取带"/"的项目名，如：/ahha
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	 
	//得到了 服务器名称和项目名称
	var realPath=localhostPaht+projectName;
	return realPath;
}

// 声明全局变量：获取访问路径
var pageContext = getRealPath();

// 页面加载时进行初始化
$(function() {
	getProjectType();
})

function getProjectType() {
	$.ajax({
		url : pageContext + "/projectsType/findTypes.action",
		method : "post",
		dataType : "json", // xml text json
		async : true,
		success : function(data) {
			var psTypeList = data.allpsTypes;
			for (var i = 0; i < psTypeList.length; i++) { // <option>公益</option>
				var option = "<option value=\"" + psTypeList[i].id + "\"";
				option += ">" + psTypeList[i].name + "</option>"; // 动态添加数据
				
				$("select[id=psType]").append(option);

			}
		},
		error : function() {
			alert("对不起，公益类型出错啦！");
		}
	});
}

