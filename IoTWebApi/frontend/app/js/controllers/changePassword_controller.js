angular.module("app").controller('ChangePasswordController',function($scope, $location,$routeParams,ManageUserService,SessionService,AuthenticationService) {

  if(SessionService.isLoggedIn() == null &&  $routeParams.token === undefined){
    $location.path('/login');
  }  
	$scope.message = "";
	$scope.credentials = {};
	$scope.changePassword = false;
  $scope.alertClass = "";

 var onResetPasswordSuccess = function(data) {
    $location.path('/login');
  };

  //check if isUserPassword
  var onResetPasswordError = function(data) {
    $scope.message = data.exception;
  };

  $scope.hasToken = function() {
    if($scope.token!==undefined){
      if(angular.equals($scope.credentials.password,$scope.credentials.password)){
        var data = {};
        data.resetToken = $scope.token;
        data.password = $scope.credentials.password;
        AuthenticationService.resetPassWord(data).success(onResetPasswordSuccess).error(onResetPasswordError);      
      }
    }else{
       $scope.isUserPassword();
    }
  };

  var onisUserPasswordSuccess = function(data) {
    $scope.changePassword = data;
    $scope.updateUserData();
  };  
  var onisUserPasswordError = function(data) {
     $scope.message = data.exception;
  }; 
 $scope.isUserPassword = function() {
    var id = SessionService.getLoggedID();
    var password = $scope.credentials.Oldpassword;
    var user = {id:id, password: password };
    ManageUserService.isUserPassword(user).success(onisUserPasswordSuccess).error(onisUserPasswordError);
  };

  //check if isUserPassword
  $scope.isUserPassword = function() {
    var id = SessionService.getLoggedID();
    var password = $scope.credentials.Oldpassword;
    var user = {id:id, password: password };
    ManageUserService.isUserPassword(user).success(onisUserPasswordSuccess).error(onisUserPasswordError);
  };



  //update User Data
  var onUpdateUserDataSuccess = function(data) {
     $scope.alertClass = "alert alert-success";
     $scope.message = "password changed..";
  };  
  var onUpdateUserDataError = function(data) {
     $scope.message = data.exception;
  }; 
  $scope.updateUserData = function() {

    if($scope.changePassword === true){

	    var id = SessionService.getLoggedID();
	    var password = $scope.credentials.password;
	    var user = {id:id, password: password };
    	user = {user:user};
    	ManageUserService.updateUser(user).success(onUpdateUserDataSuccess).error(onUpdateUserDataError);
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


