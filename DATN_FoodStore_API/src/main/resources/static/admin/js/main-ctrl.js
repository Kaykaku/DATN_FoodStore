app.controller("main-ctrl", function($scope, $http, $location) {

	$scope.user = {};
	$scope.news = {};
	$scope.news2 = {};
	$scope.orz = [];
	$scope.selectedTab = {};
	$scope.permissionOfMine = [];
	
	$scope.initialize = function() {
		$http.get("/rest/user/self").then(resp => {
			$scope.user = resp.data;
			console.log(resp.data)
		})
		$http.get("/rest/permission/selfpermission/").then(resp => {
            $scope.permissionOfMine = resp.data;
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })
	}

	const toastPlacementExample = document.querySelector('.toast-placement-ex');
	let selectedType, selectedPlacement, toastPlacement;
	$scope.showToast = function(type, message) {
		function toastDispose(toast) {

			if (toast && toast._element !== null) {

				if (toastPlacementExample) {
					toastPlacementExample.classList.remove(selectedType);
					DOMTokenList.prototype.remove.apply(toastPlacementExample.classList, selectedPlacement);
				}
				toast.dispose();
			}
		}

		if (toastPlacement) {
			toastDispose(toastPlacement);
		}
		selectedType = 'bg-' + type;
		selectedPlacement = String('bottom-0 end-0').split(' ');
		document.querySelector('#messageToast').innerHTML = message;

		toastPlacementExample.classList.add(selectedType);
		DOMTokenList.prototype.add.apply(toastPlacementExample.classList, selectedPlacement);
		toastPlacement = new bootstrap.Toast(toastPlacementExample);
		toastPlacement.show();
	}
	$scope.showNew = function() {
		$http.get(url + "/rest/order").then(resp => {
			$scope.items = resp.data;
		}).then(() => {
			$scope.news = $scope.items.filter(x => {
				return x.status == 0 && x._watched == false;
			}).length
			$scope.news2 = $scope.items.filter(x => {
				return x.status == 4 && x._watched == false;
			}).length
			$scope.orz = [];
			for (let i = 0; i < 5; i++) {
				var a = $scope.items.filter(x => {
					return x.status == i;
				}).length
				$scope.orz.push(a)
			}
		})
	}
	
	$scope.checkPermisson = function(permission) {
		return $scope.permissionOfMine.find(e => e ==permission) != null;
	}
	
	$scope.loadSelfPermisson = function() {
		$http.get("/rest/permission/selfpermission/").then(resp => {
            $scope.permissionOfMine = resp.data;
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })
	}

	$scope.initialize()
	$scope.showNew()
	setInterval(() => {
		$scope.showNew();
		$scope.loadSelfPermisson();
	}, 3000)
	
})