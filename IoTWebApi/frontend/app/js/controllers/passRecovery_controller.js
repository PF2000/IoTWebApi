/*global onResetSuccess, onResetError*/

angular.module("app").controller('PassRecoveryController',function($scope, $location,AuthenticationService) {
 

$scope.message = "";
$scope.data = {email:""};

//definir variaveis para não dar erro no JSHint
var onResetSuccess, onResetError;

$scope.recover = function() {
   AuthenticationService.resetPassWord($scope.data)
    .then(function (success){
      var data = success.data;
      $location.path('/resetConfirm');

   },function (error){
      var data = error.data;
      $scope.message = data;
   });
  };
});


