<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
.navbar {
	transition: all 0.4s;
}

.navbar .nav-link {
	color: #555;
}

.navbar .nav-link:hover, .navbar .nav-link:focus {
	color: #555;
	text-decoration: none;
}

.navbar .navbar-brand {
	color: #555;
}

/* Change navbar styling on scroll */
.navbar.active {
	background: #f8f8ff;
	box-shadow: 1px 2px 10px rgba(0, 0, 0, 0.1);
}

.navbar.active .nav-link {
	color: #555;
}

.navbar.active .nav-link:hover, .navbar.active .nav-link:focus {
	color: #fff;
	text-decoration: none;
}

.navbar.active .navbar-brand {
	color: #555;
}

@media ( max-width : 991.98px) {
	.navbar {
		background: #fff;
	}
	.navbar .navbar-brand, .navbar .nav-link {
		color: #555;
	}
}

.text-small {
	font-size: 0.9rem !important;
}

h1 {
	text-align: center;
	margin-top: 150px;
}

nav {
	background: #f8f8ff;
}

nav ul {
	font-size: 0;
	margin: 0;
	padding: 0;
}

nav ul li {
	display: inline-block;
	position: relative;
}

nav ul li a {
	color: #555;
	display: block;
	font-size: 14px;
	padding: 15px 14px;
	transition: 0.3s linear;
}

nav ul li:hover {
	background: #FAFAAA;
}

nav ul li ul {
	border-bottom: 5px solid #FAFAA0;
	display: none;
	position: absolute;
	width: 250px;
}

nav ul li ul li {
	border-top: 1px solid #FAFAA0;
	display: block;
}

nav ul li ul li:first-child {
	border-top: none;
}

nav ul li ul li a {
	background:  #f8f8ff;
	display: block;
	padding: 10px 14px;
}

nav ul li ul li a:hover {
	background: #555;
	color: #fff;
}

nav .fa.fa-angle-down {
	margin-left: 6px;
}
</style>

<header class="header">
	<nav class="navbar navbar-expand-lg fixed-top py-3">
		<div class="container">
			<a href="/" class="navbar-brand text-uppercase font-weight-bold">
				COFFEEMALL</a>
			<button type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation"
				class="navbar-toggler navbar-toggler-right">
				<i class="fa fa-bars"></i>
			</button>

			<div id="navbarSupportedContent" class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="/"
						class="nav-link text-uppercase font-weight-bold">Home <span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a href="/about/about"
						class="nav-link text-uppercase font-weight-bold">About</a></li>
					<li class="nav-item"><a href="/product/category"
						class="nav-link text-uppercase font-weight-bold">Product</a></li>
					<li class="nav-item"><a href="/notice/list"
						class="nav-link text-uppercase font-weight-bold">Community</a>
						<ul>
							<li><a href="/qna/list">QNA</a></li>
							<li><a href="/notice/list">NOTICE</a></li>
						</ul></li>
					<c:choose>
						<c:when test="${not empty login.userId}">
							<li class="nav-item"><a href="/user/update/${login.userId}"
								class="nav-link text-uppercase font-weight-bold">Mypage</a></li>
							<li class="nav-item"><a
								class="nav-link text-uppercase font-weight-bold"
								href="/user/logout">Logout</a>
						</c:when>
						<c:when test="${not empty adminLogin.adminId}">
							<li class="nav-item"><a href="/user/list"
								class="nav-link text-uppercase font-weight-bold">Manage</a></li>
							<li class="nav-item"><a
								class="nav-link text-uppercase font-weight-bold"
								href="/user/logout">Logout</a>
						</c:when>
						<c:when test="${not empty bossLogin.bossId}">
							<li class="nav-item"><a href="/product/sales"
								class="nav-link text-uppercase font-weight-bold">Sales</a></li>
							<li class="nav-item"><a
								class="nav-link text-uppercase font-weight-bold"
								href="/user/logout">Logout</a>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a
								class="nav-link text-uppercase font-weight-bold"
								href="/user/loginget">login</a></li>
							<li class="nav-item"><a href="/user/insert"
								class="nav-link text-uppercase font-weight-bold">Join</a></li>
						</c:otherwise>
					</c:choose>




				</ul>
			</div>
		</div>
	</nav>
</header>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

$(function () {
    $(window).on('scroll', function () {
        if ( $(window).scrollTop() > 10 ) {
            $('.navbar').addClass('active');
        } else {
            $('.navbar').removeClass('active');
        }
    }); 
});

$('nav li').hover(
        function() {
            $('ul', this).stop().slideDown(200);
        },
        function() {
            $('ul', this).stop().slideUp(200);
        }
    );
</script>
