<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
   

<title>Trang chủ</title>
</head>
<body>
  		 <div class="top-bar bg-dark">
    <div class="container">
      <div class="row">
        <div class="col-lg-7 col-md-7 col-sm-7 col-1">
          <div class="left-bar float-left">
            <a class="text-white" href="TrangChu">
              Ling
            </a>
        </div>
      </div>
      <c:if test="${sessionScope.user == null }">
      <div class="col-lg-5 col-md-5 col-sm-5 col-11">
        <div class="right-bar">
          <ul class="nav ">
            <li class="nav-item ">
              <a class="nav-link " href="${pageContext.request.contextPath}/DangKi">Đăng ký</a>
            </li>
            <li class="nav-item ">
              <p class="nav-link nav-link-disabled text-white">/</p>
            </li>
            <li class="nav-item ">
              <a class="nav-link " href="${pageContext.request.contextPath}/DangNhap">Đăng nhập</a>
            </li>
          </ul>
        </div>
      </div>
      </c:if>
    </div>
  </div>
  </div>



   <div class="main-header">
        <div class="container">
            <div class="row">
                <nav class="navbar">
                    <div class="col-lg-11 col-md-12 col-sm-11">
                        <div class="row ">
                            <nav class="navbar navbar-expand-lg position-relative ">

                                <button class="navbar-toggler text-end position-absolute " type="button"
                                    data-toggle="collapse" data-target="#navbarTogglerDemo03"
                                    aria-controls="navbarTogglerDemo03" aria-expanded="false"
                                    aria-label="Toggle navigation">

                                    <a class="btn" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"  aria-controls="offcanvasExample">
                                        <span class="navbar-toggler-icon"> </span>
                                    </a>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                                    <ul class="navbar-nav nav-main flex-wrap">

                                        <li class="nav-item">
                                            <a class="nav-link" href="TrangChu"><span>Trang Chủ</span></a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link" href="LingShop/DanhSachSP" role="button"
                                                data-bs-toggle="dropdown"><span>Danh
                                                    Mục</span>
                                                <i class="bi bi-caret-down-fill"></i></a>
                                            <ul class="dropdown-menu">
                                            <c:forEach var="category" items="${listCategory}">
                                                <li><a class="dropdown-item" href="DanhSachSP?category_id=${category.id}"><c:out value="${category.name}" /></a></li>
                                               </c:forEach>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link " href="DanhSachSP"><span>Sản Phẩm</span></a>
                                        </li>
                                        <li class="nav-item ">
                                            <a class="nav-link" href="GioHang">
                                                <span>Giỏ Hàng</span>
                                            </a>
                                        </li>
                                      
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>

                    <div class="col-1 text-end ">
                    <c:if test="${sessionScope.user != null}">
                       <a href="ThongTinCaNhan"><i class="bi bi-person"></i></a>
                       </c:if>
                        <i class="bi bi-bag" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"></i>
                        <div class="offcanvas offcanvas-end bg-white" data-bs-scroll="true" data-bs-backdrop="false"  tabindex="-1" id="offcanvasRight"
                            aria-labelledby="offcanvasRightLabel">
                            <div class="offcanvas-header">
                                <h5 class="offcanvas-title" id="offcanvasRightLabel">Giỏ hàng</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                    aria-label="Close"></button>
                            </div>
                            <div class="offcanvas-body">
                            
                            <div class="cart-gr">
                            <div class="cart-product" >
                              <div class="m-1 row">
                                <div class="col-5">
                                  <img src="/LingShop/img/sp.jpg" alt="Product Image">
                                </div>
                                <div class="col-7 text-start">
                                  <div class="cart-product-info ">
                                    <p>name</p>
                                    <div class="cart-product-price text-danger">
                                     9000000₫&nbsp;
                                    </div>
                                    <p>10</p>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <hr>

                            <div class="cart-product-total-price d-flex justify-content-between">
                              <span style="text-transform: none !important; font-weight: 600;">Tổng cộng:</span>
                              <span class="total-price" style="padding-right: 10px;">99999999₫</span>
                            </div>
                            <div class="cart-product-actions">
                              <button class="btn-delete"><a href="GioHang">Giỏ hàng</a> </button>
                              <button class="btn-update"><a href="ThanhToan">Thanh toán</a></button>
                            </div>


                          </div>
                               
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
            
            
</body>

</html>