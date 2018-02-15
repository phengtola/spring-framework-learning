	
	var category = {};
	var user={};
	
	$(document).ready(function(){
		
		 
		 
		 /*** Events ***/ 
		 
		/** OnClick **/
		
		$(document).on('click',"#btDelete" , function(){
			category.DeleteCategory($(this).data("uuid"));
		});
		
		$(document).on('click' , "#btDetail" , function(){
			category.detail($(this).data("uuid"));
		});

		$(document).on('click' , "#btEdit" , function(){ 
			category.findCategory($(this).data("uuid"));
		});
		
		
		$(document).on('click' , "#btAdd" , function(){ 
			$('#categoryAddModal').modal('show');
		});

		$(document).on('click' , "#btUpdateStatus" , function(){ 
			category.updateCategoryStatus($(this).data("uuid"), $(this).data("status") );
		});
		
		
		/** Submit **/
		
		// Submit category data to update 
		$("#categoryUpdateForm").submit(function(e){
				 e.preventDefault();
				 category.submitCategoryToUpdate();
		});
		
		// Submit category data to insert 
		$("#categoryAddForm").submit(function(e){
				 e.preventDefault();
				 category.submitCategoryToInsert();
		});
		
		
		
		
		/*** Function ***/  
		
		// Display category detail by uuid
		category.detail = function(data){
			
					$.ajax({ 
					    url:  "http://localhost:8081/v2/api/category/"+ data, 
					    type: "GET",
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					    success: function(data) { 
							console.log(data);
							
							$("#name").text(data.data.name);
							$("#createdDate").text(moment(data.data.created_date).format("DD-MM-YYYY HH:mm:ss"));  ;
							$("#status").text(data.data.status);
							$("#index").text(data.data.index);
							$("#articleCount").text(data.data.couont_article);
							$("#remark").text(data.data.remark);
							// Show Popup 
							$('#categoryDetailModal').modal('show');
					    },
					    error:function(data,status,er) { 
					         console.log(data);
					    }
					});
			
		}
		
		
		// find category detail by uuid to set in update category form 
		category.findCategory = function(data){
					
					$.ajax({ 
					    url:  "http://localhost:8081/v2/api/category/"+ data, 
					    type: "GET",
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					    success: function(data) { 
							console.log(data);
							
							$("#categoryUpdateForm #uuid").val(data.data.uuid);
							$("#categoryUpdateForm #name").val(data.data.name);
							$("#categoryUpdateForm #status").val(data.data.status);
							$("#categoryUpdateForm #index").val(data.data.index);
							$("#categoryUpdateForm #remark").val(data.data.remark);
							
							// Show Popup 
							$('#categoryEditModal').modal('show');
					    },
					    error:function(data,status,er) { 
					        console.log(data);
					    }
					});
			
		};
		
		
		// Submit category data to update
		category.submitCategoryToUpdate = function(){
				cateData = {
						  "uuid": $("#categoryUpdateForm #uuid").val(),
						  "name": $("#categoryUpdateForm #name").val(),
						  "status": $("#categoryUpdateForm #status").val(),
						  "index": parseInt($("#categoryUpdateForm #index").val()),
						  "remark":  $("#categoryUpdateForm #remark").val()
				};
				console.log(cateData);
				
				swal({   title: " Category" ,   
					 text: "Are you sure you want to update this category?",   
					 type: "info",  
					 showCancelButton: true,   
					 closeOnConfirm: false,   
					 showLoaderOnConfirm: true, 
				}, function(){   
					$.ajax({ 
					    url:  "http://localhost:8081/v2/api/category", 
					    type: "PUT",
					    data: JSON.stringify(cateData),
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					    success: function(data) { 
							console.log(data);
							swal(data.message);
							category.findAllCategory();
							$('#categoryEditModal').modal('hide');
							 
					    	
					    },
					    error:function(data,status,er) { 
					         console.log(data);
					    }
				});

				
			});
		
		};
		
		
		
		// find all category 
		category.findAllCategory = function(){
					var url = "http://localhost:8081/admin/category/fragment/categories";
					$("#results").load(url);
		};
		
		
		// Delete category by uuid
		category.DeleteCategory = function(data){
				swal({  title: " Category" ,   
						text: "Are you sure you want to deleted this category?",   
						type: "info",  
						showCancelButton: true,   
						closeOnConfirm: false,   
						showLoaderOnConfirm: true, 
				}, function(){   
					$.ajax({ 
					    url:  "http://localhost:8081/v2/api/category/"+ data, 
					    type: "DELETE",
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					    success: function(data) { 
							console.log(data);
							swal(data.message);
							category.findAllCategory();
					    },
					    error:function(data,status,er) { 
					         console.log(data);
					    }
					});
				
						
				});		
		};
		
		
		// Submit category data to insert
		category.submitCategoryToInsert = function(){
			
				cateData = {
						  "name": $("#categoryAddForm #name").val(),
						  "status": $("#categoryAddForm #status").val(),
						  "remark":  $("#categoryAddForm #remark").val()
				};
				console.log(cateData);
				
				swal({   title: " Category" ,   
					 text: "Are you sure you want to add this category?",   
					 type: "info",  
					 showCancelButton: true,   
					 closeOnConfirm: false,   
					 showLoaderOnConfirm: true, 
				}, function(){   
					$.ajax({ 
					    url:  "http://localhost:8081/v2/api/category", 
					    type: "POST",
					    data: JSON.stringify(cateData),
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					    success: function(data) { 
							console.log(data);
					    	    swal(data.message);
							category.findAllCategory();
							$('#categoryAddModal').modal('hide');
					    },
					    error:function(data) { 
					        console.log(data);
					    }
				});
			});
		
		};
		
		
		category.updateCategoryStatus = function(uuid,status){
			
			swal({  title: " Category" ,   
						text: "Are you sure you want to update this category status?",   
						type: "info",  
						showCancelButton: true,   
						closeOnConfirm: false,   
						showLoaderOnConfirm: true, 
				}, function(){   
					$.ajax({ 
					    url:  "http://localhost:8081/v2/api/category/"+uuid+"/status/"+status, 
					    type: "PUT",
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					    success: function(data) { 
							console.log(data);
							swal(data.message);
							category.findAllCategory();
					    },
					    error:function(data,status,er) { 
					        console.log(data);
					    }
					});
				
						
				});
				
			

		};
		
		
		
		 /** OnLoad **/
		 
		 category.findAllCategory();
		 
		
		
		
	});