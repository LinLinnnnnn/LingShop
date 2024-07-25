<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.breadcrumb-item{
font-weight: bold;
font-size: large;
}
</style>
<body>
    <div class="img-banner mb-5">
        <div class="container text-center">
            <div class="row">
                <p class="title-page"></p>
            </div>
            <div class="row">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb d-flex justify-content-center">
                        <li class="breadcrumb-item "><a href="TrangChu" class="cl-main-2">Trang chủ</a></li>
                      <c:choose>
						<c:when test="${ breadcrumb_item == 'GioHang'}">
						  <li class="breadcrumb-item "><a href="GioHang" class="cl-main-2">Giỏ Hàng</a></li>
						</c:when>
						<c:when test="${ breadcrumb_item == 'DangNhap'}">
						  <li class="breadcrumb-item "><a href="DangNhap" class="cl-main-2">Đăng Nhập</a></li>
						</c:when>
							<c:when test="${ breadcrumb_item == 'DangKi'}">
						  <li class="breadcrumb-item "><a href="DangKi" class="cl-main-2">Đăng Kí</a></li>
						</c:when>
						<c:when test="${ breadcrumb_item == 'ChiTietSanPham'}">
						 <li class="breadcrumb-item "><a href="DanhSachSP?category_id=${product.category.id}" class="cl-main-2">${product.category.name}</a></li>
						  <li class="breadcrumb-item "><a href="ChiTietSP?product_id=${product_id}" class="cl-main-2">${product.name}</a></li>
						</c:when>
						<c:when test="${ breadcrumb_item == 'DanhSach'}">
						  <li class="breadcrumb-item "><a href="DanhSachSP" class="cl-main-2">Danh Mục</a></li>
						  <c:if test="${param.category_id != null}">
						  <li class="breadcrumb-item "><a  class="cl-main-2">${listProduct[0].category.name } </a></li>
						  </c:if>
						</c:when>
						<c:when test="${ breadcrumb_item == 'ThongTinCaNhan'}">
						  <li class="breadcrumb-item "><a href=ThongTinCaNhan class="cl-main-2">Thông Tin Cá Nhân</a></li>
						</c:when>
						<c:otherwise>
							
						</c:otherwise>
						</c:choose>
                
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>