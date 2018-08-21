<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Keywords" content="关键词,关键词">
<meta name="description" content="">
<title>首页</title>

<link rel="stylesheet" href="<%=url%>css/base.css" type="text/css" />
<link rel="stylesheet" href="<%=url%>css/headbott.css" type="text/css" />
<link rel="stylesheet" href="<%=url%>css/index.css" type="text/css" />
<link rel="stylesheet" href="<%=url%>css/swiper.min.css" />
</head>
<body>	
	<%@include file="/pages/frontheader.jsp" %>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="<%=url%>images/1525661829.jpg">
			</div>
			<div class="swiper-slide">
				<img src="<%=url%>images/1525661991.png">
			</div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Arrows -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>



	<div class="content">

		<!--<div class="index-mrjxtit">每日精选</div>-->
		<div class="index-mrjx">
			<div class="index-mrjx_left">
				编辑推荐
				<p>
					<a href="">更多<br> 项目
					</a>
				</p>
			</div>
			<div class="index-mrjx_min">
				<a href=""><img src="<%=url%>images/pruduct1_32.jpg" alt="" /></a>
			</div>
			<div class="index-mrjx_right">
				<div class="index-pruduct">
					<ul>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>93.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div class="index-mrjx_botto">
				<div class="index-pruduct">
					<ul>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="ggt2">
			<a href=""><img src="<%=url%>images/ggt2_39.jpg" alt="" /></a>
		</div>
		<div class="index-mrjx index-mrjx2">
			<style type="text/css">
.index-jjkstit {
	
}
</style>
			<div class="index-mrjx_left">
				教育助学
				<p>
					<a href="">更多<br> 项目
					</a>
				</p>
			</div>
			<div class="index-mrjx_min">
				<a href=""><img src="<%=url%>images/pruduct1_32.jpg" alt="" /></a>
			</div>
			<div class="index-mrjx_right">
				<div class="index-pruduct">
					<ul>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div class="index-mrjx_botto">
				<div class="index-pruduct">
					<ul>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="index-plidiv1">
								<a href=""><img src="<%=url%>images/pruduct2_34.jpg" width="237px"
									height="155px" alt="" /></a>
								<div class="index-p_dkz">等款中</div>
							</div>
							<p>
								<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
							</p>
							<div class="index-pli-bot">
								<dl>
									<dt>133.3</dt>
									<dd>达成率</dd>
								</dl>
								<dl>
									<dt>88888.3</dt>
									<dd>已筹金额</dd>
								</dl>
								<dl>
									<dt>8515</dt>
									<dd>支持人数</dd>
								</dl>
							</div>
						</li>

					</ul>
				</div>
			</div>
		</div>


		<div class="index-jjks">

			<div class="index-jjkstit">即将开始</div>
			<div class="index-jjkscon">
				<ul>
					<li>
						<div class="index-jjkscon1">
							<a href=""><img src="<%=url%>images/producc_47.jpg" width="238"
								height="155" alt="" /></a>
							<div class="index-j_dkz">预热中</div>
						</div>
						<div>
							<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
						</div>
						<div>
							<i>目标金额：<span>50000.00</span></i><b>上线日期<span>06/03</span></b>
						</div>
					</li>
					<li>
						<div class="index-jjkscon1">
							<a href=""><img src="<%=url%>images/producc_47.jpg" width="238"
								height="155" alt="" /></a>
							<div class="index-j_dkz">预热中</div>
						</div>
						<div>
							<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
						</div>
						<div>
							<i>目标金额：<span>50000.00</span></i><b>上线日期<span>06/03</span></b>
						</div>
					</li>
					<li>
						<div class="index-jjkscon1">
							<a href=""><img src="<%=url%>images/producc_47.jpg" width="238"
								height="155" alt="" /></a>
							<div class="index-j_dkz">预热中</div>
						</div>
						<div>
							<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
						</div>
						<div>
							<i>目标金额：<span>50000.00</span></i><b>上线日期<span>06/03</span></b>
						</div>
					</li>
					<li>
						<div class="index-jjkscon1">
							<a href=""><img src="<%=url%>images/producc_47.jpg" width="238"
								height="155" alt="" /></a>
							<div class="index-j_dkz">预热中</div>
						</div>
						<div>
							<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
						</div>
						<div>
							<i>目标金额：<span>50000.00</span></i><b>上线日期<span>06/03</span></b>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="ggt2 ggt3">
			<a href=""><img src="<%=url%>images/ggt2_39.jpg" alt="" /></a>
		</div>
		<div class="index-jjks">

			<div class="index-jjkstit">成功案例</div>
			<div class="index-jjkscon">
				<ul>
					<li>
						<div class="index-jjkscon1">
							<a href=""><img src="<%=url%>images/producc_47.jpg" width="238"
								height="155" alt="" /></a>
							<div class="index-j_dkz">预热中</div>
						</div>
						<div>
							<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
						</div>
						<div>
							<i>已获得：<span>50000.00</span></i><b>支持人数<span>5888</span></b>
						</div>
					</li>
					<li>
						<div class="index-jjkscon1">
							<a href=""><img src="<%=url%>images/producc_47.jpg" width="238"
								height="155" alt="" /></a>
							<div class="index-j_dkz">预热中</div>
						</div>
						<div>
							<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
						</div>
						<div>
							<i>已获得：<span>50000.00</span></i><b>支持人数<span>5888</span></b>
						</div>
					</li>
					<li>
						<div class="index-jjkscon1">
							<a href=""><img src="<%=url%>images/producc_47.jpg" width="238"
								height="155" alt="" /></a>
							<div class="index-j_dkz">预热中</div>
						</div>
						<div>
							<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
						</div>
						<div>
							<i>已获得：<span>50000.00</span></i><b>支持人数<span>5888</span></b>
						</div>
					</li>
					<li>
						<div class="index-jjkscon1">
							<a href=""><img src="<%=url%>images/producc_47.jpg" width="238"
								height="155" alt="" /></a>
							<div class="index-j_dkz">预热中</div>
						</div>
						<div>
							<a href="">NGDS新游戏手柄 手机一秒变游戏机</a>
						</div>
						<div>
							<i>已获得：<span>50000.00</span></i><b>支持人数<span>5888</span></b>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="ggt2 ggt3">
			<a href=""><img src="<%=url%>images/ggt2_39.jpg" alt="" /></a>
		</div>
		<!--
