app.controller("order-ctrl", function($scope, $http) {
	$scope.items = [];
	$scope.form = {};
	$scope.details = [];
	$scope.total = 0;

	$scope.keyword ="";
    $scope.create_date;
    $scope.display=-1;
    $scope.sort="id";
    $scope.status=-1;

	$scope.initialize = function() {

		$scope.load(0); 
		
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
	
	$scope.load = function(pageNumber) {
		var link =url + "/rest/order/filter?page="+pageNumber;
		if($scope.keyword) link +="&keyword="+ $scope.keyword ;
		if($scope.display !='-1') link +="&is_display="+ $scope.display ;
		if($scope.status >= 0) link +="&status="+ $scope.status ;
		if($scope.create_date) link +="&create_date="+ $scope.create_date.getTime() ;
		if($scope.sort) link +="&sort="+ $scope.sort ;
		console.log(link)
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

	$scope.loadImageD = function(item){
		if(!$scope.images) return '';
		 let image = $scope.images.find(p => p.food_i.id == item.id);
		 return image ? image.image_name : "";
	}


	//Xoá form
	$scope.reset = function() {
		$scope.form = {
			id: '',
			username: '',
			createDate: '',
			address: '',
			status: 0,
		}
		$scope.details = [];
		$scope.total = 0;
	}

	//Hiển thị lên form
	$scope.edit = function(item) {
		$scope.total=0;
		$scope.form = angular.copy(item);
		$http.get(url + "/rest/order/detail/" + item.id).then(resp => {
			$scope.details = resp.data;
		})
		item._watched = item.status == 0;
		item.changedate = new Date();
		if (item.status == 0) $http.put(url + '/rest/order/' + item.id, item)
		console.log($scope.form)
		$scope.tab('tab2');
		$scope.showToast('warning', 'Edit order ' + $scope.form.id);
	}
	
	$scope.edit2 = function(item) {
		$scope.total=0;
		$scope.form = angular.copy(item);
		$http.get(url + "/rest/order/detail/" + item.id).then(resp => {
			$scope.details = resp.data;
		})
		item._watched = item.status == 0;
		item.changedate = new Date();
		if (item.status == 0) $http.put(url + '/rest/order/' + item.id, item)
	}
	
	$scope.getTotal = async function(id) {

	}
	
	$scope.tab = function(tab) {
        document.getElementById(tab).click();
    }

	//Thêm sản phẩm
	$scope.create = function() {
		var item = angular.copy($scope.form);
		$http.post(url + '/rest/order/create', item).then(resp => {
			$scope.items.push(resp.data);
			$scope.reset();
			$scope.showToast('success', 'Add new order successful ' + item.id);
			console.log(resp.data);
		}).catch(err => {
			$scope.showToast('danger', 'Add new order failed ' + item.id);
			console.log("Error ", err);
		})
	}

	//Update sản phẩm
	$scope.update = function() {
		var item = angular.copy($scope.form);
		item._watched = item.status == 0;
		item.changedate = new Date();
		$http.put(url + '/rest/order/update/' + item.id, item).then(resp => {
			$scope.load(0);
			$scope.showToast('info', 'Update order successful ' + item.id);
			console.log(resp.data);
		}).catch(err => {
			$scope.showToast('danger', 'Update new order failed ' + item.id);
			console.log("Error ", err);
		})
	}
	
	$scope.updateStatus = function(itemz) {
		var item = itemz;
		item._watched = item.status == 0;
		item.changedate = new Date();
		item.status +=1
		$http.put(url + '/rest/order/update/' + item.id, item).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id);
			$scope.items[index] = item;
			$scope.showToast('info', 'Update STATUS #' + item.id);
			$scope.initialize()
			$scope.getItems(item.status-1);
			console.log(resp.data);
		}).catch(err => {
			$scope.showToast('danger', 'Update STATUS' + item.id +' ERROR');
			console.log("Error ", err);
		})
	}
	
	$scope.cancel = function(itemz) {
		var item = itemz;
		item._watched = item.status == 0;
		item.status =4;
		item.changedate = new Date();
		$http.put(url + '/rest/order/' + item.id, item).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id);
			$scope.items[index] = item;
			$scope.showToast('info', 'Cancel ORDER #' + item.id);
			$scope.initialize()
			console.log(resp.data);
		}).catch(err => {
			$scope.showToast('danger', 'Cancel ORDER #' + item.id +' ERROR');
			console.log("Error ", err);
		})
	}

	//Remove sản phẩm
	$scope.delete = function(item) {
		$http.delete(url + `/rest/order/delete/${item.id}`).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id);
			$scope.items.splice(index, 1);
			$scope.reset();
			$scope.showToast('dark', 'Delete order successful ' + item.id);
			console.log(resp.data);
		}).catch(err => {
			$scope.showToast('danger', 'Delete order failed ' + item.id);
			console.log("Error ", err);
		})
	}

	/*$scope.pager = {
		page: 0,
		size: 10,
		get items() {
			var start = this.page * this.size;
			return $scope.items.slice(start, start + this.size);
		},
		get count() {
			return Math.ceil(1.0 * $scope.items.length / this.size);
		},
		first() {
			this.page = 0;
		},
		previous() {
			this.page--;
			if (this.page < 0) {
				this.last();
			};
		},
		next() {
			this.page++;
			if (this.page >= this.count) {
				this.first();
			};
		},
		last() {
			this.page = this.count - 1;
		},
	}*/
	
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