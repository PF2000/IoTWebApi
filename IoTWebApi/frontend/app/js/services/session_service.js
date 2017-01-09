angular.module("app").factory("SessionService", function() {
  return {
    setSession: function(authenticated) {
      return sessionStorage.setItem('authenticated', authenticated);
    },
    unsetSession: function() {
      return sessionStorage.removeItem('authenticated');
    },
    getArray: function(){
      return sessionStorage;
    },
    isLoggedIn: function() {
      return sessionStorage.getItem('authenticated');
    },
    getLoggedID: function() {
      return sessionStorage.getItem('loggedID');
    },
    setLoggedID: function(val) {
      return sessionStorage.setItem("loggedID", val);
    },
    getLoggedToken: function() {
      return sessionStorage.getItem('LoggedToken');
    },
    setLoggedToken: function(val) {
      return sessionStorage.setItem("LoggedToken", val);
    },
    getLoggedRole: function() {
      return sessionStorage.getItem('LoggedRole');
    },
    setLoggedRole: function(val) {
      return sessionStorage.setItem("LoggedRole", val);
    },
    getLoggedName: function() {
      return sessionStorage.getItem('LoggedName');
    },
    setLoggedName: function(val) {
      return sessionStorage.setItem("LoggedName", val);
    }
  };
});