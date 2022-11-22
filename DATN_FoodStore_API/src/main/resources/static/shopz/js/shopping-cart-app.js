const app = angular.module("shopping-cart-app", []);
app.controller("shopping-cart-ctrl", function($scope, $http) {
	/*
	* QUẢN LÝ GIỎ HÀNG
	*/
	$scope.cart = {
		items: [],

		//Thêm sản phẩm vào giỏ hàng
		add(id, qty) {
			var item = this.items.find(item => item.id == id);
			console.log(qty)
			qty = qty == undefined ? 1 : qty
			if (item) {
				item.qty += qty;
				this.saveToLocalStorage();
			} else {
				$http.get(`/rest/products/${id}`).then(resp => {
					resp.data.qty = qty;
					this.items.push(resp.data);
					this.saveToLocalStorage();
				})
			}
		},
		//Xoá sản phẩm khỏi giỏ hàng
		remove(id) {
			var index = this.items.findIndex(item => item.id == id);
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},

		//Xoá sạch các mặt hàng trong giỏ
		clear() {
			this.items = [];
			this.saveToLocalStorage();
		},

		//Tính thành tiền của một sản phẩm
		amt_of(item) { },

		//Tính tổng số lượng các mặt hàng trong giỏ
		get count() {
			return this.items
				.map(item => item.qty)
				.reduce((total, qty) => total += qty, 0);
		},

		//Tổng thành tiền các mặt hàng trong giỏ
		get amount() {
			return this.items
				.map(item => item.qty * item.price)
				.reduce((total, qty) => total += Number(qty), 0);
		},
		//Lưu giỏ hàng vào local storage
		saveToLocalStorage() {
			//dùng angular để copy xong đổi các mặt hàng sang json
			var json = JSON.stringify(angular.copy(this.items));
			localStorage.setItem("cart", json);
		},

		//Đọc giỏ hàng từ local storage
		loadFromLocalStorage() {
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json) : [];
		},
	};
	$scope.cart.loadFromLocalStorage();

	$scope.order = {
		createDate: new Date(),
		address: $("#address").text(),
		status: "0",
		account: { username: $("#username").text() },
		get orderDetails() {
			return $scope.cart.items.map(item => {
				return {
					product: { id: item.id },
					price: item.price,
					quantity: item.qty
				}
			})
		},
		purchase() {
			var order = angular.copy(this);
			//Thực hiện đặt hàng
			if(order.orderDetails.length==0 || !order.address ){
				Swal.fire({
					icon: 'error',
					title: 'Đặt hàng lỗi!',
					text: order.orderDetails.length==0 ? 'Không có sản phẩm nào trong giỏ hàng!!!':"Bạn chưa nhập địa chỉ giao hàng!!!",
					showConfirmButton: false,
					timer: 1500
				});
				return 0;
			}
			$http.post("/rest/orders", order).then(resp => {
				Swal.fire({
					icon: 'success',
					title: 'Đặt hàng thành công!',
					text: 'Đơn hàng của bạn sẽ được xử lý trong vài giờ tới!!!',
					showConfirmButton: false,
					timer: 1500
				});
				$scope.cart.clear();
				setTimeout(function() {
					location.href = "/user/order/detail/" + resp.data.id;
				}, 1500);
			}).catch(err => {
				Swal.fire({
					icon: 'error',
					title: 'Đặt hàng lỗi!',
					text: 'Có một lỗi xảy ra . Vui lòng thử lại sau vài phút!!!',
					showConfirmButton: false,
					timer: 1500
				});
				console.log(err);
			})
		}
	};

})