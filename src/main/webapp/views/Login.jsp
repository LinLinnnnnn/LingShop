<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	    <%@include file="/css/all.min.css" %>
	    <%@include file="/css/bootstrap.min.css" %>
	      <%@include file="/css/login.css" %>
	       <%@include file="/css/style.css" %>
	</style>
	<script src="./js/bootstrap.bundle.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
<title>Đăng nhập</title>
<base href="/LingShop/">
</head>
<body>
	<jsp:include page="header.jsp"/>
	 <jsp:include page="banner-diff.jsp" />
 <section class="form-dangky">
        <div class="container">
            <div class="row  pt-5">
                <div class="col-lg-2 col-md-1 col-sm-12"></div>
                <div class="col-lg-8 col-md-10 col-sm-12">
                    <div class="container-form">
                        <form action="DangNhap" method="post">
                            <p class="text-center fw-light fs-5">Đăng nhập</p>
								<p class="text-danger">${message }</p>
                            <div class="mb-3 mx-3">
                                <label for="username" class="form-label">Tài khoản<span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="username" placeholder="Nhập tài khoản" 
                                name="username"  style="text-transform: none;" value="${usernameed}">
                            </div>

                            <div class="mb-3 mx-3">
                                <label for="mk" class="form-label">Mật khẩu<span class="text-danger">*</span></label>
                                <input type="password" class="form-control" id="mk" name="password" placeholder="Nhập mật khẩu" style="" required  data-eye value="${passworded }">
                            </div>
                            <div class="container mt-5 px-3">
                                <div class="d-grid gap-3">
                                    <button type="submit" formaction="DangNhap"
                                        class="btn btn-50 bg-main w-100 rounded-0 text-white p-3 fw-500 fw-light fs-6 text-uppercase btn-block">
                                        Đăng nhập</button>
                                    <button type="button" class="btn btn-50  w-100 rounded-0 p-3 btn-block">
                                        Quên mật khẩu</button>
                                    <div class="text-center mt-3">Chưa có tài khoản, đăng kí <a href="DangKi"
                                            class="cl-main text-decoration-underline a-dang-nhap"
                                            previewlistener="true">tại đây</a>
                                    </div>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
                <div class="col-lg-2 col-md-1 col-sm-12"></div>

            </div>
        </div>
    </section>
    	<jsp:include page="footer.jsp"/>
</body>
</html>