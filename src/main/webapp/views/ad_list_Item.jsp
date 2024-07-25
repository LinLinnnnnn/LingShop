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

        <div class="container-fluid ">
            <div class="text-start">
          
		<%@ include file="menu-ad.jsp" %>
            </div>	
        </div>
        
        <div id="change" class="container">
            <div class="container d-flex justify-content-center " style="overflow-x:auto;">
                <table class="table text-start">
                    <thead>
                        <tr class="text-nowrap ">
                            <th>STT</th>
                            <th>Hình</th>
                            <th>Tên</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Giảm giá</th>
                              <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${listProduct}" varStatus="loop">
                        <tr> 
                            <td>
                                <div>${loop.index + 1}</div>
                            </td>
                            <td>
                                <div class="img-box">
                                    <img src="img/${product.productImages[0].path }" alt="" class="w-100">
                                </div>
                            </td>
                            <td>
                                <div>${product.name }</div>
                            </td>
                            <td>
                                <div>${product.price }</div>
                            </td>
                            <td>
                                <div>${product.quantity }</div>
                            </td>
                                <td>
                                <div>${product.discount}</div>
                            </td>
                            <td>
                                <div> <a type="button" class="btn btn-warning m-1" href="AD_Show_SP?product_id=${product.id}" >Chi tiêt sản phẩm </a>
                                    <a type="button" class="btn btn-primary m-1" href="AD_Delete_SP?product_id=${product.id}">Xóa</a>
                                </div>

                            </td>
                        </tr>
               
</c:forEach>

                    </tbody>
                </table>
            </div>
            <div class="col-6 text-end">
                <a href="AD_Add" class="btn btn-primary">Thêm sản phẩm</a>
            </div>
        </div>

    </body>
    

    </html>