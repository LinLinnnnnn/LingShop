<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="/LingShop/"/>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">
<%@include file="/css/style.css" %>
</style>
<title>Trang chủ</title>
</head>
 <style>
   .box a {
      display: block; /* Chuyển thẻ a thành block để nó chiếm toàn bộ không gian của box */
      width: 100%; /* Chiều rộng của thẻ a bằng với box */
      height: 100%; /* Chiều cao của thẻ a bằng với box */
      position: relative; /* Đặt vị trí tương đối */
      text-decoration: none; /* Loại bỏ gạch chân mặc định */
    }
 .box::before {
      content: ''; /* Tạo một pseudo-element */
      position: absolute; /* Đặt vị trí tuyệt đối */
      top: 0; /* Đặt ở đỉnh của hộp */
      left: 0; /* Đặt ở bên trái của hộp */
      width: 100%; /* Chiều rộng bằng với hộp */
      height: 100%; /* Chiều cao bằng với hộp */
      background-color: rgba(0, 0, 0, 0.5); /* Màu xám với độ trong suốt */
      opacity: 0; /* Ẩn ban đầu */
      transition: opacity 0.3s ease; /* Thêm transition cho hiệu ứng opacity */
    }
    .box:hover img {
      transform: scale(1.1); /* Phóng to hình ảnh khi hover */
    }
  .box:hover::after {
      opacity: 1; /* Hiển thị lớp phủ màu xám khi hover */
    }
    .box span {
    text-transform:uppercase;
    font-weight:bold;
      position: absolute; /* Đặt vị trí tuyệt đối cho văn bản */
      top: 50%; /* Đặt văn bản ở giữa theo chiều dọc */
      left: 50%; /* Đặt văn bản ở giữa theo chiều ngang */
      transform: translate(-50%, -50%); /* Dịch chuyển văn bản 50% theo chiều ngang và chiều dọc để căn giữa */
      color: white; /* Màu văn bản */
      z-index: 1; /* Đặt vị trí z-index để văn bản nằm trên lớp phủ màu */
    }

    .box {
     position: relative;
      margin: 5px; /* 5px margin around each box */
      display: inline-block;
      text-align: center; /* Center align text */
       overflow: hidden;
    }
    .box img {
      width: 250px; /* Width of the image */
      height: 170px; /* Height of the image */
      transition: transform 0.3s ease;
    }
  </style>
<body>
  			<jsp:include page="header.jsp"/>
  			<jsp:include page="carousel.jsp"/>
  			
				<div class="container-1140">
				  <div class="row text-center">
				  <c:forEach var="category" items="${listCategory}" varStatus="loop">
				    <div class="col-4">
				      <div class="box">
				       <a href="DanhSachSP?category_id=${category.id}">
				        <img src="img/lolita${loop.index+1}.jfif" alt="Image 1">
				        <span>${category.name}</span>
				        </a>
				      </div>
				    </div>
				    </c:forEach>
				
				  </div>
				</div>
     			<jsp:include page="listItem.jsp"/>
            	<jsp:include page="footer.jsp"/>
</body>
</html>