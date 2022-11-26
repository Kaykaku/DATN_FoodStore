app.controller("administrator-ctrl", function ($scope, $http, $location) {
    $scope.items = [];
    $scope.user_roles = [];
    $scope.user_permissions = [];
    $scope.form = {};
    $scope.keyword = "";
    $scope.create_date;
    $scope.birthday;
    $scope.gender = -1;
    $scope.display = -1;
    $scope.sort = "id";
    $scope.avatar;
    $scope.role_id = 0;

    $scope.initialize = function () {
        //load categories
        let link = url + "/rest/user/filter";
        $http.get(link).then(resp => {
            $scope.items = resp.data;
            $scope.page = $scope.items.pageable.pageNumber
        }).catch(err => {
            if (err.status == 403) {
                $scope.showToast('danger', "You are not authorized to perform this action!!!");
                $location.path("/unauthorized");
            }
        })

        $http.get("/rest/role/all").then(resp => {
            $scope.itemsAll = resp.data;
        }).catch(err => {
            if (err.status == 403) {
                $scope.showToast('danger', "You are not authorized to perform this action!!!");
                $location.path("/unauthorized");
            }
        })
    }

    $scope.load = function (pageNumber) {
        var link = url + "/rest/user/filter?page=" + pageNumber;
        if ($scope.keyword) link += "&keyword=" + $scope.keyword;
        if ($scope.display != -1) link += "&is_display=" + $scope.display;
        if ($scope.create_date) link += "&create_date=" + $scope.create_date.getTime();
        if ($scope.birthday) link += "&birthday=" + $scope.birthday.getTime();
        if ($scope.gender != -1) link += "&gender=" + $scope.gender;
        if ($scope.role_id > 0) link += "&role_id=" + $scope.role_id;
        if ($scope.sort) link += "&sort=" + $scope.sort;
        $http.get(link).then(resp => {
            $scope.items = resp.data;
            console.log($scope.items)
        }).catch(err => {
            if (err.status == 403) {
                $scope.showToast('danger', "You are not authorized to perform this action!!!");
                $location.path("/unauthorized");
            }
        })
    }

    //Xoá form
    $scope.reset = function () {
        $scope.form = {
            id: '',
            name: '',
        }
        $scope.avatar = "";
    }

    $scope.tab = function (tab) {
        document.getElementById(tab).click();
    }

    //Hiển thị lên form
    $scope.edit = function (item) {
        $http.get("/rest/user/role/" + item.id).then(resp => {
            $scope.user_roles = resp.data;
        }).catch(err => {
            if (err.status == 403) {
                $scope.showToast('danger', "You are not authorized to perform this action!!!");
                $location.path("/unauthorized");
            }
        })

        $http.get("/rest/user/permission/" + item.id).then(resp => {
            $scope.user_permissions = resp.data;
            console.log($scope.user_permissions);
        }).catch(err => {
            if (err.status == 403) {
                $scope.showToast('danger', "You are not authorized to perform this action!!!");
                $location.path("/unauthorized");
            }
        })

        $scope.form = angular.copy(item);
        $scope.showToast('warning', 'Edit user <b>' + $scope.form.username + "</b>");

        $scope.avatar = "";
        $scope.tab('tab2');
    }

    //Thêm sản phẩm
    $scope.create = function () {
        var item = angular.copy($scope.form);
        item.is_display = item._display;
        item._display = null;
        if (!item.avatar) item.avatar = 'user.png'
        console.log(item)
        $http.post(url + '/rest/user/create', item).then(resp => {
            $scope.load(0);
            $scope.reset();
            $scope.showToast('success', 'Add new user successful ' + item.id);
            console.log(resp.data);
        }).catch(err => {
            if (err.status == 405) {
                $scope.showToast('danger', "You are not authorized to perform this action!!!");
                //$location.path("/unauthorized");
            } else {
                $scope.showToast('danger', 'Add new user failed ' + item.id);
                console.log("Error ", err);
            }

        })
    }

    //Update sản phẩm
    $scope.update = function () {
        var item = angular.copy($scope.form);
        if (!item.avatar) item.avatar = 'user.png'
        $http.put(url + '/rest/user/update/' + item.id, item).then(resp => {
            $scope.load(0);
            $scope.showToast('info', 'Update user successful ' + item.id);
            console.log(resp.data);
        }).catch(err => {
            if (err.status == 405) {
                $scope.showToast('danger', "You are not authorized to perform this action!!!");
                //$location.path("/unauthorized");
            } else {
                $scope.showToast('danger', 'Update new user failed ' + item.id);
                console.log("Error ", err);
            }
        })
    }

    //Remove sản phẩm
    $scope.delete = function (item) {
        $http.delete(url + `/rest/user/delete/${item.id}`).then(resp => {
            $scope.load(0);
            $scope.reset();
            $scope.showToast('dark', 'Delete user successful ' + item.id);
            console.log(resp.data);
        }).catch(err => {
            if (err.status == 405) {
                $scope.showToast('danger', "You are not authorized to perform this action!!!");
                //$location.path("/unauthorized");
            } else {
                $scope.showToast('danger', 'Delete user failed ' + item.id);
                console.log("Error ", err);
            }
        })
    }

    //Upload Hình
    $scope.imageChanged = function (files) {
        var data = new FormData();
        data.append('file', files[0]);

        $http.post(url + '/rest/upload/avatars', data, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.form.avatar = resp.data.name;
            $scope.avatar = resp.data.name;
        }).catch(err => {
            $scope.showToast('danger', 'Upload image error ');
            console.log("Error ", err)
        })
    }

    $scope.imageRemove = function (name) {
        $scope.form.avatar = null;
    }

    $scope.first = function () {
        $scope.load(0);
    }

    $scope.last = function () {
        $scope.load($scope.items.totalPages - 1);
    }
    $scope.previous = function () {
        if ($scope.items.pageable.pageNumber <= 0) {
            $scope.first();
            return;
        };
        $scope.load($scope.items.pageable.pageNumber - 1);
    }
    $scope.next = function () {
        if ($scope.items.pageable.pageNumber == $scope.items.totalPages - 1) {
            $scope.last();
            return;
        };
        $scope.load($scope.items.pageable.pageNumber + 1);
    }


    //Khởi đầu
    $scope.initialize();
    $scope.reset();
})