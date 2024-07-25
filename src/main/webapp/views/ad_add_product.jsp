<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/LingShop/"/>
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
<style type="text/css">
	    <%@include file="/css/style_danhsach.css" %>
	</style>
<meta charset="UTF-8">
<title>Ad</title>
</head>
<style>
 .box img {
      width: 200px; /* Width of the image */
      height: 170px; /* Height of the image */
      transition: transform 0.3s ease;
    }
</style>
<body>

     <div class="container-fluid ">
            <div class="text-start">
		<%@ include file="menu-ad.jsp" %>
            </div>	
        </div>
			
<div class="d-flex justify-content-center w-100 ">
        <form action="AD_Add"  method="post" style="width: 90%;" id="myForm" enctype="multipart/form-data">

            <div class="mt-2">
                <label for="formFile" class="form-label">Ảnh sản phẩm: 
               <c:if test="${product.productImages[0].path != null }"> 
               <span>${product.productImages[0].path},  ${product.productImages[1].path},  ${product.productImages[2].path},  ${product.productImages[3].path}
                </span> </c:if>
                </label>
                <br>
               <input class="" type="file" id="formFile" name="path" multiple >
               <c:if test="${product.productImages[0].path != null }">
                  <div class="mt-2">   <div class="box">
				        <img src="img/${product.productImages[0].path }" alt="Image 1"> 
				           <img src="img/${product.productImages[1].path }" alt="Image 1"> 
				              <img src="img/${product.productImages[2].path }" alt="Image 1"> 
				               <img src="img/${product.productImages[3].path }" alt="Image 1"> 
				      </div>
				      </div>
               </c:if>
            </div>
           
            <div class=" mt-2">
                <label for="tensanpham" class="form-label">Tên sản phẩm:</label>
                <input type="text" class="form-control" id="tensanpham" name="name" placeholder="Nhập tên sản phẩm" value="${product.name }">
            </div>
            
            <div class="mt-2">
                <label for="danhmuc" class="form-label">Loại sản phẩm:</label>
                <select class="form-select" id="danhmuc" name="product_category_id">
                    <c:forEach var="category" items="${listCategory }">
                    <option value="${category.id }" ${category.id == product.category.id ? 'selected' : ''}>${category.name }</option>
                    </c:forEach>
                    
                </select>
            </div>
            <div class="mt-2">
                <label for="danhmuc" class="form-label">Brand:</label>
                <select class="form-select" id="danhmuc" name="brand_id">
                    <c:forEach var="brand" items="${listBrand }">
                    <option value="${brand.id }" ${brand.id == product.brand.id ? 'selected' : ''}>${brand.name }</option>
                    </c:forEach>
                    
                </select>
            </div>
            <div class="mt-2">
                <label for="giagoc" class="form-label">Giá gốc:</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="number" class="form-control" placeholder="Nhập giá gốc" id="giagoc" name ="price" value="${product.price}">
                </div>
            </div>
            <div class="mt-2">
                <label for="giagoc" class="form-label">Số lượng</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="number" class="form-control" placeholder="Nhập giá gốc" id="giagoc" name = "quantity" value="${product.quantity}">
                </div>
            </div>
            <div class="mt-2">
                <label for="giakhuyenmai" class="form-label">Giảm giá:</label>
                <div class="input-group">
                    <span class="input-group-text">%</span>
                    <input type="number" class="form-control"  name = "discount" value="${product.discount}" placeholder="Nhập giá khuyến mãi" 
                        id="giakhuyenmai">
                </div>
            </div>
             <div class=" mt-2">
                <label for="tensanpham" class="form-label">Tag:</label>
                <input type="text" class="form-control"  name = "tag" id="tensanpham" placeholder="#tag,..." value="${product.tag}">
            </div>
             <div class=" mt-2">
                <label for="tensanpham" class="form-label">Color:</label>
                <input type="text" class="form-control"  name = "color" id="tensanpham" placeholder="Nhập màu " value="${product.color}">
            </div>
                        <div class="mt-2">
                <label for="danhmuc" class="form-label">size:</label>
                <select class="form-select" id="size"  name = "size">
                    <option value="S" ${product.size == 'S'? 'selected' : ''}>S</option>
                    <option value="M" ${product.size == 'M'? 'selected' : ''}>M</option>
                      <option value="L" ${product.size == 'L'? 'selected' : ''}>L</option>
                </select>
            </div>
            <div class=" my-2">
                <label for="comment">Mô tả:</label>
                <textarea class="form-control" rows="3"  name = "description" id="comment1" name="text"
                    placeholder="Nhập 1 đoạn mô tả ngắn về sản phẩm" >${product.description}</textarea>
            </div>
    
            <button  id="addButton" class="btn btn-primary text-white" formaction="AD_Add_SP">Thêm sản phẩm</button>
			 <button id="updateButton" type="submit" class="btn btn-primary text-white" formaction="AD_Update_SP?product_id=${product.id}">Cập nhật sản phẩm</button>  
 			<p class="text-success">${mess }</p>

        </form>
    </div>

<script>
    window.onload = function() {
        var currentURL = window.location.href;

        // Check if the current URL contains "AD_Add"
        if (currentURL.includes("AD_Add")) {
            document.getElementById("updateButton").style.display = "none"; // Hide the update button
        } else {
            document.getElementById("addButton").style.display = "none"; // Hide the add button
        }
    };
</script>

</body>
</html>