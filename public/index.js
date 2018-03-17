/* global Vue, VueRouter, axios */
var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SearchPage = {
  template: "#search-page",
  data: function() {
    return {
      results: []
    };
  },
  created: function() {
    axios
    .get(this.$route.fullPath)
    .then(function(response) {
      this.results = response.data;
    }.bind(this));
  },
  methods: {
  },
  computed: {}
};

var ArtistsIndexPage = {
  template: "#artists-index-page",
  data: function() {
    return {
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var ArtistsShowPage = {
  template: "#artists-show-page",
  data: function() {
    return {
      artist: {
        images: [{image_url:""}],
        records: [{title:"", release_year:"", record_images: []}]
      },
      currentRecord: {record_images: [{image_url: "", tracklist: []}]},
      price: ""
    };
  },
  created: function() {
    axios.get("/artists/" + this.$route.params.id)
    .then(function(response) {
      this.artist = response.data;
    }.bind(this));
  },
  methods: {
    setCurrentRecord: function(record) {
      this.currentRecord = record;
    },
    addToCollection: function() {
      var params = {record_id: this.currentRecord.id, 
                    price: this.price,
                    status: 0 }
      axios
      .post("/user_records", params)
      .then(function(response) {
        
      });
    }
  },
  computed: {
   groupedRecords: function() {
    console.log("HELLO WORLD")
    console.log(_.chunk(this.artist.records, 3))
    }
  }
};


var RecordsShowPage = {
  template: "#records-show-page",
  data: function() {
    return {
      record: {
        genres: [{name: ""}, {images: []}]
      }
    };
  },
  created: function() {
    axios.get("/records/" + this.$route.params.id)
    .then(function(response) {
      this.record = response.data;
    }.bind(this));
  }

};

var UsersShowPage = {
  template: "#users-show-page",
  data: function() {
    return {
      records: []
    };
  },
  created: function() {
    axios.get("/user_records/")
    .then(function(response) {
      this.records = response.data;
    }.bind(this));
  }

};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return { 
              loginEmail: "",
              loginPassword: "",
              loginErrors: []
    };
  },
  created: function() {},
  methods: {
    login: function() {
      var params = {};
       params = { auth: {
        email: this.loginEmail,
        password: this.loginPassword    
        }
      };  
      axios
      .post("/user_token", params)
      .then(function(response) { 
        axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
      .catch(function(error) {
        this.loginErrors = ["Invalid email or password"];
        this.loginEmail = "";
        this.loginPassword = "";
      }.bind(this));

    }
  },
  computed: {}
};


var SignupPage = {
  template: "#signup-page",
  data: function() {
    return { 
              signupEmail: "",
              signupPassword: "",
              signupPasswordConfirmation: "",
              signupFirstName: "",
              signupLastName: "",
              signupErrors: []
    };
  },
  created: function() {},
  methods: {
    signup: function() {
      var params = {
      first_name: this.signupFirstName,
      last_name: this.signupLastName,  
      email: this.signupEmail,
      password: this.signupPassword,
      password_confirmation: this.signupPasswordConfirmation
      };
      axios
      .post("/users", params)
      .then(function(response) {
        router.push("/");
      })
      .catch(function(error) {
        this.signupErrors = error.response.data.errors;
      }.bind(this));
    }
  },
  computed: {}
};

var LogoutPage = {
  template: "#logout-page",
    created: function() {
      axios.defaults.headers.common["Authorization"] = undefined;
      localStorage.removeItem("jwt");
      router.push("/");
    },
  };


var router = new VueRouter({
  routes: [{ path: "/", component: HomePage },
           { path: "/searches", component: SearchPage },
           { path: "/artists", component: ArtistsIndexPage },
           { path: "/artists/:id", component: ArtistsShowPage },
           { path: "/records/:id", component: RecordsShowPage },
           { path: "/users/", component: UsersShowPage },
           { path: "/login/", component: LoginPage},
           { path: "/signup/", component: SignupPage},
           { path: "/logout/", component: LogoutPage}],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  data: function() {
    return {term: "",
            results: []
          }
  },
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  },
  methods: {
    search: function() {
      router.push({ path: '/searches', query: { term: this.term }});
      this.results = [];
     },
     getResults: function() {
      if ( this.term === "") {
       this.results = [];
      }
      else {   
      axios
      .get("/searches?term=" + this.term)
      .then(function(response) {
        this.results = response.data;
      }.bind(this));}
    
     }
    }
});