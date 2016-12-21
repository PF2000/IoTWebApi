 angular.module("app").controller('ManageUsersController',function($scope, $location,$route, ManageUserService,SessionService,AuthenticationService) {

$scope.alertClass = "";

  //Authentication
  $scope.isAuth = function() {
    if(!SessionService.isLoggedIn()){
        $location.path('/login');
    }
  };

 var  onGetUsersAndRolesSuccess = function(data) {
    $scope.usersRoles = data;
  };

  $scope.isAdmin = function() {
    if(!AuthenticationService.isAdmin(SessionService.getLoggedRole())){
      $location.path('/login');
    }
  };
  

  $scope.usersRoles = {};
  $scope.roles = {};


  $scope.getUsersAndRoles = function() {
     ManageUserService.getUserRole().success(onGetUsersAndRolesSuccess);    
  };
  // ---Roles
   var onGetRolesSuccess = function(data) {
    $scope.roles = data;
  };
  $scope.getRoles = function() {
     ManageUserService.getRoles().success(onGetRolesSuccess);    
  };


   //--UpdateUsers
  var onUpdateUserSuccess = function(data) {
    //update frontEnd
    $scope.alertClass = "alert alert-success";
    $scope.message = "Updated with success User with the ID = " + data.id;
  };

  var onUpdateUserError = function(data) {
    $scope.alertClass = "alert alert-danger";
    $scope.message = data;
  };
  $scope.updateUser = function(usr, rId) {
    if(rId){
     var user =  {id: usr.id ,role: {id: rId}};
      user = {user:user};
      ManageUserService.updateUser(user).success(onUpdateUserSuccess).error(onUpdateUserError);
      //resets the role id to undefined
    }
  };

  $scope.isUndefined = function(rId) {
    return (rId === undefined ) ? true : false;
 };


  //--Deletes user Button
  var onDeleteUserSuccess = function(data) {
    $scope.alertClass = "alert alert-success";
    $scope.message = "Deleted with success" ;
    //objects deleted id to update the view
    var id = data.id;
    //variavel auxiliar
    var userRoles = $scope.usersRoles;
    //Removes the objecto with the specified id
    $scope.usersRoles = userRoles.filter(function (user) {
      if (user.id === id){
       } else{
         return user;
       }    
    });
  };

  var onDeleteUserError = function(data) {
    $scope.alertClass = "alert alert-danger";
    $scope.message = data;
  };
  $scope.deleteUser = function(user) {
    //deletes the object on server side
    ManageUserService.deleteUser(user.id).success(onDeleteUserSuccess).error(onDeleteUserError);
  };


  //View user Button
  $scope.viewUser = function(user) {
      var id = user.id;
      $location.path('/managment/'+id);     
  };

  //Pagination 
    $scope.currentPage = 0;
    $scope.pageSize = 6;
    $scope.numberOfPages=function(){
        return Math.ceil($scope.usersRoles.length/$scope.pageSize);
    };

});

//http://jsfiddle.net/2ZzZB/56/
angular.module("app").filter('startFrom', function() {
    return function(input, start) {
        start = +start; //parse to int
        if(input.length > 0){
          return input.slice(start);
        }
    };
});

