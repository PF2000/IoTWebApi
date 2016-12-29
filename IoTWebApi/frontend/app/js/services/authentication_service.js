angular.module("app").factory('AuthenticationService', function($http,SessionService ) {
  

  return {
    login: function(credentials) {
    	return $http.post('/v1/login',credentials);
    },
    register: function(credentials) {
      return $http.post('/v1/users',credentials);
    },
    resetPassWord: function(resetData) {
      return $http.post('/v1/resetpassword',resetData);
    },
    isAdmin: function(roleName) {
      return ( roleName === "Admin" ? true : false );
    }    
  };
});

