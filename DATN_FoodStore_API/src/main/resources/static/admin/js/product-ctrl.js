app.controller("product-ctrl", function($scope, $http) {
    $scope.items = [];
    $scope.form = {};
    $scope.cates = [];

    $scope.initialize = function() {
        //load products
        $http.get(url + "/rest/products").then(resp => {
                $scope.items = resp.data;
                $scope.items.forEach(item => {
                    item.createDate = new Date(item.createDate);
                })
            })
            //load categories
        $http.get(url + "/rest/categories").then(resp => {
            $scope.cates = resp.data;
        })
    }

    //Xoá form
    $scope.reset = function() {
        $scope.form = {
            createDate: new Date(),
            image: 'no_img2.jpg',
            available: true,
        }
    }

    //Hiển thị lên form
    $scope.edit = function(item) {
        $scope.form = angular.copy(item);
        $scope.showToast('warning','Edit category '+$scope.form.id);
    }

    //Thêm sản phẩm
    $scope.create = function() {
        var item = angular.copy($scope.form);
        $http.post(url + '/rest/products', item).then(resp => {
            resp.data.createDate = new Date(resp.data.createDate);
            $scope.items.push(resp.data);
            $scope.reset();
            $scope.showToast('success','Add new product successful '+item.id);
            console.log(resp.data);
        }).catch(err => {
            $scope.showToast('danger','Add new product failed '+item.id);
            console.log("Error ", err);
        })
    }

    //Update sản phẩm
    $scope.update = function() {
        var item = angular.copy($scope.form);
        $http.put(url + '/rest/products/' + item.id, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.showToast('info','Update product successful '+item.id);
            console.log(resp.data);
        }).catch(err => {
            $scope.showToast('danger','Update new product failed '+item.id);
            console.log("Error ", err);
        })
    }

    //Remove sản phẩm
    $scope.delete = function(item) {
        $http.delete(url + `/rest/products/${item.id}`).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            $scope.showToast('dark','Delete product successful '+item.id);
            console.log(resp.data);
        }).catch(err => {
            $scope.showToast('danger','Delete product failed '+item.id);
            console.log("Error ", err);
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
            $scope.form.image = resp.data.name;
        }).catch(err => {
            $scope.showToast('danger','Upload image error ');
            console.log("Error ", err)
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
})