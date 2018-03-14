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
    .get("/searches?term=" + this.$route.query.term)
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
      }
    };
  },
  created: function() {
    axios.get("/artists/" + this.$route.params.id)
    .then(function(response) {
      this.artist = response.data;
    }.bind(this));
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

var LoginAndSignupPage = {
  template: "#login-page",
  data: function() {
    return { 
              loginEmail: "",
              loginPassword: "",
              loginErrors: [],
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
    login: function(newParams = 0) {
      console.log("hello")
      var params = {};
      if (newParams === 1) {
       params = { auth: {
        email: this.loginEmail,
        password: this.loginPassword    
        }
      };  
      } else {
        params = newParams;
      }
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

    },
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
        params = { auth: { email: this.signupEmail, password: this.signupPassword }};
        this.login(params);
      })
      .catch(function(error) {
        this.signupErrors = error.response.data.errors;
      }.bind(this));
    }
  },
  computed: {}
};



var router = new VueRouter({
  routes: [{ path: "/", component: HomePage },
           { path: "/searches", component: SearchPage },
           { path: "/artists", component: ArtistsIndexPage },
           { path: "/artists/:id", component: ArtistsShowPage },
           { path: "/records/:id", component: RecordsShowPage },
           { path: "/login/", component: LoginAndSignupPage}],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});