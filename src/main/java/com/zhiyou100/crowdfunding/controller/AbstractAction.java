package com.zhiyou100.crowdfunding.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou100.crowdfunding.utils.UploadFileUtil;

public abstract class AbstractAction {	
	
	/**
	 * 专门负责数据的输出，可以输出各种数据，主要用于Ajax处理上
	 * 
	 * @param response
	 * @param value
	 */
	public void print(HttpServletResponse response, Object value) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(value);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
/**
	/**
	 * 生成图片名称
	 * 
	 * @param photo
	 * @return
	 */
	public String createFileName(MultipartFile photo) {
		if (photo.isEmpty()) { // 没有文件上传
			return "nophoto.gif"; // 默认没有文件
		} else { // 需要自己生成一个文件
			return UploadFileUtil.createFileName(photo.getContentType());
		}
	}

	/**
	 * 进行文件的保存处理
	 * 
	 * @param photo
	 */
	public boolean saveFile(MultipartFile photo, String fileName, HttpServletRequest request) { // 保存上传的图片名称
		if (!photo.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(this.getFileUploadDir()) + fileName;
			try {
				return UploadFileUtil.save(photo.getInputStream(), new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
		} else {
			return false;
		}
	}

	/**
	 * 保存上传文件路径
	 * 
	 * @return
	 */
	public abstract String getFileUploadDir();
	
	@InitBinder
	public void initBinder(WebDataBinder binder) { // 方法名称自己随便写
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 本方法的处理指的是追加有一个自定义的转换编辑器，如果遇见的操作目标类型为java.util.Date类
		// 则使用定义好的SimpleDateFormat类来进行格式化处理，并且允许此参数的内容为空
		binder.registerCustomEditor(java.util.Date.class, "time", new CustomDateEditor(date, true));
		binder.registerCustomEditor(java.util.Date.class, "createTime", new CustomDateEditor(datetime, true));
		binder.registerCustomEditor(java.util.Date.class, "updateTime", new CustomDateEditor(datetime, true));
	}
}

