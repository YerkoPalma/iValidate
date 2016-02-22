$(document).ready(function(){
  var Vue = require('vue');
  var VueRouter = require('vue-router');
  
  Vue.use(require('vue-resource'));
  Vue.use(require('vue-router'));
  Vue.config.debug = true;
  
  
 
  /**
   *  Components
   */
  var IdeasList = require('./ideas/ideas_list');
  var NewIdea = require('./ideas/ideas_new');   
  var CanvasIdea = require('./ideas/ideas_canvas');  

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
    },
    '/ideas/new': {
      component: NewIdea
    },
    '/ideas/:id/canvas': {
      component: CanvasIdea
    }
  });
  
  router.alias({
        //to have a root path
        '/': '/ideas'
    });
  
  router.start(IdeasApp, '#ideasapp');
});