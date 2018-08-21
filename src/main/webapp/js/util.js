/* 本函数主要功能是根据给定的id取得指定的元素 */
function ele(id) {
	return document.getElementById(id);
}
/**
 *  通过此操作可以实现事件的绑定操作处理
 *  id: 要进行绑定事件的组件ID
 *  event: 描述的是事件的类型
 *  func: 处理的匿名函数
*/
function bind(id, event, func) {
	ele(id).addEventListener(event, func, false) ;
}

/**
  * 实现一个指定id元素是否为空的验证
*/
function validateEmpty(id) {
	var elementObj = ele(id);
	if( elementObj != null) {  // 表示取得了元素
		if( elementObj.value == "" ) { // 验证错误
			elementObj.className = "wrong" ;  // 错误的样式
			return false;
		}else {
			elementObj.className = "right" ; // 正确的样式
			return true;
		}
	}
	return false;  // 没有找到该元素
}

/**
  * 根据给出的正则表达式对内容进行验证处理
  * id: 要验证的元素ID
  * regex: 使用的正则表达式
*/
function validateRegex(id, regex) {
	if( validateEmpty(id) ) {  // 先验证是否为空，如果为true，表明元素里面有值
		var elementObj = ele(id);
		if( regex.test(elementObj.value) ) {  // 验证元素对象的值符合要求
			elementObj.className = "right" ;
			return true;
		}else {
			elementObj.className = "wrong" ;
			return false;
		}
	}
}

/**
  * 判断给定的两个id元素内容是否相同
  * srcId:  要判断的一个元素，如果密码相同，则重复密码为发起元素
  * desId:  要比较的内容，如果密码验证，则为密码的内容
*/
function validateRepeat(srcId, desId) {
	if(validateEmpty(srcId) & validateEmpty(desId)) {
		var srcObj = ele(srcId);
		var desObj = ele(desId);

		if( srcObj.value == desObj.value) {
			srcObj.className = "right" ;
			return true;
		}else {
			srcObj.className = "wrong" ;
			return false;
		}
	}
	return false;
}
function validateEqual(optionObj, keyword) {	
	for(i = 0;i<optionObj.length;i++){
		if(keyword.equalTo(optionObj[i].value)){
		optionObj.className = "wrong";
		return false;
	    }else{
		optionObj.className = "right";
		return true;
	    }
	}
}