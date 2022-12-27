const app = angular.module("shopping-cart-app", []);
app.controller("shopping-cart-ctrl", function($scope, $http) {
	/*
	* QUẢN LÝ GIỎ HÀNG
	*/
	$scope.init= function(){
		$http.get("/rest/food/image/default").then(resp => {
		      $scope.images = resp.data;
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })
        
        $http.get("/rest/discount/active").then(resp => {
		      $scope.discounts = resp.data;
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })
	}
	
	$scope.init();
	
	$scope.loadDiscount = function(item){
		if(!$scope.discounts) return '';
		 let d = $scope.discounts.find(p => p.food_d.id == item.id);
		 return d ? (d._fixed ? d.food_d.price - d.amount : d.food_d.price - d.amount * d.food_d.price/100 ) : "";
	}
	
	$scope.loadDiscount2 = function(item){
		if(!$scope.discounts) return '';
		 let d = $scope.discounts.find(p => p.food_d.id == item.id);
		 return d ? d : "";
	}
	
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
				$http.get(`/rest/food/detail/${id}`).then(resp => {
					resp.data.qty = qty;
					this.items.push(resp.data);
					this.saveToLocalStorage();
				})
				  
			}
		},
		loadImage(item){
			if(!$scope.images) return '';
			 let image = $scope.images.find(p => p.food_i.id == item.id);
			 return image ? image.image_name : "no_img2.png";
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
				.map(item => item.qty * ($scope.loadDiscount(item) ? $scope.loadDiscount(item) : item.price))
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
		order_date: new Date(),
		shipped_address: $("#address").text(),
		status: "0",
		customer_o: { username: $("#username").text() },
		get order_details() {
			return $scope.cart.items.map(item => {
				return {
					food_od: { id: item.id },
					price: item.price,
					quantity: item.qty,
					amount : $scope.loadDiscount2(item) ? $scope.loadDiscount2(item).amount : 0,
					_fixed : $scope.loadDiscount2(item) ? $scope.loadDiscount2(item)._fixed : false,
					status : 0,
					_display: true
				}
			})
		},
		purchase() {
			var order = angular.copy(this);
			//Thực hiện đặt hàng
			if(order.order_details.length==0 || !order.shipped_address ){
				Swal.fire({
					icon: 'error',
					title: 'Đặt hàng lỗi!',
					text: order.order_details.length==0 ? 'Không có sản phẩm nào trong giỏ hàng!!!':"Bạn chưa nhập địa chỉ giao hàng!!!",
					showConfirmButton: false,
					timer: 1500
				});
				return 0;
			}
			
			if(!order.paymentmethod){
				Swal.fire({
					icon: 'error',
					title: 'Đặt hàng lỗi!',
					text: 'Chưa chọn phương thức thanh toán!!!',
					showConfirmButton: false,
					timer: 1500
				});
				return 0;
			}
			$http.post("/rest/order/createOrder", order).then(resp => {
				console.log(order);
				Swal.fire({
					icon: 'success',
					title: 'Đặt hàng thành công!',
					text: 'Đơn hàng của bạn sẽ được xử lý trong 10-15 phút tới!!!',
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