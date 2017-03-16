angular.module("app").controller('RegisterController',function($scope, $location, AuthenticationService) {
  
  $scope.credentialsRegister = { user:{ name: "",surname: "", password: "", email: ""}};



  $scope.register = function() {
    AuthenticationService.register($scope.credentialsRegister)
      .then(function (success){
        var data = success.data;
        $location.path('/login');

     },function (error){
        var data = error.data;
        $scope.message = data;
     });
  };

});


