app.controller("product-ctrl", function($scope, $http,$location) {
    $scope.items = [];
    $scope.food_images = [];
    $scope.food_categories = [];
    $scope.default_image = [];
    $scope.form = {};
    $scope.keyword ="";
    $scope.create_date;
    $scope.price_min;
    $scope.price_max;
    $scope.quantity;
    $scope.display=-1;
    $scope.sort="id";
    $scope.avatar;
    $scope.categories;
    $scope.category_id = 0;;

    $scope.initialize = function() {
            //load categories
        let link =url + "/rest/food/filter";
        $http.get(link).then(resp => {
            $scope.items = resp.data;
            $scope.page = $scope.items.pageable.pageNumber
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })   
        
        $http.get("/rest/food/image/default").then(resp => {
            $scope.images = resp.data;
            console.log(resp.data);
            
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })  
	        
	    $http.get("/rest/category").then(resp => {
            $scope.categories = resp.data;
            console.log(resp.data);
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })     
    }

	$scope.load = function(pageNumber) {
			var link =url + "/rest/food/filter?page="+pageNumber;
			if($scope.keyword) link +="&keyword="+ $scope.keyword ;
			if($scope.price_min > 0) link +="&price_min="+ $scope.price_min ;
			if($scope.price_max > $scope.price_min) link +="&price_max="+ $scope.price_max ;
			if($scope.quantity > 0) link +="&quantity="+ $scope.quantity ;
			if($scope.category_id > 0) link +="&category_id="+ $scope.category_id ;
			if($scope.display !=-1) link +="&is_display="+ $scope.display ;
			if($scope.create_date) link +="&create_date="+ $scope.create_date.getTime() ;
			if($scope.sort) link +="&sort="+ $scope.sort ;
	        $http.get(link).then(resp => {
	            $scope.items = resp.data;
	            console.log($scope.items)
	        }).catch(err => {
	            if(err.status == 403){
					$scope.showToast('danger',"You are not authorized to perform this action!!!");
					$location.path("/unauthorized");
				}
	        })
	        
	        $http.get("/rest/food/image/default").then(resp => {
            $scope.images = resp.data;
            console.log(resp.data);
            
	        }).catch(err => {
	            if(err.status == 403){
					$scope.showToast('danger',"You are not authorized to perform this action!!!");
					$location.path("/unauthorized");
				}
	        })  
    }
    
    $scope.loadImageD = function(item){
		if(!$scope.images) return '';
		 let image = $scope.images.find(p => p.food_i.id == item.id);
		 return image ? image.image_name : "";
	}
	


    //Xoá form
    $scope.reset = function() {
        $scope.form = {
            id: '',
            name: '',
        }
        $scope.avatar ="";
        $scope.food_images ='';
        $scope.food_categories ='';
    }
    
    $scope.tab = function(tab) {
        document.getElementById(tab).click();
    }

    //Hiển thị lên form
    $scope.edit = function(item) {
		$http.get("/rest/food/image/"+item.id).then(resp => {
            $scope.food_images = resp.data;
            console.log(resp.data)
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        }) 
        
        $http.get("/rest/food/category/"+item.id).then(resp => {
            $scope.food_categories = resp.data;
            console.log(resp.data)
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        }) 
        
        $scope.form = angular.copy(item);
		$scope.showToast('warning','Edit food <b>'+$scope.form.name+"</b>");
        $scope.avatar ="";
		$scope.tab('tab2');
    }

    //Thêm sản phẩm
    $scope.create = function() {
        var item = angular.copy($scope.form);
        item.is_display= item._display;
        item._display = null;
        if(!item.avatar) item.avatar = 'user.png'
        console.log(item)
        $http.post(url + '/rest/food/create', item).then(resp => {
            $scope.load(0);
            $scope.reset();
            $scope.showToast('success','Add new food successful <b>'+item.name+"</b>");
            console.log(resp.data);
        }).catch(err => {
			if(err.status == 405){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}else{
				$scope.showToast('danger','Add new food failed <b>'+item.name+"</b>");
            	console.log("Error ", err);
			}
            
        })
    }

    //Update sản phẩm
    $scope.update = function() {
        var item = angular.copy($scope.form);
        if(!item.avatar) item.avatar = 'user.png'
        $http.put(url + '/rest/food/update/' + item.id, item).then(resp => {
            $scope.load(0);
            $scope.showToast('info','Update food successful <b>'+item.name+"</b>");
            console.log(resp.data);
        }).catch(err => {
			if(err.status == 405){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}else{
            $scope.showToast('danger','Update new food failed <b>'+item.name+"</b>");
            console.log("Error ", err);
            }
        })
    }

    //Remove sản phẩm
    $scope.delete = function(item) {
        $http.delete(url + `/rest/food/delete/${item.id}`).then(resp => {
            $scope.load(0);
            $scope.reset();
            $scope.showToast('dark','Delete food successful <b>'+item.name+"</b>");
            console.log(resp.data);
        }).catch(err => {
			if(err.status == 405){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}else{
            $scope.showToast('danger','Delete food failed <b>'+item.name+"</b>");
            console.log("Error ", err);
            }
        })
    }
    
    $scope.imageDefault = function(item,image){
		$http.get("/rest/food/image/default/"+item.id+"?image_id="+image.id).then(resp => {
            $scope.load(0);
            $http.get("/rest/food/image/"+item.id).then(resp => {
	            $scope.food_images = resp.data;
	            $scope.showToast('info','Change Default Image successful <b>'+item.name+"</b>");
	            console.log(resp.data)
	        }).catch(err => {
	            if(err.status == 403){
					$scope.showToast('danger',"You are not authorized to perform this action!!!");
					$location.path("/unauthorized");
				}
	        })
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        }) 
	}
    
    //Upload Hình
    $scope.imageChanged = function(files) {
        for ( let i =0 ; i< files.length ;i++) {
		  	let data = new FormData();
	        data.append('file', files[i]);
	
	        $http.post(url + '/rest/upload/images', data, {
	            transformRequest: angular.identity,
	            headers: { 'Content-Type': undefined }
	        }).then(resp => {
				let food_image ={food_i:$scope.form,image_name:resp.data.name};
	            $scope.imageAdd(food_image);
	        }).catch(err => {
	            $scope.showToast('danger','Upload image error ');
	            console.log("Error ", err)
	        })
		}

    }
    
    $scope.imageAdd = function(food_image){
		$http.post(url + '/rest/food/image/create', food_image).then(resp => {
				 $scope.load(0);
				 $scope.edit(food_image.food_i)
        }).catch(err => {
            $scope.showToast('danger','Add image error ');
            console.log("Error ", err)
        })
	}
    
    $scope.imageRemove = function(item,image){
		$http.delete(url + '/rest/food/image/delete/'+image.id).then(resp => {
			$http.get("/rest/food/image/"+item.id).then(resp => {
	            $scope.food_images = resp.data;
	            console.log(resp.data)
	        }).catch(err => {
	            if(err.status == 403){
					$scope.showToast('danger',"You are not authorized to perform this action!!!");
					$location.path("/unauthorized");
				}
	        })  
        }).catch(err => {
            $scope.showToast('danger','Remove image error ');
            console.log("Error ", err)
        })
	}

     $scope.first= function() {
            $scope.load(0);
     }
     
     $scope.last= function() {
        	$scope.load($scope.items.totalPages-1);
     }
    $scope.previous= function() {
        if ($scope.items.pageable.pageNumber <= 0) {
            $scope.first();
            return;
        };
        $scope.load($scope.items.pageable.pageNumber-1);
    }
    $scope.next= function() {
        if ($scope.items.pageable.pageNumber == $scope.items.totalPages-1) {
            $scope.last();
            return;
        };
        $scope.load($scope.items.pageable.pageNumber+1);
    }
        

    //Khởi đầu
    $scope.initialize();
    $scope.reset();
})