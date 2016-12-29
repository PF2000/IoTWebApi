/*global onResetSuccess, onResetError*/

angular.module("app").controller('PassRecoveryController',function($scope, $location,AuthenticationService) {
 

$scope.message = "";
$scope.data = {email:""};

//definir variaveis para não dar erro no JSHint
var onResetSuccess, onResetError;

$scope.recover = function() {
   AuthenticationService.resetPassWord($scope.data)
    .success(onResetSuccess)
    .error(onResetError);
  };

  onResetSuccess = function(data) {
     $location.path('/resetConfirm');
  };
  
  onResetError = function(data) {
    $scope.message = data;
  };

});


