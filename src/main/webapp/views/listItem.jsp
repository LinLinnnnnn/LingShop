<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Trang sản phẩm</title>
</head>
<body>

  <section class="page-product" >
        <div class="container-1140" >
            <div class="row">
            <c:forEach var="product" items="${listProduct}">
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 my-1" >              
                    <div class="card">
                    <c:if test="${product.discount != 0}">
                        <div class="sale-right" >${product.discount}%</div>
                        </c:if>
                        <img src="img/${product.productImages[1].path}" class="d-block w-100" alt="...">
                        <button type="button" class="btn btn-detail text-white">
                        <a href="ChiTietSP?product_id=${product.id}">Tùy chọn</a>
                        </button>
                        <div class="card-body">
                            <div class="box-img d-flex">
                                <div class="picture-mini ">
                                    <img src="img/${product.productImages[3].path}" class="d-block w-100" alt="...">
                                </div>
                                <div class="picture-mini">
                                    <img src="img/${product.productImages[2].path}" class="d-block w-100" alt="...">
                                </div>
                                <div class="picture-mini">
                                    <img src="img/${product.productImages[0].path}" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <h5 class="card-title text-truncate text-center name"><a href="/LingShop/">${product.name}</a>
                            </h5>
                            <p class="card-text text-center brand"><a href=""></a></p>
                            <p class="card-text text-center price">$<fmt:formatNumber type="number" pattern="#,##0.0" value="${product.discount != 0 ? product.price - product.price / product.discount : product.price}" />&nbsp;
                             <c:if test="${product.discount != 0}">   <span class="text-decoration-line-through text-black">$${product.price }
                                </span>
                                   </c:if>
                            </p>
                        </div>
                    </div>
                </div>
                </c:forEach>
                  </div>
                    </div>
    </section>
    
</body>
</html>