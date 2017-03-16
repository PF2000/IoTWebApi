angular.module("app").controller('LoginController',function($scope, $location, AuthenticationService,SessionService) {
  
$scope.alertClass = "";

  $scope.isAuth = function() { 
    if(SessionService.isLoggedIn()){
      $location.path('/managment/'+ SessionService.getLoggedID());
    }
  };

  $scope.login = function() {

    AuthenticationService.login($scope.credentials)    
    .then(function (success){
      var data = success.data;
      //Sets the id on session
      SessionService.setLoggedID(data.id);
      //Sets the token on session to be used on comunication with API
      SessionService.setLoggedToken(data.api_key); 
      //Sets the Role on session vaeriable
      SessionService.setLoggedRole(data.role.name); 
      //Sets the name
      SessionService.setLoggedName(data.name + " " + data.surname); 
      SessionService.setSession(true);
      $location.path('/managment/'+ data.id );

   },function (error){
      var data = error.data;
      $scope.alertClass = "alert alert-danger";
      $scope.message = data;
   });

  };

});


