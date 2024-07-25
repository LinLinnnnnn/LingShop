<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html>

    <head>
    <base href="/LingShop/"/>
        <meta charset="UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style type="text/css">
            <%@include file="/css/style_danhsach.css" %>
        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
            integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd" crossorigin="anonymous">

        <title>AD</title>
    </head>

    <body>

       
          
      <i class="bi bi-list fs-2" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions"
                    aria-controls="offcanvasWithBothOptions"></i>
                <div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions"
                    aria-labelledby="offcanvasWithBothOptionsLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">${user.username }</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                            aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav ">
                            <li class=" nav-item">
                                <a class="nav-link " href="#"><i class="bi bi-house-door-fill"></i>Trang chủ</a>
                            </li>
                            <li class=" nav-item">
                                <a class="nav-link " href="ThongTinCaNhan"><i class="bi bi-house-door-fill"></i>Quản lí tài khoản</a>
                            </li>
                            <li class="nav-item mt-3">
                                <a class="nav-link " href="AD_List"><i class="bi bi-box-arrow-right"></i>Quản lí sản phẩm</a>
                            </li>
                            <li class="nav-item mt-3">
                                <a class="nav-link " href="#"><i class="bi bi-cart3"></i>Quản lí đánh giá </a>
                            </li>
                               <li class="nav-item mt-3">
                                <a class="nav-link " href="AD_Export_Excel"><i class="bi bi-cart3"></i>Xuất file  </a>
                            </li>
                            <li class="nav-item mt-3">
                                <a class="nav-link " href="DangNhap"><i class="bi bi-folder2"></i>Đăng xuất</a>
                            </li>
                  
                        </ul>
                    </div>
                </div>
      
     

    </body>

    </html>