	
	var article={};
	
	var myCurrentPage = 1;
	var check = true;
	var limit = 2;
	
	$(document).ready(function(){
		
		 
		 
		 /*** Events ***/ 
		 
		/** OnClick **/
		
		$(document).on('click',"#id or .class" , function(){
				//TODO: 
		});
		
		
		
		/** Submit **/
		
		// Submit data   
		$("#FormID").submit(function(e){
				 e.preventDefault();
				 // TODO:
		});
		
		
		
		
		
		
		/*** Function ***/  
		
		article.findAllArticles = function(page,limit){
			
			$.ajax({ 
			    url:  "http://localhost:8081/v2/api/article/?page="+page+"&limit="+limit, 
			    type: "GET",
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
			    success: function(data) { 
					console.log(data);
					if(data.status == true){
						$("tbody#articleData").empty();
						$("#article_tmpl").tmpl({articles: data.data}).appendTo("tbody#articleData");
						if(check){
							article.setPagination(data.pagination.total_pages,page);
				    			check=false;
						}
					}else{
						
					}
					
			    },
			    error:function(data,status,er) { 
			        console.log(data);
			    }
			});
	
		};
		
		/** Pagination **/
		article.setPagination = function(totalPage, currentPage){
	    	$('#pagination').bootpag({
		        total: totalPage,
		        page: currentPage,
		        maxVisible: 10,
		        leaps: true,
		        firstLastUse: true,
		        first: 'First',
		        last: 'Last',
		        wrapClass: 'pagination',
		        activeClass: 'active',
		        disabledClass: 'disabled',
		        nextClass: 'next',
		        prevClass: 'prev',
		        lastClass: 'last',
		        firstClass: 'first'
		    }).on("page", function(event, currentPage){
		    		check = false;
		    		myCurrentPage = currentPage;
		    		article.findAllArticles(currentPage,limit);
		    }); 
		}; 
		
		
		
		
		 /** OnLoad **/
		 
		 article.findAllArticles(myCurrentPage,limit);
		
		 
		
		
		
	});