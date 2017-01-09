angular.module("app").controller('HeaderController',function($scope, $location,$routeParams,SessionService,ManageUserService,AuthenticationService) {
  
  $scope.name = "";

	
  $scope.isLoggedIn = function() {
  	var loggedIn = SessionService.isLoggedIn();
  	if(loggedIn){
  		$scope.name = "Bem Vindo "+ SessionService.getLoggedName() + " !";
  	}
	return loggedIn;
  };

  $scope.logout = function() {
    SessionService.unsetSession();
    $location.path('/login');
  };

  $scope.goToUserManagment = function() {
   var id = SessionService.getLoggedID();
    $location.path('/managment/'+id );
  };

  $scope.isAdmin = function() {
   return AuthenticationService.isAdmin(SessionService.getLoggedRole()) ;
  };

  	
});