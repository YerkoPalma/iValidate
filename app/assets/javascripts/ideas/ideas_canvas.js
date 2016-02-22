var Vue = require('vue');

module.exports = Vue.extend({
  template: "#ideasCanvasTemplate",
  data: function() {
    return {
      canvas: {
        key_partners: {
          description: "",
          tags: []
        },
        key_activities: {
          description: "",
          tags: []
        },
        key_resources: {
          description: "",
          tags: []
        },
        value_propositions: {
          description: "",
          tags: []
        },
        customer_relationships: {
          description: "",
          tags: []
        },
        channels: {
          description: "",
          tags: []
        },
        customer_segments: {
          description: "",
          tags: []
        },
        cost_structures: {
          description: "",
          tags: []
        },
        revenue_streams: {
          description: "",
          tags: []
        }
      }
    };
  },
  methods: {
    saveCanvas: function(){
      var _id = this.$route.params.id;
      
      this.$http.post(
        'ideas/' + _id + '/model.json', //path
        {canvas: this.canvas}, //data
        {headers: { //options
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
        }
      ).then( 
        function(response) {
        //success 
        
        this.$route.router.go('/');
      }, function (response) {
          //error
          console.log(JSON.stringify(response.data));
          this.$route.router.go('/');
      });
    }
  }
  
  
  
});