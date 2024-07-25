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
	<base href="/LingShop/">
<title>Đăng Kí</title>
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
                    <form action="DangKi" method="post">
                        <p class="text-center fw-light fs-5 ">Đăng ký</p>
                        <p class="text-danger">${mess_err }</p>
                        <div class="mb-3 mx-3">
                            <label for="ho" class="form-label">Họ<span class="text-danger">*</span></label>
                            <input type="text" class="form-control" style="text-transform: none;" id="ho" placeholder="Họ" name="f_name" required="required">
                        </div>
                        <div class="mb-3 mx-3 ">
                            <label for="ten" class="form-label">Tên<span class="text-danger">*</span></label>
                            <input style="text-transform: none;"  type="text" class="form-control" id="ten" placeholder="Tên" name="l_name" required="required">
                        </div>

                                <div class="mb-3 mx-3">
                            <label for="sdt" class="form-label">Tài khoản<span
                                    class="text-danger">*</span></label>
                            <input style="text-transform: none;"  type="text" class="form-control" id="sdt" placeholder="Nhập tài khoản" name="username" required="required">
                        </div>

                        <div class="mb-3 mx-3">
                            <label for="mk" class="form-label">Mật khẩu<span class="text-danger">*</span></label>
                            <input style="text-transform: none;"  type="password" class="form-control" id="mk" placeholder="Mật khẩu" name="password" required="required" data-eye>
                        </div>
                        <div class="container mt-5 px-3">
                            <div class="d-grid gap-3">
                                <button type="submit" formaction="DangKi"  class="btn btn-50 bg-main w-100 rounded-0 text-white p-3 fw-500 fw-light fs-6 text-uppercase btn-block">
                                    Đăng ký</button>
                                <div class="text-center mt-3">Đã có tài khoản, đăng nhập <a href="DangNhap"
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