app = angular.module("admin-app", ["ngRoute"]);

var url = 'http://localhost:8080'

app.config(function($routeProvider) {
    $routeProvider
        .when("/product", {
            templateUrl: "../html/product/product.html",
            controller: "product-ctrl"
        })
        .when("/administrator", {
            templateUrl: "../html/administrator/administrator.html",
            controller: "administrator-ctrl"
        })
        .when("/customer", {
            templateUrl: "../html/customer/customer.html",
            controller: "customer-ctrl"
        })
        .when("/administrator", {
            templateUrl: "../html/administrator/administrator.html",
            controller: "administrator-ctrl"
        })
        .when("/customer", {
            templateUrl: "../html/customer/customer.html",
            controller: "customer-ctrl"
        .when("/category", {
            templateUrl: "../html/category/category.html",
            controller: "category-ctrl"
        })
        .when("/order", {
            templateUrl: "../html/order/order.html",
            controller: "order-ctrl"
        })
        .when("/order_confirm", {
            templateUrl: "../html/order/order_confirm.html",
            controller: "order-ctrl"
        })
        .when("/order_packing", {
            templateUrl: "../html/order/order_packing.html",
            controller: "order-ctrl"
        })
        .when("/order_shipping", {
            templateUrl: "../html/order/order_shipping.html",
            controller: "order-ctrl"
        })
        .when("/order_success", {
            templateUrl: "../html/order/order_success.html",
            controller: "order-ctrl"
        })
        .when("/order_cancel", {
            templateUrl: "../html/order/order_cancel.html",
            controller: "order-ctrl"
        })
        .when("/dashboard", {
            templateUrl: "../html/dashboard/dashboard.html",
            controller: "dashboard-ctrl"
        })
        .when("/authority", {
            templateUrl: "../html/authority/authority.html",
            controller: "authority-ctrl"
        })
        .when("/role", {
            templateUrl: "../html/authority/role.html",
            controller: "role-ctrl"
        })
        .when("/unauthorized", {
            templateUrl: "../html/authority/unauthorized.html",
            controller: "authority-ctrl"
        })
        .otherwise({
            redirectTo: "/dashboard",
            controller: "dashboard-ctrl"
        })
})