<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-3843225232663919",
          enable_page_level_ads: true
     });
</script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<title>쓰잘데기</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/main?category=best"><img src="/images/trash2.png" alt="..." class="img-thumbnail mr-1">쓰잘데기</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/main?category=recm">추천</a></li>
				<li class="nav-item"><a class="nav-link" href="/articles">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=best">베스트</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=xart">조공 모음</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=news">뉴스 모음</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=itct">IT 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=movi">영화 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=socc">축구 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=base">야구 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=girl">여성 시대</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=shop">쇼핑 모음</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=stoc">주식 추천</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=devp">개발자</a></li>
			</ul>
		</div>
	</nav>

	<div class="my-3 p-3 bg-white">
		<h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary"><a href="/articles">[자유게시판]</a><a href="/write"><img src="/images/write.png" alt="..." class="img-thumbnail mx-2"></a></h6>		
		
			<h5 class="border-bottom border-gray py-2 my-3 font-weight-bold">${article.title}</h5>
			<div class="d-flex justify-content-between py-2 mb-2 small align-items-center w-100 border-bottom border-gray">
	            <span class="font-weight-bold">${article.aid}<img src="/images/view.png" alt="..." class="img-thumbnail mx-2">[${article.vcount}]<img src="/images/reply.png" alt="..." class="img-thumbnail mx-2">[${article.count}]</span>
				<span class="text-success">${article.ctime}</span>
		    </div>		
			<p class="pb-2" />${article.body}
			<p class="pb-2" /><button onclick="location.href='/articles'" class="btn btn-primary mt-3">목록</button>		
	</div>
	
	<p>
	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
	          <a href="#">Back to top</a>
	        </p>	
			<p>Copyrightⓒ Secret 4 News.</p>
			<p>All Rights Reserved.</p>
		</div>
	</footer>
	
		
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>