<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   
<style type="text/css">
	      <%@include file="/css/style.css" %>
	        <%@include file="/css/chitiet.css" %>
	</style>
<title>Trang chi tiết</title>
</head>
<style>

.checked{
color: orange;
}
 h5{
    font-family: 'Courier New', Courier, monospace;
    font-size: 20px;
    font-weight: 800;
  }
  *{text-transform:none;  !important;}
</style>
<body>
	<jsp:include page="header.jsp"/>
	 <jsp:include page="banner-diff.jsp" />
<div class="container ">
    <div class="row mt-5 pt-2">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            <div class="img-detail" style="border: 1px solid rgb(220, 220, 220);">
                <img src="img/${product.productImages[1].path}" alt="">
            </div>
            <div class="img-mini d-flex justify-content-center mb-5 mt-1">

                <div class="picture-mini " style="border: 1px solid rgb(220, 220, 220);">
                    <img src="img/${product.productImages[0].path}" class="d-block w-100" alt="...">
                </div>
                <div class="picture-mini " style="border: 1px solid rgb(220, 220, 220);">
                    <img src="img/${product.productImages[2].path}" class="d-block w-100" alt="...">
                </div>
                <div class="picture-mini " style="border: 1px solid rgb(220, 220, 220);">
                    <img src="img/${product.productImages[3].path}" class="d-block w-100" alt="...">
                </div>

            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            <div class="product-detail px-3">
                <h1 class="product-name">${product.name}</h1>
                <div class="group-status ">
                    <span class="first_status">Thương hiệu: <span class="status_name"
                            style="color: green;">${product.brand.name}</span></span>
                    <span class="line_tt" style="margin: 0 5px;">/</span>
                    <span class="first_status sku-product">
                        Mã sản phẩm: <span class="variant-sku" style="color: green;" itemprop="sku"
                          >${product.id}</span>
                    </span> 
                      <span class="line_tt" style="margin: 0 5px;">/</span>
                    <span class="first_status sku-product">
                        Số lượng có sẵn: <span class="variant-sku" style="color: green;" itemprop="sku"
                           >${product.quantity}</span>
                    </span>
                      
                      <div class="group-status">
                    <span class="first_status sku-product">
                       Mô tả: <span class="variant-sku" itemprop="sku"
                           >${product.description}</span>
                    </span>
                </div>
                  <hr >
                <span class="product-price pt-2 pb-4">$${product.discount != 0? product.price - product.price / product.discount: product.price}&nbsp;
                                 <c:if test="${product.discount != 0}">   <span class="text-decoration-line-through text-black">$${product.price }
                                </span>
                                   </c:if>
                                </span>
                <h4>Size:</h4>
				<div class="btn-size">
				    <input class="form-check-input" type="radio" name="inlineRadioOptions"
				        id="inlineRadio1" >
				    <label class="form-check-label" for="inlineRadio1">L</label>
				    <input class="form-check-input" type="radio" name="inlineRadioOptions"
				        id="inlineRadio2">
				    <label class="form-check-label" for="inlineRadio2">M</label>
				    <input class="form-check-input" type="radio" name="inlineRadioOptions"
				        id="inlineRadio3">
				    <label class="form-check-label" for="inlineRadio3">S</label>
				</div>
                <div class="number-add mt-3 mb-2 d-flex flex-wrap justify-content-center">
                    <div class="p-2">
                        <input type="number" name="" id="" min="1" value="1" step="1">
                    </div>
                    <div class="p-2">
                        <button data-bs-toggle="modal" data-bs-target="#modal-checkout"
                            class="custom-btn btn-5 fs-4"><span>Mua ngay</span></button>
                    </div>
               
                </div>
                
                   <div class="group-status ">
                    
                    <span class="first_status sku-product">
                       Tag: <span class="variant-sku" style="color: green;" itemprop="sku"
                         >${product.tag}, ${product.color} </span>
                    </span>
                    <hr class="mt-5">
                </div>
                <div class="support-product ">
                    <p class="hotline_product fw-bold fs-5">Tư vấn:
                        <a class="sdt-hotline cl-main fw-bold" href="tel:0866956907">0889456201</a>
                    </p>
                    <p>
                        <span> <a class="size-chart fw-bold text-primary" href="#">SIZE CHART</a></span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
    	<div class="row">
      <div class="col-12">
        <div class="content-text bg_w">
          <div class="comment-info-index-content">
            <form action="" method="post">
              <div class="fl-dsp">
                <h4  style="text-transform: none;" >Đánh giá sản phẩm</h4>
                <p class="vote">
           	 <i class="bi bi-star-fill checked"></i>
             <i class="bi bi-star-fill"></i>
             <i class="bi bi-star-fill"></i>
             <i class="bi bi-star-fill"></i>
             <i class="bi bi-star-fill"></i>

                  <i class="clearfix"></i>
                </p>
              </div>

              <div class="comment-info-inputText">
                <h4 style="text-transform: none;">Viết bình luận của bạn:</h4>
                <textarea  style="text-transform: none;" id="commentText" class="form-control input" rows="5"
                  placeholder="Viết bình luận của bạn tại đây. Nội dung bình luận phải có hơn 30 ký tự"></textarea>
              </div>
              <div class="pt-3 text-end">
                <a class="btn btn-success" href="#">Đăng nhập để đánh giá</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
       </div>
    

</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>