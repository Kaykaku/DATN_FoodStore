app.controller("category-ctrl", function($scope, $http) {
    $scope.items = [];
    $scope.form = {};
    $scope.cates = [];
    $scope.keyword ="";
    $scope.create_date;
    $scope.displa="-1";

    $scope.initialize = function() {
            //load categories
        let link =url + "/rest/category/filter";
        $http.get(link).then(resp => {
            $scope.items = resp.data;
            $scope.page = $scope.items.pageable.pageNumber
        })
        
    }

	$scope.load = function(pageNumber) {
			var link =url + "/rest/category/filter?page="+pageNumber;
			if($scope.keyword) link +="&keyword="+ $scope.keyword ;
			if($scope.display !='-1') link +="&is_display="+ $scope.display ;
			if($scope.create_date) link +="&create_date="+ $scope.create_date.getTime() ;
	        $http.get(link).then(resp => {
            $scope.items = resp.data;
            console.log($scope.items)
        })
    }

    //Xoá form
    $scope.reset = function() {
        $scope.form = {
            id: '',
            name: '',
        }
    }

    //Hiển thị lên form
    $scope.edit = function(item) {
		$scope.showToast('warning','Edit category '+$scope.form.id);
        $scope.form = angular.copy(item);
    }

    //Thêm sản phẩm
    $scope.create = function() {
        var item = angular.copy($scope.form);
        $http.post(url + '/rest/category', item).then(resp => {
            $scope.items.push(resp.data);
            $scope.reset();
            $scope.showToast('success','Add new category successful '+item.id);
            console.log(resp.data);
        }).catch(err => {
            $scope.showToast('danger','Add new category failed '+item.id);
            console.log("Error ", err);
        })
    }

    //Update sản phẩm
    $scope.update = function() {
        var item = angular.copy($scope.form);
        $http.put(url + '/rest/category' + item.id, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.showToast('info','Update category successful '+item.id);
            console.log(resp.data);
        }).catch(err => {
            $scope.showToast('danger','Update new category failed '+item.id);
            console.log("Error ", err);
        })
    }

    //Remove sản phẩm
    $scope.delete = function(item) {
        $http.delete(url + `/rest/category/${item.id}`).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            $scope.showToast('dark','Delete category successful '+item.id);
            console.log(resp.data);
        }).catch(err => {
            $scope.showToast('danger','Delete category failed '+item.id);
            console.log("Error ", err);
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