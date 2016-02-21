var Vue = require('vue');

module.exports = Vue.extend({
  template: "#ideasTemplate",
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