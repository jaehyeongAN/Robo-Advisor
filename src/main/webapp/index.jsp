<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/resources/include/header.jsp"%>
<header>
<div class="header-content">
	<div class="header-content-inner">
		<h1 id="homeHeading">HERE IS<br> YOUR FINANCE CONSULTING</h1>
		<hr>
		<p>YOUR FINANCE CONSULTING은 10년이상의 재무설계사와 머신러닝 개발자들이 힘을 합쳐 개발한
		인공지능 재무설계를 제공합니다.<br>
		 결혼, 주거, 은퇴등 다양한 분야의
		서비스를 받아보세요.</p>
		<a href="#about" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
	</div>
</div>
</header>
<section class="bg-primary" id="about">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">최신 금융동향을 살펴보세요!</h2>
				<hr class="light">
				<p class="text-faded">아래의 사이트에서 최신 금융동향을 살펴보세요!<br>
				금융, 주식, 보험, 경제 등 다양한 분야의 금융동향을 파악하는 것은
				현명한 재무설계를 위한 첫 걸음입니다.</p>
				<a href="http://finance.naver.com/" target="_black" 
					class="page-scroll btn btn-default btn-xl sr-button"><font color="#00C73C">Naver</font></a>
				<a href="http://finance.daum.net/" target="_black" 
					class="page-scroll btn btn-default btn-xl sr-button"><font color="#608DFC">Daum</font></a>
				<a href="https://www.google.com/finance" target="_black" 
				class="page-scroll btn btn-default btn-xl sr-button"><font color="#EA4335">Google</font></a>
			</div>
		</div>
	</div>
	
</section>

<section id="services">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading">재무설계란?</h2>
				<hr class="primary">
				<div style="font-size: 20px">
				돈을 벌고 쓰면서 사람들은 경제생활을 하고 있다. <br>
				대부분의 사람들은 풍족한 생활을 원하고 적정한 소득만 유지된다면 이를 바탕으로 하고 싶은 일들도 많을 것이다. <br>
				그런데 살아가면서 돈을 벌고 쓰는 과정은 매우 불규칙하게 이루어진다. <br>
				안정적인 미래를 준비하고 자신의 계획을 실현하기 위해서는 돈<br>
				을 어떻게 벌어서 어떻게 쓸 것인지를 미리 예측하고 조정하여 대비하는 것이 필요하다.
				</div>
			</div>
		</div>
	</div><br>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-diamond text-primary sr-icons"></i>
					<h3>재무 목표 설정</h3>
					<p class="text-muted">자신의 가치관과 재무 상태 등을 고려해 장,단기 목표 설정</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-newspaper-o text-primary sr-icons"></i>
					<h3>재무상태 분석</h3>
					<p class="text-muted">자신의 매수 상태 및 이용 가능한 자원 파악</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-paper-plane text-primary sr-icons"></i>
					<h3>재무 행동 계획 실행</h3>
					<p class="text-muted">재무 목표 달성을 위해 계획 실행</p>
				</div>
				
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-heart text-primary sr-icons"></i>
					<h3>재무실행 평가와 수정</h3>
					<p class="text-muted">목표 달성 정도를 평가하고 달성하지 못했을 경우 문제점을 파악하고 수정</p>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="no-padding" id="portfolio" style="">
	<table>
		<tr>
			<td><a href="<%=request.getContextPath() %>/total_start.do"
				class="portfolio-box"> <img
					src="resources/img/portfolio/thumbnails/shopping.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">종합 재무 설계</div>
						</div>
					</div>
			</a></td>
			<td><a href="<%=request.getContextPath()%>/retire.do"
				class="portfolio-box"> <img
					src="resources/img/portfolio/thumbnails/retirement.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">은퇴 자금 마련</div>
						</div>
					</div>
			</a></td>
			<td><a href="<%=request.getContextPath()%>/house.do"
				class="portfolio-box"> <img
					src="resources/img/portfolio/thumbnails/house.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">주거 자금 마련</div>
						</div>
					</div>
			</a></td>
			</tr>
			<%-- <tr>
			<td><a href="<%=request.getContextPath()%>/result_list.do"
				class="portfolio-box"> <img
					src="resources/img/portfolio/thumbnails/4.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">종합 재무 설계</div>
						</div>
					</div>
			</a></td>
			<td><a href=#
				class="portfolio-box"> <img
					src="resources/img/portfolio/thumbnails/5.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Total!</div>
						</div>
					</div>
			</a></td>
			<td><a href=#
				class="portfolio-box"> <img
					src="resources/img/portfolio/thumbnails/6.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Test!</div>
						</div>
					</div>
			</a></td>
		</tr> --%>
	</table>
</section>

<aside class="bg-dark">
	<div class="container text-center">
		<div class="call-to-action">
			<h2>질문(QnA) 게시판</h2>
			<a href="<%=request.getContextPath() %>/board_list.do" class="btn btn-default btn-xl sr-button">GO!</a>
		</div>
	</div>
</aside>

<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">Let's Get In Touch!</h2>
				<hr class="primary">
				<p>Ready to start your next project with us? That's great! Give
					us a call or send us an email and we will get back to you as soon
					as possible!</p>
			</div>
			<div class="col-lg-4 col-lg-offset-2 text-center">
				<i class="fa fa-phone fa-3x sr-contact"></i>
				<p>123-456-6789</p>
			</div>
			<div class="col-lg-4 text-center">
				<i class="fa fa-envelope-o fa-3x sr-contact"></i>
				<p>
					<a href="mailto:your-email@your-domain.com">Acorn@acornacademy.com</a>
				</p>
			</div>
		</div>
	</div>
</section>

<!-- jQuery -->
<script src="resources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="resources/vendor/scrollreveal/scrollreveal.min.js"></script>
<script
	src="resources/vendor/magnific-popup/jquery.magnific-popup.js"></script>

<!-- Theme JavaScript -->
<script src="resources/js/creative.js"></script>

</body>

</html>