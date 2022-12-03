app.controller("main-ctrl", function($scope, $http, $location) {

	$scope.user = {};
	$scope.news = {};
	$scope.orz = [];
	$scope.initialize = function() {
		$http.get("/rest/user").then(resp => {
			$scope.user = resp.data;
			console.log(resp.data)
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
			$scope.orz = [];
			for (let i = 0; i < 5; i++) {
				var a = $scope.items.filter(x => {
					return x.status == i;
				}).length
				$scope.orz.push(a)
			}
		})
	}

	$scope.showNew()
	setInterval(() => {
		$scope.showNew()
	}, 3000)
	$scope.initialize()
})