var Vue = require('vue');
var TagEditor = require('./tag-editor');

module.exports = Vue.extend({
  template: "#ideasNewTemplate",
  data: function(){
    return {
      idea: {
        avatar: "",
        name: "",
        description: "",
        contact: "",
        tags: []
      }
    };
  },
  methods: {
    addIdea: function(){
      
      //only the tags need to be obtained
      this.idea.tags = this.$children[0].tags;
      
      //the avatar might not be set
      if (this.idea.avatar === "") this.idea.avatar = 'http://placehold.it/230x150';
      
      this.$http.post(
        'ideas.json', //path
        {idea: this.idea}, //data
        {headers: { //options
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
        }
      ).then( 
        function(response) {
        //success 
        //get the id to save the canvas model later
        var _id = response.data._id;
        
        this.$route.router.go('/ideas/' + _id + '/canvas');
      }, function (response) {
          //error
          console.log(JSON.stringify(response.data));
          this.$route.router.go('/');
      });
    },
    addNewIdeaAvatar: function(){
      var avatarContainer = $('#avatar');
      var vm = this;
      
      var reader = new FileReader();
      reader.onload = function(e){
        avatarContainer.append('<img class="img-responsive" src="'+e.target.result +'"/>');
        vm.idea.avatar = e.target.result;
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