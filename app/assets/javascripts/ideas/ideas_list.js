var Vue = require('vue');

module.exports = Vue.extend({
  template: "#ideasTemplate",
  ready: function(){
    this.$http.get('ideas.json').then(function(response){
      this.ideas = response.data;
    }, function(response){
        
      console.log(JSON.stringify(response));
    });
  },
  data: function() {
    return {
      ideas: [],
      newIdea: {
        name: "",
        description: ""
      }
    };
  },
  methods: {
    addIdea: function() {
      var _idea = {
        name: this.newIdea.name,
        description: this.newIdea.description
      };
      this.ideas.push(_idea); 
      this.newIdea.name = "";
      this.newIdea.description = "";
    }
  }
});