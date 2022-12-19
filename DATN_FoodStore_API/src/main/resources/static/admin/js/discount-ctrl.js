app.controller("discount-ctrl", function($scope, $http,$location) {
    $scope.items = [];
    $scope.foods = [];
    $scope.food_d = {};
    $scope.form = {};
    $scope.cates = [];
    $scope.keyword ="";
    $scope.create_date;
    $scope.start_date;
    $scope.end_date;
    $scope.display=-1;
    $scope.sort="id";
    $scope.image;
    

    $scope.initialize = function() {
            //load categories
        let link =url + "/rest/discount/filter";
        $http.get(link).then(resp => {
			console.log(resp.data);
            $scope.items = resp.data;
            $scope.page = $scope.items.pageable.pageNumber
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })   
        $http.get(url + "/rest/food/all").then(resp => {
			console.log(resp.data);
            $scope.foods = resp.data;
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })     
    }

	$scope.load = function(pageNumber) {
			var link =url + "/rest/discount/filter?page="+pageNumber;
			if($scope.keyword) link +="&keyword="+ $scope.keyword ;
			if($scope.display !='-1') link +="&is_display="+ $scope.display ;
			if($scope.create_date) link +="&create_date="+ $scope.create_date.getTime() ;
			if($scope.start_date) link +="&start_date="+ $scope.start_date.getTime() ;
			if($scope.end_date) link +="&end_date="+ $scope.end_date.getTime() ;
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
    }
    
    $scope.clone = function(item) {
		$scope.showToast('warning','Edit discount <b>'+item.name+"</b>");
		item.id = null;
        $scope.form = angular.copy(item);
        $scope.loadFood(item.food_d.id);
		$scope.tab('tab2');
	}

	$scope.loadFood = function (id) {
		if ($scope.foods) {
			$scope.food_d = $scope.foods.find(f => f.id == id)
			$http.get(url + "/rest/food/image/"+id).then(resp => {
	            $scope.food_d.image_name = resp.data[0].image_name;
	            console.log($scope.food_d)
	        }).catch(err => {
	            if(err.status == 403){
					$scope.showToast('danger',"You are not authorized to perform this action!!!");
					$location.path("/unauthorized");
				}
	        })
		}
		return null;
	}

	$scope.compareDate = function(date1) {
        return Date.parse(date1)>Date.now();
    }

    //Xoá form
    $scope.reset = function() {
        $scope.form = {
            id: '',
            name: '',
        }
        $scope.food_d ="";
    }
    
    $scope.tab = function(tab) {
        document.getElementById(tab).click();
    }

    //Hiển thị lên form
    $scope.edit = function(item) {
		$scope.showToast('warning','Edit discount <b>'+item.name+"</b>");
        $scope.form = angular.copy(item);
        $scope.loadFood(item.food_d.id);
		$scope.tab('tab2');
    }

    //Thêm sản phẩm
    $scope.create = function() {
        var item = angular.copy($scope.form);
        item.is_display= item._display;
        item._display = null;
        if(!item.image_name) item.image_name = 'no_img2.jpg'
        console.log(item)
        $http.post(url + '/rest/discount/create', item).then(resp => {
            $scope.load(0);
            $scope.reset();
            $scope.showToast('success','Add new discount successful <b>'+item.name+"</b>");
            console.log(resp.data);
        }).catch(err => {
			if(err.status == 405){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}else{
				$scope.showToast('danger','Add new discount failed <b>'+item.name+"</b>");
            	console.log("Error ", err);
			}
            
        })
    }

    //Update sản phẩm
    $scope.update = function() {
        var item = angular.copy($scope.form);
        if(!item.image_name) item.image_name = 'no_img2.jpg'
        $http.put(url + '/rest/discount/update/' + item.id, item).then(resp => {
            $scope.load(0);
            $scope.showToast('info','Update discount successful <b>'+item.name+"</b>");
            console.log($scope.form);
            console.log(resp.data);
        }).catch(err => {
			if(err.status == 405){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}else{
            $scope.showToast('danger','Update new discount failed <b>'+item.name+"</b>");
            console.log("Error ", err);
            }
        })
    }

    //Remove sản phẩm
    $scope.delete = function(item) {
        $http.delete(url + `/rest/discount/delete/${item.id}`).then(resp => {
            $scope.load(0);
            $scope.reset();
            $scope.showToast('dark','Delete discount successful <b>'+item.name+"</b>");
            console.log(resp.data);
        }).catch(err => {
			if(err.status == 405){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}else{
            $scope.showToast('danger','Delete discount failed <b>'+item.name+"</b>");
            console.log("Error ", err);
            }
        })
    }
    
    //Upload Hình
    $scope.imageChanged = function(files) {
        var data = new FormData();
        data.append('file', files[0]);

        $http.post(url + '/rest/upload/images', data, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.form.image_name = resp.data.name;
            $scope.image = resp.data.name;
        }).catch(err => {
            $scope.showToast('danger','Upload image error ');
            console.log("Error ", err)
        })
    }
    
    $scope.imageRemove = function(name){
		$scope.form.image_name = null;
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