<div class="index-dxmgg">
    <div class="index-jjkstit index-jjkstit2">大项目公布区<span>新闻资讯</span></span></div>
    <div class="index-dxmggcon">

        <div class="index-dxmggcon1">
<ul>
    <li class="cur"><b>1</b> <span>六小子馆<i>289</i>人支持</span><a></a></li>
    <li><b>2</b> <span>六小子馆<i>289</i>人支持</span><a></a></li>
    <li><b>3</b> <span>六小子馆<i>289</i>人支持</span><a></a></li>
    <li><b>4</b> <span>六小子馆<i>289</i>人支持</span><s></s></li>
    <li><b>5</b> <span>六小子馆<i>289</i>人支持</span><s></s></li>
</ul>
            <div class="index_tab">
                <dl class="index_tab1">
                    <div class="index_tab1_1">宝贝王YOYO乐园</div>
                    <div class="index_tab1_2">目前众筹累计资金</div>
                    <div class="index_tab1_3">￥3011200.00</div>
                    <div class="index_tab1_4">
                        <div class="loading-bar">
                            <div class="amount blue" style="width:49%">
                                <div class="loaded">
                                    49%

                                </div>
                                <span>49%</span>
                                <div class="lines"></div>
                            </div>
                        </div>
                    </div>
                    <div class="index_tab1_5">
                        <a><i><img src="<%=url%>images/index-tbpu_07.jpg"></i>支持人数<span>63</span></a>
                        <a><i><img src="<%=url%>images/index-tbpu_10.jpg"></i>剩余时间<span>28天</span></a>
                    </div>
                    <div class="index_tab1_6">第三代游乐综合体，让孩子从此不凡</div>
                </dl>
                <dl><div class="index_tab1_1">宝贝王YOYO乐园2</div>
                    <div class="index_tab1_2">目前众筹累计资金</div>
                    <div class="index_tab1_3">￥30112000</div>
                    <div class="index_tab1_4">
                        <div class="loading-bar">
                            <div class="amount blue" style="width:49%">
                                <div class="loaded">
                                    49%

                                </div>
                                <span>49%</span>
                                <div class="lines"></div>
                            </div>
                        </div>
                    </div>
                    <div class="index_tab1_5">
                        <a><i><img src="<%=url%>images/index-tbpu_07.jpg"></i>支持人数<span>63</span></a>
                        <a><i><img src="<%=url%>images/index-tbpu_10.jpg"></i>剩余时间<span>28天</span></a>
                    </div>
                    <div class="index_tab1_6">第三代游乐综合体，让孩子从此不凡</div></dl>
                <dl><div class="index_tab1_1">宝贝王YOYO乐园3</div>
                    <div class="index_tab1_2">目前众筹累计资金</div>
                    <div class="index_tab1_3">￥30112000</div>
                    <div class="index_tab1_4">
                        <div class="loading-bar">
                            <div class="amount blue" style="width:49%">
                                <div class="loaded">
                                    49%

                                </div>
                                <span>49%</span>
                                <div class="lines"></div>
                            </div>
                        </div>
                    </div>
                    <div class="index_tab1_5">
                        <a><i><img src="<%=url%>images/index-tbpu_07.jpg"></i>支持人数<span>63</span></a>
                        <a><i><img src="<%=url%>images/index-tbpu_10.jpg"></i>剩余时间<span>28天</span></a>
                    </div>
                    <div class="index_tab1_6">第三代游乐综合体，让孩子从此不凡</div></dl>
                <dl><div class="index_tab1_1">宝贝王YOYO乐园5</div>
                    <div class="index_tab1_2">目前众筹累计资金</div>
                    <div class="index_tab1_3">￥3200.00</div>
                <div class="index_tab1_4">
                    <div class="loading-bar">
                        <div class="amount blue" style="width:49%">
                            <div class="loaded">
                                49%

                            </div>
                            <span>49%</span>
                            <div class="lines"></div>
                        </div>
                    </div>
                </div>
                    <div class="index_tab1_5">
                        <a><i><img src="<%=url%>images/index-tbpu_07.jpg"></i>支持人数<span>63</span></a>
                        <a><i><img src="<%=url%>images/index-tbpu_10.jpg"></i>剩余时间<span>28天</span></a>
                    </div>
                    <div class="index_tab1_6">第三代游乐综合体，让孩子从此不凡</div></dl>
                <dl><div class="index_tab1_1">宝贝王YOYO乐园5</div>
                    <div class="index_tab1_2">目前众筹累计资金</div>
                    <div class="index_tab1_3">￥3200.00</div>
                <div class="index_tab1_4">
                    <div class="loading-bar">
                        <div class="amount blue" style="width:49%">
                            <div class="loaded">
                                49%

                            </div>
                            <span>49%</span>
                            <div class="lines"></div>
                        </div>
                    </div>
                </div>
                    <div class="index_tab1_5">
                        <a><i><img src="<%=url%>images/index-tbpu_07.jpg"></i>支持人数<span>63</span></a>
                        <a><i><img src="<%=url%>images/index-tbpu_10.jpg"></i>剩余时间<span>28天</span></a>
                    </div>
                    <div class="index_tab1_6">第三代游乐综合体，让孩子从此不凡</div></dl>
            </div>
        </div>

        <div class="index-xxzx">
                <ul>
                    <li><span></span> <a href="">产业发展优势</a></li>
                    <li><span></span> <a href="">直接融资和间接融资</a></li>
                    <li><span></span> <a href="">产业发展优直接融资和势</a></li>
                    <li><span></span> <a href="">产业发展优直接融资和势</a></li>
                    <li><span></span> <a href="">产业发展优势</a></li>
                    <li><span></span> <a href="">产业发展优直接融资和势</a></li>
                    <li><span></span> <a href="">产业发展优势</a></li>
                    <li><span></span> <a href="">产业发展优直接融资和势</a></li>
                </ul>
        </div>
    </div>
    

</div>
<div class="ggt2 ggt4"><a href=""><img src="<%=url%>images/ggt2_39.jpg" alt=""/></a></div>-->
	</div>
<%@include file="/pages/frontfoot.jsp" %>
	<script type="text/javascript" src="<%=url%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=url%>js/swiper.min.js"></script>
	<script>
		var swiper = new Swiper('.swiper-container', {
			slidesPerView : 1,
			spaceBetween : 30,
			centeredSlides : true,
			loop : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		});
	</script>

</body>
</html>