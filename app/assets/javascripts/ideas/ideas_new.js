var Vue = require('vue');

module.exports = Vue.extend({
  template: "#ideasNewTemplate",
  methods: {
    addIdea: function(){
      this.$route.router.go('/ideas/canvas');
    }
  }
  
  
});