app.controller("administrator-ctrl", function ($scope, $http, $location) {
    $scope.items = [];
    $scope.user_roles = [];
    $scope.user_permissions = [];
    $scope.permissions = [];
    $scope.roles = [];
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
    
    //load all perrmission
	$scope.loadPermission = function () {
		var link = url + "/rest/permission/filter/all?";
		$http.get(link).then(resp => {
			$scope.permissions = resp.data;
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
        $scope.user_roles='';
        $scope.user_permissions='';
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
    
    //Lấy bản ghi giữa user và role
	$scope.authority_of = function (acc, role) {
		if ($scope.user_roles) {
			return $scope.user_roles.find(ur => ur.role_u.id == role.id)
		}
		return null;
	}
	
	$scope.permission_of = function (permission) {
		if ($scope.user_permissions) {
			return $scope.user_permissions.find(up => up.permission_u.id == permission.id);
		}
		return null;
	}

	// Thay đổi trạng thái cấp Role cho User
	$scope.authority_changed = function (acc, role) {

		var authority = $scope.authority_of(acc, role);
		if (authority) {//đã cấp quyền => thu hồi quyền (xoá)
			$scope.revoke_authority(authority);
		} else {//chưa cấp quyền => cấp quyền mới
			authority = { user_r: acc, role_u: role };
			$scope.grant_authority(authority);
		}
	}
	
	//Thêm mới authority
	$scope.grant_authority = function (authority) {
		$http.post(`/rest/user/role/create`, authority).then(resp => {
			$scope.edit(authority.user_r);
			$scope.showToast('info', 'Grant role <b>' + authority.role_u.display_name + '</b> to user <b>' + authority.user_r.username + "</b>!!");
		}).catch(err => {
			console.log("Error ", err);
			$scope.showToast('danger', 'Authorization failed! ');
		})
	}

	//Xoá authority
	$scope.revoke_authority = function (authority) {
		$http.delete(`/rest/user/role/delete/${authority.id}`).then(resp => {
			$scope.edit(authority.user_r);
			$scope.showToast('dark', 'Revoked role <b>' + authority.role_u.display_name + '</b> from user <b>' + authority.user_r.username + "</b>!!");
		}).catch(err => {
			console.log("Error ", err);
			$scope.showToast('danger', "Permission has been revoked failed!");
		})
	}
	
		// Thay đổi trạng thái cấp Permission cho Role
	$scope.permission_changed = function (user, permission) {

		var u_permission = $scope.permission_of(permission);

		if (u_permission) {
			$scope.revoke_permission(u_permission);
		} else {
			u_permission = { user_p: user, permission_u: permission };
			$scope.grant_permission(u_permission);
		}
	}

	//Thêm Permission cho Role
	$scope.grant_permission = function (user_per) {
		$http.post(`/rest/user/permission/create`, user_per).then(resp => {
			$scope.edit(user_per.user_p);
			$scope.showToast('info', 'Grant permission <b>' + user_per.permission_u.display_name + '</b> to user <b>' + user_per.user_p.username + "</b>!!");
		}).catch(err => {
			if (err.status == 405) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			} else {
				console.log("Error ", err);
				$scope.showToast('danger', 'Authorization failed! ');
			}

		})
	}

	//Xoá Permission khỏi Role
	$scope.revoke_permission = function (user_per) {
		$http.delete(`/rest/user/permission/delete/${user_per.id}`).then(resp => {
			$scope.edit(user_per.user_p);
			$scope.showToast('dark', 'Revoked permission <b>' + user_per.permission_u.display_name + '</b> from user <b>' + user_per.user_p.username + "</b>!!");
		}).catch(err => {
			if (err.status == 405) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			} else {
				console.log("Error ", err);
				$scope.showToast('danger', "Permission has been revoked failed!");
			}

		})
	}
	
	$scope.divPermission = function (start, end) {
		let row = 20;
		return $scope.permissions.slice(start, end);
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

    $scope.imageRemove = function () {
        $scope.form.avatar = null;
        $scope.avatar = null;
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