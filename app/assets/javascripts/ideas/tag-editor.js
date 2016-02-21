var Vue = require('vue');

module.exports = Vue.extend({
  template: "#tagEditor",
  data: function() {
    return {
      tags: []
    };
  },
  methods: {
    addTag: function() {
      var tag = $('#newIdeaTag').val();
      this.tags.push(tag);
      $('#newIdeaTag').val("");
    },
    deleteTag: function() {
      if ( $('#newIdeaTag').val().trim() !== '' ) {
        this.tags.pop();
      }  
    }
  }
});