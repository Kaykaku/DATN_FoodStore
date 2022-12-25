app.controller("history-ctrl", function($scope, $http,$location) {
    $scope.items = [];
    $scope.tables = [];
    $scope.users = [];
    $scope.form = {};
    $scope.keyword ="";
    $scope.create_date;
    $scope.table_name="All";
    $scope.user_id ='0';
    $scope.sort="id";
    
    $scope.initialize = function() {
        let link =url + "/rest/history/filter?";
        $http.get(link).then(resp => {
			console.log(resp.data);
            $scope.items = resp.data;
            $scope.page = $scope.items.pageable.pageNumber
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        }) 
        
        $http.get(url + "/rest/history/tablename").then(resp => {
			console.log(resp.data);
            $scope.tables = resp.data;
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })   
        $http.get(url + "/rest/user/all").then(resp => {
			console.log(resp.data);
            $scope.users = resp.data;
        }).catch(err => {
            if(err.status == 403){
				$scope.showToast('danger',"You are not authorized to perform this action!!!");
				$location.path("/unauthorized");
			}
        })        
    }

	$scope.load = function(pageNumber) {
			var link =url + "/rest/history/filter?page="+pageNumber;
			if($scope.keyword) link +="&keyword="+ $scope.keyword ;
			if($scope.create_date) link +="&create_date="+ $scope.create_date.getTime() ;
			if($scope.table_name) link +="&table_name="+ $scope.table_name ;
			if($scope.user_id>0) link +="&user_id="+ $scope.user_id;
			if($scope.sort) link +="&sort="+ $scope.sort ;
	        $http.get(link).then(resp => {
	            $scope.items = resp.data;
	            console.log($scope.items)
	        }).catch(err => {
	            if(err.status == 403){
					$scope.showToast('danger',"You are not authorized to perform this action!!!");
					$location.path("/unauthorized");
				}
	        })
    }

    $scope.reset = function() {
        $scope.form = {
            id: '',
            name: '',
        }
    }
    
    $scope.tab = function(tab) {
        //document.getElementById(tab).click();
    }

    $scope.edit = function(item) {
		//$scope.showToast('warning','Edit category '+$scope.form.id);
        $scope.form = angular.copy(item);
		$scope.tab('tab2');
    }

     $scope.first= function() {
            $scope.load(0);
     }
     
     $scope.last= function() {
        	$scope.load($scope.items.totalPages-1);
     }
    $scope.previous= function() {
        if ($scope.items.pageable.pageNumber <= 0) {
            $scope.first();
            return;
        };
        $scope.load($scope.items.pageable.pageNumber-1);
    }
    $scope.next= function() {
        if ($scope.items.pageable.pageNumber == $scope.items.totalPages-1) {
            $scope.last();
            return;
        };
        $scope.load($scope.items.pageable.pageNumber+1);
    }
        

    //Khởi đầu
    $scope.initialize();
    $scope.reset();
})