var Vue = require('vue');
var TagEditor = require('./tag-editor');

module.exports = Vue.extend({
  template: "#ideasNewTemplate",
  methods: {
    addIdea: function(){
      this.$route.router.go('/ideas/canvas');
    },
    addNewIdeaAvatar: function(){
      var avatarContainer = $('#avatar');
      
      
      var reader = new FileReader();
      reader.onload = function(e){
        avatarContainer.append('<img class="img-responsive" src="'+e.target.result +'"/>');
      };
      reader.readAsDataURL($("#avatarLoader")[0].files[0]);
    },
    triggerFileInput: function(){
      $("#avatarLoader").trigger('click');
    }
  },
  components: {
    tagEditor: TagEditor
  }
  
  
});