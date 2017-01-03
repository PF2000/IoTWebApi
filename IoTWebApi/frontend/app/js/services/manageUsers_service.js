angular.module("app").factory('ManageUserService', function($http) {
  // these routes map to stubbed API endpoints in config/server.js

  return {
    getUserRole: function() {
    	return $http.get('/v1/users');
    },
    getRoles: function() {
      return $http.get('/v1/roles');
    },
    getUser: function(id) {
      return $http.get('/v1/users/'+ id);
    },
    updateUser: function(user) {
      var id = user.user.id;
      return $http.put('/v1/users/'+ id, user);
    },
    resetApiKey: function(id) {
      return $http.get('/v1/resetApiToken/'+ id);
    },
    deleteUser: function(id) {
      return $http.delete('/v1/users/'+ id);
    },
    isUserPassword: function(user) {
      var id = user.id;
      return $http.post('/v1/isUserPassword/'+ id,user);
    }
  };
});

