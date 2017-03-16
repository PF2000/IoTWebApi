angular.module("app").controller('managmentController', function($scope, $location,$routeParams, SessionService,AuthenticationService, ManageUserService) {
  $scope.credentials ={};

  $scope.readOnly = true;
  $scope.changePassword = false;
  $scope.alertClass = "";
 
  //Authentication
  $scope.isAuth = function() {
    if(!SessionService.isLoggedIn()){
        $location.path('/login');
    }
  };


   //--GetUser 
  $scope.getUser = function () {
      //gets the id from the route
      var id = $routeParams.id;
      //protection for users. Only admins can view all profiles
      if( !($scope.isAdmin() || SessionService.getLoggedID() === id) ){
        id=SessionService.getLoggedID();
      }
      ManageUserService.getUser(id)
        .then(function (success){
          var data = success.data;
          $scope.credentials = data;
          //$scope.message = "Success...";

       },function (error){
          var data = error.data;
          $scope.message = data.exception;
       });
  }; 


  //Reset token --------
  $scope.resetToken = function() {
    var id = $scope.credentials.id;
    ManageUserService.resetApiKey(id)
      .then(function (success){
        var data = success.data;
         $scope.credentials.api_key = data.api_key;
         //sets the new token on session
         SessionService.setLoggedToken(data.api_key); 
         $scope.message = "New token generated...";
     },function (error){
        var data = error.data;
        $scope.message = data.exception;
     });
  }; 


  //update User Data
  $scope.updateUserData = function() {
    var user = $scope.credentials;
    user = {user:user};
    delete user.user['api_key'];
    delete user.user['role'];
    ManageUserService.updateUser(user)
    .then(function (success){
      var data = success.data;
     $scope.alertClass = "alert alert-success";
     $scope.credentials = data;
     $scope.message = "Data update success...";
     $scope.editUserData(); 

   },function (error){
      var data = error.data;
      $scope.alertClass = "alert alert-danger";
      $scope.message = data;
   });
  };


  //Edit Button
  $scope.editUserData = function() {
    $scope.readOnly = ( $scope.readOnly === true ? false : true);
  };

  //Navigation----
  $scope.changePassword = function() {
    $location.path('/changePassword');
  };
  $scope.logout = function() {
    SessionService.unsetSession();
    $location.path('/login');
  };

  $scope.canChangePassword = function() {
    return ((SessionService.getLoggedID() === $routeParams.id) ? true : false);
  };

  $scope.isAdmin = function() {
   return AuthenticationService.isAdmin(SessionService.getLoggedRole()) ;
  };

});

