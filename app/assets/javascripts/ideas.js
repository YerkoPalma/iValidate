$(document).ready(function(){
  var Vue = require('vue');
  var VueRouter = require('vue-router');
  
  Vue.use(require('vue-resource'));
  Vue.use(require('vue-router'));
  
  /**
   *  Components
   */
  
  /**
   *  Main Vue App, not an instance because of the router
   */
  var IdeasApp = Vue.extend({});
  
  /**
   *  Vue Router
   */
  var router = new VueRouter();
  
  router.map({
    //'/ideas': {
    //  component: UsersList
    //}
  });
  
  router.start(IdeasApp, '#ideasapp');
});