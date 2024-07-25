<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">
	    <%@include file="/css/thanhtoan.css" %>
	</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="container">
        <h3 class="text-center pb-2">Thanh Toán</h3>

        <div class="row row-re d-flex">
            <div class="col-lg-8 col-md-12 col-sm-12">
                <div class="row ">
                    <div class="col-lg-6 col-md-12 col-sm-12 ">
                        <div class="mb-3">
                            <input type="tel" class="form-control" id="phone" placeholder="Số điện thoại">
                        </div>
                      
                        <div class="mb-3">
                            <input type="text" class="form-control" id="name" placeholder="Họ và tên">
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" id="email" placeholder="Email(tùy chọn)">
                        </div>
                        <!-- <div class="mb-3">
                            <input type="text" class="form-control" id="address" placeholder="Địa chỉ">
                        </div> -->
                        <select class="form-select form-select-lg mb-3" aria-label="Large select example">
                            <option selected>Tỉnh thành</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                        <select class="form-select form-select-lg mb-3" aria-label="Large select example" disabled>
                            <option selected>Quận huyện</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                        <select class="form-select form-select-lg mb-3" aria-label="Large select example" disabled>
                            <option selected>Phường xã</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                        <div class="mb-3">
                            <textarea class="form-control" id="note" placeholder="Ghi chú" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12">
                      
                        <form class="example pb-4" action="#">
                            <input type="text" placeholder="Nhập mã giảm giá" name="upon">
                            <button type="btn">Áp dụng</button>
                        </form>
                        <h4>Thanh toán</h4>
                        <div class="form-check  mb-2 mt-3">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                            <label class="form-check-label" for="flexRadioDefault1">
                                Thanh toán bằng tiền mặt khi nhận hàng
                            </label>
                        </div>
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2"
                                checked>
                            <label class="form-check-label" for="flexRadioDefault2">
                                Thanh toán bằng thẻ ngân hàng
                            </label>
                        </div>

                    </div>

                </div>
                <div class="group-button text-end">
                    <a href="#" class="custom-btn btn btn-5" previewlistener="true">Đặt hàng</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12  ">
                <div class="container">
                    <h4>Đơn hàng <span class="price" style="color:black"> <i class="bi bi-cart-fill fs-4"></i>
                            <b>4</b></span>
                    </h4>
                    <p><a href="#">Product 1</a> <span class="price">$15</span></p>
                    <p><a href="#">Product 2</a> <span class="price">$5</span></p>
                    <p><a href="#">Product 3</a> <span class="price">$8</span></p>
                    <p><a href="#">Product 4</a> <span class="price">$2</span></p>
                    <hr>
                    <p>Total <span class="price" style="color:black"><b>$30</b></span></p>
                </div>
            </div>
        </div>
        <hr>
        Chính sách hoàn trả
        Chính sách bảo mật
    </div>
</body>
</html>