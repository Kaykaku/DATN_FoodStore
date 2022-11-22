app.controller("order-ctrl", function($scope, $http) {
	$scope.items = [];
	$scope.form = {};
	$scope.details = [];
	$scope.total = 0;

	$scope.initialize = function() {

		$http.get(url + "/rest/orders").then(resp => {
			$scope.items = resp.data;
		})
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
		$scope.form = angular.copy(item);
		$http.get(url + "/rest/orders/detail/" + item.id).then(resp => {
			$scope.details = resp.data;
		})
		item.read1 = item.status == 0;
		item.changedate = new Date();
		if (item.status == 0) $http.put(url + '/rest/orders/' + item.id, item)
		console.log($scope.form)
		$scope.showToast('warning', 'Edit order ' + $scope.form.id);
	}
	
	$scope.edit2 = function(item) {
		$scope.form = angular.copy(item);
		$http.get(url + "/rest/orders/detail/" + item.id).then(resp => {
			$scope.details = resp.data;
		})
		item.read1 = item.status == 0;
		item.changedate = new Date();
		if (item.status == 0) $http.put(url + '/rest/orders/' + item.id, item)
	}
	
	$scope.getTotal = async function(id) {

	}

	//Thêm sản phẩm
	$scope.create = function() {
		var item = angular.copy($scope.form);
		$http.post(url + '/rest/orders', item).then(resp => {
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
		item.read1 = item.status == 0;
		item.changedate = new Date();
		$http.put(url + '/rest/orders/' + item.id, item).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id);
			$scope.items[index] = item;
			$scope.showToast('info', 'Update order successful ' + item.id);
			console.log(resp.data);
		}).catch(err => {
			$scope.showToast('danger', 'Update new order failed ' + item.id);
			console.log("Error ", err);
		})
	}
	
	$scope.updateStatus = function(itemz) {
		var item = itemz;
		item.read1 = item.status == 0;
		item.changedate = new Date();
		item.status +=1
		$http.put(url + '/rest/orders/' + item.id, item).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id);
			$scope.items[index] = item;
			$scope.showToast('info', 'Update STATUS #' + item.id);
			$scope.initialize()
			console.log(resp.data);
		}).catch(err => {
			$scope.showToast('danger', 'Update STATUS' + item.id +' ERROR');
			console.log("Error ", err);
		})
	}
	
	$scope.cancel = function(itemz) {
		var item = itemz;
		item.read1 = item.status == 0;
		item.status =4;
		item.changedate = new Date();
		$http.put(url + '/rest/orders/' + item.id, item).then(resp => {
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
		$http.delete(url + `/rest/orders/${item.id}`).then(resp => {
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

	$scope.pager = {
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
	}

	//Khởi đầu
	$scope.initialize();
	$scope.reset();

	$scope.getItems = function(status) {
		$http.get(url + "/rest/orders").then(resp => {
			$scope.items = resp.data;
		}).then(a=>{
			$scope.items = $scope.items.filter(x => {
				return x.status == status;
			}).sort((a, b) =>{
				return a.id<b.id
			})
		})
	}
})