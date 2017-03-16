angular.module("app").controller('ChangePasswordController',function($scope, $location,$routeParams,ManageUserService,SessionService,AuthenticationService) {

  if(SessionService.isLoggedIn() == null &&  $routeParams.token === undefined){
    $location.path('/login');
  }  
	$scope.message = "";
	$scope.credentials = {};
	$scope.changePassword = false;
  $scope.alertClass = "";


  $scope.hasToken = function() {
    if($scope.token!==undefined){
      if(angular.equals($scope.credentials.password,$scope.credentials.password)){
        var data = {};
        data.resetToken = $scope.token;
        data.password = $scope.credentials.password;
        //resets the passwords
        AuthenticationService.resetPassWord(data)
        .then(function (success){
          var data = success.data;
          $location.path('/login');    
         },function (error){
            var data = error.data;
            $scope.message = data.exception;
         });      
      }
    }else{
       $scope.isUserPassword();
    }
  };


 $scope.isUserPassword = function() {
    var id = SessionService.getLoggedID();
    var password = $scope.credentials.Oldpassword;
    var user = {id:id, password: password };

    ManageUserService.isUserPassword(user)
    .then(function (success){
      var data = success.data;
      $scope.changePassword = data;
      $scope.updateUserData();
    },function (error){
      var data = error.data;
      $scope.message = data.exception;
    });

  };

  $scope.updateUserData = function() {

    if($scope.changePassword === true){

	    var id = SessionService.getLoggedID();
	    var password = $scope.credentials.password;
	    var user = {id:id, password: password };
    	user = {user:user};
    	ManageUserService.updateUser(user)
      .then(function (success){
        var data = success.data;
        $scope.alertClass = "alert alert-success";
        $scope.message = "password changed..";
      },function (error){
        var data = error.data;
        $scope.message = data.exception;
      });

    }else{
    	$scope.message = "password dont match..";
    }
  };


$scope.$on('$routeChangeSuccess', function() {
    // $routeParams will be populated here if
    // this controller is used outside ng-view
    $scope.token = $routeParams.token;
    if($scope.token!==undefined){
      $scope.showOldPass = false;
    }else {
      $scope.showOldPass = true;
    }
  });


});


