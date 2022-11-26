app.controller("customer-ctrl", function($scope, $http,$location) {
    $scope.items = [];
    $scope.phones = [];
    $scope.addresses = [];
    $scope.cus_phone_add = [];
    $scope.form = {};
    $scope.keyword ="";
    $scope.create_date;
    $scope.birthday;
    $scope.gender = -1;
    $scope.display=-1;
    $scope.sort="id";
    $scope.avatar;

    $scope.initialize = function() {
            //load categories
        let link =url + "/rest/customer/filter";
        $http.get(link).then(resp => {
            $scope.items = resp.data;
            $scope.page = $scope.items.pageable.pageNumber
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })   
        
        $http.get("/rest/customer/phone/default").then(resp => {
            $scope.phones = resp.data;
            console.log(resp.data);
            
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })  
	        
        $http.get("/rest/customer/address/default").then(resp => {
        $scope.addresses = resp.data;
        console.log(resp.data);
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })     
    }

	$scope.load = function(pageNumber) {
			var link =url + "/rest/customer/filter?page="+pageNumber;
			if($scope.keyword) link +="&keyword="+ $scope.keyword ;
			if($scope.display !=-1) link +="&is_display="+ $scope.display ;
			if($scope.create_date) link +="&create_date="+ $scope.create_date.getTime() ;
			if($scope.birthday) link +="&birthday="+ $scope.birthday.getTime() ;
			if($scope.gender!=-1) link +="&gender="+ $scope.gender ;
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
	        
	        $http.get("/rest/customer/phone/default").then(resp => {
            $scope.phones = resp.data;
            console.log(resp.data);
	        }).catch(err => {
	            if(err.status == 403){
					$scope.showToast('danger',"You are not authorized to perform this action!!!");
					$location.path("/unauthorized");
				}
	        })  
	        
	        $http.get("/rest/customer/address/default").then(resp => {
            $scope.addresses = resp.data;
            console.log(resp.data);
	        }).catch(err => {
	            if(err.status == 403){
					$scope.showToast('danger',"You are not authorized to perform this action!!!");
					$location.path("/unauthorized");
				}
	        })  
    }
    
    $scope.loadPhoneD = function(item){
		 let phone = $scope.phones.find(p => p.customer_pa.id == item.id);
		 return phone ? phone.phone_or_address : "";
	}
	
	$scope.loadAddressD = function(item){
		 let address = $scope.addresses.find(p => p.customer_pa.id == item.id);
		 return address ? address.phone_or_address : "";
	}

    //Xoá form
    $scope.reset = function() {
        $scope.form = {
            id: '',
            name: '',
        }
        $scope.avatar ="";
    }
    
    $scope.tab = function(tab) {
        document.getElementById(tab).click();
    }

    //Hiển thị lên form
    $scope.edit = function(item) {
		$http.get("/rest/customer/contact/"+item.id).then(resp => {
            $scope.cus_phone_add = resp.data;
            console.log(resp.data)
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })  
        
        $scope.form = angular.copy(item);
		$scope.showToast('warning','Edit customer <b>'+$scope.form.username+"</b>");
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
        $http.post(url + '/rest/customer/create', item).then(resp => {
            $scope.load(0);
            $scope.reset();
            $scope.showToast('success','Add new customer successful <b>'+item.username+"</b>");
            console.log(resp.data);
        }).catch(err => {
			if(err.status == 405){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}else{
				$scope.showToast('danger','Add new customer failed <b>'+item.username+"</b>");
            	console.log("Error ", err);
			}
            
        })
    }

    //Update sản phẩm
    $scope.update = function() {
        var item = angular.copy($scope.form);
        if(!item.avatar) item.avatar = 'user.png'
        $http.put(url + '/rest/customer/update/' + item.id, item).then(resp => {
            $scope.load(0);
            $scope.showToast('info','Update customer successful <b>'+item.username+"</b>");
            console.log(resp.data);
        }).catch(err => {
			if(err.status == 405){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}else{
            $scope.showToast('danger','Update new customer failed <b>'+item.username+"</b>");
            console.log("Error ", err);
            }
        })
    }

    //Remove sản phẩm
    $scope.delete = function(item) {
        $http.delete(url + `/rest/customer/delete/${item.id}`).then(resp => {
            $scope.load(0);
            $scope.reset();
            $scope.showToast('dark','Delete customer successful <b>'+item.username+"</b>");
            console.log(resp.data);
        }).catch(err => {
			if(err.status == 405){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}else{
            $scope.showToast('danger','Delete customer failed <b>'+item.username+"</b>");
            console.log("Error ", err);
            }
        })
    }
    
    //Upload Hình
    $scope.imageChanged = function(files) {
        var data = new FormData();
        data.append('file', files[0]);

        $http.post(url + '/rest/upload/avatars', data, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.form.avatar = resp.data.name;
            $scope.avatar = resp.data.name;
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