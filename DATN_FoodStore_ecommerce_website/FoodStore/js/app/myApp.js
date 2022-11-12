var app = angular.module("myApp", ["ngRoute"]);

app.config(function ($routeProvider, $locationProvider) {
    $routeProvider
        .when("/index", { templateUrl: "index.html", controller: "indexCtrl" })
        .when("/gioiThieu", { templateUrl: "GioiThieu.html", controller: "gioiThieuCtrl"})
        .when("/lienHe", { templateUrl: "LienHe.html" })
        .when("/feedback", { templateUrl: "html/feedback.html" })
        .when("/dangNhap", { templateUrl: "html/DangNhap.html", controller: "dangNhapCtrl" })
        .when("/dangKy", { templateUrl: "html/DangKy.html", controller: "dangKyCtrl" })
        .when("/quenMatKhau", { templateUrl: "html/QuenMatKhau.html", controller: "quenMatKhauCtrl" })
        .when("/doiMatKhau", { templateUrl: "html/DoiMatKhau.html", controller: "doiMatKhauCtrl" })
        .when("/gioHang", { templateUrl: "html/DoiMatKhau.html", controller: "gioHangCtrl" })
        .otherwise({ redirectTo: "/index" });
});