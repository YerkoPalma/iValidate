$(document).ready(function(){
  var Vue = require('vue');
  var VueRouter = require('vue-router');
  
  Vue.use(require('vue-resource'));
  Vue.use(require('vue-router'));
  
  /**
   *  Components
   */
  var IdeasList = require('./ideas/ideas_list');
  
  /**
   *  Main Vue App, not an instance because of the router
   */
  var IdeasApp = Vue.extend({});
  
  /**
   *  Vue Router
   */
  var router = new VueRouter();
   
  router.map({
    '/ideas': {
      component: IdeasList
    }
  });
  
  router.alias({
        //to have a root path
        '/': '/ideas'
    });
  
  router.start(IdeasApp, '#ideasapp');
});