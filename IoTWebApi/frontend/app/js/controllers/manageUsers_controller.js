 angular.module("app").controller('ManageUsersController',function($scope, $location,$route, ManageUserService,SessionService,AuthenticationService) {

$scope.alertClass = "";

  //Authentication
  $scope.isAuth = function() {
    if(!SessionService.isLoggedIn()){
        $location.path('/login');
    }
  };


  $scope.isAdmin = function() {
    if(!AuthenticationService.isAdmin(SessionService.getLoggedRole())){
      $location.path('/login');
    }
  };
  
  $scope.usersRoles = {};
  $scope.roles = {};


  $scope.getUsersAndRoles = function() {
     ManageUserService.getUserRole()
     .then(function (success){
        var data = success.data;
        $scope.usersRoles = data;
      });  
  };

  $scope.getRoles = function() {
     ManageUserService.getRoles()
      .then(function (success){
        var data = success.data;
        $scope.roles = data;
      }); 
  };


  $scope.updateUser = function(usr, rId) {
    var roleId = rId == undefined?usr.role.id:rId;
    var user =  {id: usr.id ,token_count:usr.token_count ,email: usr.email ,role: {id: roleId}};
    user = {user:user};
    ManageUserService.updateUser(user)
    .then(function (success){
      var data = success.data;
      //update frontEnd
      $scope.alertClass = "alert alert-success";
      $scope.message = "Updated with success User with the ID = " + data.id;
   },function (error){
      var data = error.data;
      $scope.alertClass = "alert alert-danger";
      $scope.message = data;
   });    
  };

  $scope.isUndefined = function(rId) {
    return (rId === undefined ) ? true : false;
 };


  $scope.deleteUser = function(user) {
    //deletes the object on server side
    ManageUserService.deleteUser(user.id)
    .then(function (success){
      var data = success.data;
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
    },function (error){
      var data = error.data;
      $scope.alertClass = "alert alert-danger";
      $scope.message = data;
    });
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

