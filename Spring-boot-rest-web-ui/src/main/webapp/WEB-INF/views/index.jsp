<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring REST Web Services</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	});
	
	var url = "http://localhost:8080/product/";
	$(function() {
	    productList();
	    $('button[type=button]').click(function(e) {
	        e.preventDefault();
	        //alert($('form[name=productForm]').serialize());
	        $.post({
	            type: "POST",
	            url: url,
	            data: $('form[name=productForm]').serialize(),
	            dataType: "text",
	            success: function(response) {
	                $("#success_id").show().fadeOut(5000);
	                productList();
	                $("input[type=text], textarea").val("");
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.log(textStatus, errorThrown);
	                $("#error_id").show().fadeOut(5000);
	            }
	        })
	    });
	});

	function productList() {
	    var msg_data;
	    $.ajax({
	        type: "GET",
	        url: url,
	        dataType: "json",
	        success: function(response) {
	            var table = '<table id=example class=table table-striped table-bordered cellspacing=0 width=100%>' +
	                '<thead> <tr> <th>Id</th> <th>Product Name</th> <th>Quantity</th> <th>Price</th> <th>Edit</th> <th>Delete</th> </tr> </thead>' +
	                '<tfoot> <tr> <th>Id</th> <th>Product Name</th> <th>Quantity</th> <th>Price</th> <th>Edit</th> <th>Delete</th> </tr> </tfoot><tbody id="product-list">';
	            $.each(response, function(key, product) {
	                table += "<tr>" +
	                    "<td>" + product.id + "</td>" +
	                    "<td>" + product.name + "</td>" +
	                    "<td>" + product.quantity + "</td>" +
	                    "<td>" + product.price + "</td>" +
	                    "<td><a href='#' onclick='javascript:editProduct(" + product.id + ");'>edit</a></td>" +
	                    "<td><a href='#' onclick='javascript:deleteProduct(" + product.id + ");'>delete</a></td>" +
	                    "</tr>";

	            });
	            table += '</table>';
	            $("#tableContainer").html(table);
	        }
	    });
	}

	function deleteProduct(id) {
	    //alert(id);
	    $.ajax({
	        type: "DELETE",
	        url: url + id,
	        dataType: "text",
	        success: function(response) {
	            $("#success_id").show().fadeOut(5000);
	            productList();
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            $("#error_id").show().fadeOut(5000);
	            console.log(textStatus, errorThrown);
	        }
	    })
	}

	function editProduct(id) {
	    $.ajax({
	        type: "GET",
	        url: url + id,
	        dataType: "json",
	        success: function(response) {
	            $("#idInput").html("<input id='id' name='id' type='hidden' class='form-control input-md' value=" + response.id + ">")
	            $("#name").val(response.name);
	            $("#quantity").val(response.quantity);
	            $("#price").val(response.price);
	            productList();
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log(textStatus, errorThrown);
	        }
	    })
	}
</script>
</head>
<body>

	<div class="container">
		<div class="alert alert-success" id="success_id" style="display: none">
			<strong>Success!</strong> Data saved Successfully.
		</div>
		<div class="alert alert-danger" id="error_id" style="display: none">
			<strong>Danger!</strong> Something went wrong! Try again.
		</div>
		<form class="form-horizontal mx-auto" name="productForm" method="post">
			<!-- Form Name -->
			<strong>Product Form </strong>
			<div class="form-group" id="idInput"></div>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="name">Product
					Name</label>
				<div class="col-md-4">
					<input id="name" name="name" type="text" placeholder="Product Name"
						class="form-control input-md" required="required">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="quantity">Quantity</label>
				<div class="col-md-4">
					<input id="quantity" name="quantity" type="text"
						placeholder="Quantity" class="form-control input-md"
						required="required">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="price">Price</label>
				<div class="col-md-4">
					<input id="price" name="price" type="text" placeholder="Price"
						class="form-control input-md" required="required">

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for=""></label>
				<div class="col-md-4">
					<button id="productFormSubmit" type="button"
						name="productFormSubmit" class="btn btn-success">Submit</button>
				</div>
			</div>
		</form>
		<div class="row" id="tableContainer"></div>
	</div>
</body>
</html>