app.controller("role-ctrl", function ($scope, $http, $location) {
	$scope.items = [];
	$scope.itemsAll = [];
	$scope.user = [];
	$scope.permissions = [];
	$scope.role_p = [];
	$scope.user_r = [];
	$scope.form = {};
	$scope.cates = [];
	$scope.keyword = "";
	$scope.user_keyword = "";
	$scope.create_date;
	$scope.user_create_date;
	$scope.user_role_id = 0;
	$scope.display = -1;
	$scope.user_display = -1;
	$scope.sort = "id";

	//khởi tạo role page , role all
	$scope.initialize = function () {
		let link = url + "/rest/role/filter";
		$http.get(link).then(resp => {
			$scope.items = resp.data;
			$scope.page = $scope.items.pageable.pageNumber
		}).catch(err => {
			if (err.status == 403) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
		})

		$http.get("/rest/role").then(resp => {
			$scope.itemsAll = resp.data;
		}).catch(err => {
			if (err.status == 403) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
		})
	}

	//load trang role page  by filter, role all
	$scope.load = function (pageNumber) {
		var link = url + "/rest/role/filter?page=" + pageNumber;
		if ($scope.keyword) link += "&keyword=" + $scope.keyword;
		if ($scope.display != '-1') link += "&is_display=" + $scope.display;
		if ($scope.create_date) link += "&create_date=" + $scope.create_date.getTime();
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

		$http.get("/rest/role").then(resp => {
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

	//Load user page by filter
	$scope.loadUser = function (pageNumber) {
		var link = url + "/rest/user/filter?page=" + pageNumber;
		if ($scope.user_keyword) link += "&keyword=" + $scope.user_keyword;
		if ($scope.user_role_id > 0) link += "&role_id=" + $scope.user_role_id;
		if ($scope.user_display != '-1') link += "&is_display=" + $scope.user_display;
		$http.get(link).then(resp => {
			$scope.users = resp.data;
			console.log(link)
			console.log($scope.users)
		}).catch(err => {
			if (err.status == 403) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
		})

		$scope.loadRoleOfAllUser();
	}

	// Chia danh sách Permission
	$scope.divPermission = function (start, end) {
		let row = 20;
		return $scope.permissions.slice(start, end);
	}

	//Lấy bản ghi giữa role và permission
	$scope.permission_of = function (permission) {
		if ($scope.role_p) {
			return $scope.role_p.find(rp => rp.permission_r.id == permission.id);
		}
		return null;
	}

	//Lấy tất cả bản ghi giữa role và permission
	$scope.loadPerOfRole = function (item) {
		$http.get(url + '/rest/role/permission/' + item.id).then(resp => {
			$scope.role_p = resp.data;
		}).catch(err => {
			if (err.status == 405) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}

		})
	}

	//Lấy tất cả bản ghi giữa role và permission
	$scope.loadRoleOfAllUser = function () {
		$http.get(url + '/rest/user/role/all').then(resp => {
			console.log(resp.data);
			$scope.user_r = resp.data;
		}).catch(err => {
			if (err.status == 405) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			}

		})
	}

	// Thay đổi trạng thái cấp Permission cho Role
	$scope.permission_changed = function (role, permission) {

		var r_permission = $scope.permission_of(permission);

		if (r_permission) {
			$scope.revoke_permission(r_permission);
		} else {
			r_permission = { role_p: role, permission_r: permission };
			$scope.grant_permission(r_permission);
		}
	}

	//Thêm Permission cho Role
	$scope.grant_permission = function (role_per) {
		$http.post(`/rest/role/permission/create`, role_per).then(resp => {
			$scope.loadPerOfRole(resp.data.role_p);
			$scope.showToast('info', 'Grant permission <b>' + role_per.permission_r.display_name + '</b> to role <b>' + role_per.role_p.display_name + "</b>!!");
			$scope.showToast('info', 'Grant permission <b>' + role_per.permission_r.display_name + '</b> to role <b>' + role_per.role_p.display_name + "</b>!!");
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
	$scope.revoke_permission = function (role_per) {
		$http.delete(`/rest/role/permission/delete/${role_per.id}`).then(resp => {
			$scope.loadPerOfRole(role_per.role_p);
			$scope.showToast('dark', 'Revoked permission <b>' + role_per.permission_r.display_name + '</b> from role <b>' + role_per.role_p.display_name + "</b>!!");
			$scope.showToast('dark', 'Revoked permission <b>' + role_per.permission_r.display_name + '</b> from role <b>' + role_per.role_p.display_name + "</b>!!");
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


	//Lấy bản ghi giữa user và role
	$scope.authority_of = function (acc, role) {
		if ($scope.user_r) {
			return $scope.user_r.find(ur => ur.user_r.id == acc.id && ur.role_u.id == role.id)
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
			$scope.loadRoleOfAllUser();
			$scope.showToast('info', 'Grant role <b>' + authority.role_u.display_name + '</b> to user <b>' + authority.user_r.username + "</b>!!");
		}).catch(err => {
			console.log("Error ", err);
			$scope.showToast('danger', 'Authorization failed! ');
		})
	}

	//Xoá authority
	$scope.revoke_authority = function (authority) {
		$http.delete(`/rest/user/role/delete/${authority.id}`).then(resp => {
			$scope.loadRoleOfAllUser();
			$scope.showToast('dark', 'Revoked role <b>' + authority.role_u.display_name + '</b> from user <b>' + authority.user_r.username + "</b>!!");
		}).catch(err => {
			console.log("Error ", err);
			$scope.showToast('danger', "Permission has been revoked failed!");
		})
	}


	//Xoá form
	$scope.reset = function () {
		$scope.form = {
			id: '',
			name: '',
		}
	}

	$scope.tab = function (tab) {
		document.getElementById(tab).click();
	}

	//Hiển thị lên form
	$scope.edit = function (item) {
		$scope.form = angular.copy(item);
		$scope.showToast('warning', 'Edit role <b>' + $scope.form.display_name + "</b>");
		$scope.loadPerOfRole(item);

		$scope.tab('tab2');
	}

	//Thêm vai trò
	$scope.create = function () {
		var item = angular.copy($scope.form);
		item.is_display = item._display;
		item._display = null;
		console.log(item)
		$http.post(url + '/rest/role/create', item).then(resp => {
			$scope.load(0);
			$scope.edit(resp.data)
			$scope.showToast('success', 'Add new role successful <b>' + item.display_name + "</b>");
			console.log(resp.data);
		}).catch(err => {
			if (err.status == 405) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			} else {
				$scope.showToast('danger', 'Add new role failed <b>' + item.display_name + "</b>");
				console.log("Error ", err);
			}

		})
	}

	//Update vai trò
	$scope.update = function () {
		var item = angular.copy($scope.form);
		$http.put(url + '/rest/role/update/' + item.id, item).then(resp => {
			$scope.load(0);
			$scope.showToast('info', 'Update role successful <b>' + item.display_name + "</b>");
			console.log(resp.data);
		}).catch(err => {
			if (err.status == 405) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			} else {
				$scope.showToast('danger', 'Update new role failed <b>' + item.display_name + "</b>");
				console.log("Error ", err);
			}
		})
	}

	//Remove vai trò
	$scope.delete = function (item) {
		$http.delete(url + `/rest/role/delete/${item.id}`).then(resp => {
			$scope.load(0);
			$scope.reset();
			$scope.showToast('dark', 'Delete role successful <b>' + item.display_name + "</b>");
			console.log(resp.data);
		}).catch(err => {
			if (err.status == 405) {
				$scope.showToast('danger', "You are not authorized to perform this action!!!");
				//$location.path("/unauthorized");
			} else {
				$scope.showToast('danger', 'Delete role failed <b>' + item.display_name + "</b>");
				console.log("Error ", err);
			}
		})
	}

	//Upload Hình


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




	$scope.user_first = function () {
		$scope.loadUser(0);
	}

	$scope.user_last = function () {
		$scope.loadUser($scope.users.totalPages - 1);
	}
	$scope.user_previous = function () {
		if ($scope.users.pageable.pageNumber <= 0) {
			$scope.first();
			return;
		};
		$scope.loadUser($scope.users.pageable.pageNumber - 1);
	}
	$scope.user_next = function () {
		if ($scope.users.pageable.pageNumber == $scope.users.totalPages - 1) {
			$scope.last();
			return;
		};
		$scope.loadUser($scope.users.pageable.pageNumber + 1);
	}


	//Khởi đầu
	$scope.initialize();
	$scope.loadPermission();

	$scope.reset();
})