/**
 * ajax获取省市级联菜单
 */

//由于jsp中${pageContext.request.contextPath}在js中无法识别，所以使用js来获取访问的路径
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

// 声明全局变量pageContext
var pageContext = getRealPath();

// 初始化省市级联菜单
$(function(){
	getProvince();
})

// 获取省份的ajax请求
function getProvince() {	
	
	var pId = $("select[name=province]").val();

	$.ajax({
				url : pageContext + "/region/province.action",
				method : "post",
				dataType : "json",
				async : true,
				success : function(data) {					
					var provinceList = data.provinces;					
					for (var i = 0; i < provinceList.length; i++) {							
						// 浏览器控制台打印
//						console.log(provinceList[i].id + "、"
//								+ provinceList[i].name);
						var option = "<option value=\"" + provinceList[i].id + "\"";
						option += ">" + provinceList[i].name + "</option>"; // 动态添加数据							
						$("select[name=province]").append(option);
					}
				},
				error : function() {
					alert("对不起，省份出错啦！");
				}
			});
}
// 获取市的ajax请求
function getCity(id) {
	document.getElementById("city").length=1;	
	document.getElementById("area").length=1;	
	// alert("获取城市===="+id);
	// 将省份信息添加到address
	var add = document.getElementById("address").value;	
	add = "" + id;
	$("#address").val(add);	
	$.ajax({
		url : pageContext + "/region/city.action",
		data : {
			"id" : id
		},
		method : "post",
		dataType : "json",
		async : true,
		success : function(data) {
			var cityList = data.cities;
			for (var i = 0; i < cityList.length; i++) {
//				console.log(cityList[i].id + "、" + cityList[i].name);
				var option = "<option value=\"" + cityList[i].id + "\"";
				option += ">" + cityList[i].name + "</option>"; // 动态添加数据				
				$("select[name=city]").append(option);
			}
		},
		error : function() {
			alert("对不起，城市出错啦！");
		}
	});
}

function getArea(id) {
	document.getElementById("area").length=1;
	// alert("获取县区===="+id);
	// 将省份信息添加到address
	var add = document.getElementById("address").value;	
	add = add + "#" + id;
	$("#address").val(add);
	$.ajax({
		url : pageContext + "/region/area.action",
		data : {
			"id" : id
		},
		method : "post",
		dataType : "json",
		async : true,
		success : function(data) {
			var areaList = data.areas;
			for (var i = 0; i < areaList.length; i++) {
//				console.log(areaList[i].id + "、" + areaList[i].name);
				var option = "<option value=\"" + areaList[i].id +"#code" + areaList[i].code + "\"";
				option += ">" + areaList[i].name + "</option>"; // 动态添加数据
				$("select[name=area]").append(option);
			}
		},
		error : function() {
			alert("对不起，县、区出错啦！");
		}
	});
}
function getAddress(id){
	var province = document.getElementById("province").value;
	var provinceText = document.getElementById("province").options[document.getElementById("province").selectedIndex].text;
	var cityText = document.getElementById("city").options[document.getElementById("city").selectedIndex].text;
	var areaText = document.getElementById("area").options[document.getElementById("area").selectedIndex].text;
	var add = document.getElementById("address").value;	
	add = add + "#" + id + "#" + provinceText + cityText + areaText;	
	$("#address").val(add);	
} 