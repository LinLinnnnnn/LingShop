<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
 <div class="banner">
    <div class="container-fluid container-banner">
      <div class="row">

        <!-- Carousel -->
        <div id="demo" class="carousel slide" data-bs-ride="carousel">

          <!-- Indicators/dots -->
          <div class="carousel-indicators ">
            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active "></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
          </div>

          <!-- The slideshow/carousel -->
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="/LingShop/img/banner.png" alt="Los Angeles" class="d-block w-100">
            </div>
            <div class="carousel-item">
              <img src="/LingShop/img/banner.png" alt="Chicago" class="d-block w-100">
            </div>
            <div class="carousel-item">
              <img src="/LingShop/img/banner.png" alt="New York" class="d-block w-100">
            </div>
          </div>

          <!-- Left and right controls/icons -->
          <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon rounded-circle bg-dark "></span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon rounded-circle bg-dark"></span>
          </button>
        </div>

      </div>
    </div>
  </div>
</body>
</html>