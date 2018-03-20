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
    return { pages: 3,
             artists: []
    };
  },
  created: function() {
    axios.get("/artists/")
    .then(function(response) {
      this.artists = response.data;
    }.bind(this));
  },
  methods: {
    setPage: function(page) {
      var number = page;
      axios.get("/artists/?page=" + number)
      .then(function(response) {
        this.artists = response.data;
      }.bind(this));
    },
    nextPagination: function() {
      this.pages = this.pages + 3;
      this.setPage(this.pages - 2);
    },
    prevPagination: function() {
      if (this.pages > 3) {
        this.pages = this.pages - 3;
        this.setPage(this.pages - 2);
      }
    }
  },
  computed: {}
};

var ArtistsShowPage = {
  template: "#artists-show-page",
  data: function() {
    return {
      artist: {
        records: [{title:"", release_year:""}]
      },
      currentRecord: {record_images: [{image_url: "", tracklist: []}]},
      price: "",
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
    addToCollection: function(status) {
      var list = status;
      var params = {record_id: this.currentRecord.id, 
                    price: this.price,
                    status: list };
      axios
      .post("/user_records", params)
      .then(function(response) {
      });
    },

  },
};

var RecordsIndexPage = {
  template: "#records-index-page",
  data: function() {
    return { pages: 3,
             records: [],
             currentRecord: {},
             price: ""
    };
  },
  created: function() {
    axios.get("/records/")
    .then(function(response) {
      this.records = response.data;
    }.bind(this));
  },
  methods: {
    setPage: function(page) {
      var number = page;
      axios.get("/records/?page=" + number)
      .then(function(response) {
        this.records = response.data;
      }.bind(this));
    },
    nextPagination: function() {
      this.pages = this.pages + 3;
      this.setPage(this.pages - 2);
    },
    prevPagination: function() {
      if (this.pages > 3) {
        this.pages = this.pages - 3;
        this.setPage(this.pages - 2);
      }
    },
    setCurrentRecord: function(record) {
      this.currentRecord = record;
    },
    addToCollection: function(status) {
      var list = status;
      var params = {record_id: this.currentRecord.id, 
                    price: this.price,
                    status: list };
      axios
      .post("/user_records", params)
      .then(function(response) {
      });
    },
  },
  computed: {}
};



var RecordsShowPage = {
  template: "#records-show-page",
  data: function() {
    return {
      record: {
        genres: [{name: ""}, {images: []}]
      },
      currentRecord: {image_url: "", tracklist: [] },
      price: ""
    };
  },
  methods: {
    setCurrentRecord: function(record) {
      this.currentRecord = record;
    },
    addToCollection: function(status) {
      var list = status;
      var params = {record_id: this.currentRecord.id, 
                    price: this.price,
                    status: list };
      axios
      .post("/user_records", params)
      .then(function(response) {
      });
    }
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
      collection: [],
      wishList: [],
      totalAmount: 0,
      fifty: 0,
      sixty: 0,
      seventy: 0,
      eighty: 0,
      ninety: 0,
      hundred: 0,
      ten: 0,
      genres: {},
      pieGenres: []

    };
  },
  updated: function () {
    this.$nextTick(function () {
      console.log(this.genres);
      //reset models when page updates
      this.fifty = 0;
      this.sixty = 0;
      this.seventy = 0;
      this.eighty = 0;
      this.ninety = 0;
      this.hundred = 0;
      this.ten = 0;
      this.genres = {},
      this.pieGenres = []
      this.totalAmount = this.collection.map(function(record) {
        return record.integer_price;
      }).reduce(function(accumulator,currentVal){
        return accumulator + currentVal;
      });

      //create decade models
      this.collection.forEach(function(record) {
        record.genres.forEach(function(genre) {
          console.log(genre);
          if (this.genres[genre] === 1) {
            this.genres[genre] = this.genres[genre] + 1;
          } else {
            this.genres[genre] = 1;
          }
        }.bind(this));       
   
        if (record.release_year < 1960) {
          this.fifty += 1;
        } else if (record.release_year >= 1960 && record.release_year < 1970) {
          this.sixty += 1;
        } else if (record.release_year >= 1970 && record.release_year < 1980) {
          this.seventy += 1;
        } else if (record.release_year >= 1980 && record.release_year < 1990) {
          this.eighty += 1;
        } else if (record.release_year >= 1990 && record.release_year < 2000) {
          this.ninety += 1;
        } else if (record.release_year >= 2000 && record.release_year < 2010) {
          this.hundred += 1;
        } else if (record.release_year >= 2010) {
          this.ten += 1;
        }
      }.bind(this));
      for (var key in this.genres) {
        this.pieGenres.push([key, this.genres[key], false]);
      }
      var $el = $( '.coverflow' ).coverflow({
        active : 1,
        visibleAside: 2
      });
 
    $( window ).resize( debounce( function() {
      $el.coverflow();
    }, 20, true ));
      
      Highcharts.chart('pieChart', {

          title: {
              text: 'Music by Genre'
          },

          xAxis: {
              categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
          },

          series: [{
              type: 'pie',
              allowPointSelect: true,
              keys: ['name', 'y', 'selected', 'sliced'],
              data: this.pieGenres,
              showInLegend: true
          }]
      });

      Highcharts.chart('decadesChart', {

          chart: {
              type: 'column'
          },

          title: {
              text: 'Music by Decades'
          },
          xAxis: {
                    categories: ["Decades", "60s", "70s", "80s", "90s", "2000s", "2010s"]
                  },
          yAxis: [{
              className: 'highcharts-color-0',
              title: {
                  text: 'Number of Records'
              }
          }],

          plotOptions: {
              column: {
                  borderRadius: 5
              }
          },

           series: [{
               name: '50s',
               data: [this.fifty]

           }, {
               name: '60s',
               data: [this.sixty]

           }, {
               name: '70s',
               data: [this.seventy]

           }, {
               name: '80s',
               data: [this.eighty]

           }, {
               name: '90s',
               data: [this.ninety]
           }, {
               name: '2000s',
               data: [this.hundred ]   
           }, {
               name: '2010s',
               data: [this.ten ]    
           }]

      });
      })
    },
    created: function() {
      // window.location.reload(true);
      axios.get("/user_records/")
      .then(function(response) {
        console.log(response.data);
        this.collection = response.data.filter(function(record) {
          return record.status === "owned";
        });
        this.wishList = response.data.filter(function(record) {
          return record.status === "wish_list";


        });
      }.bind(this));



  },

  methods: {
    removeRecord: function(record) {
      axios
      .delete("/user_records/" + record.id)
      .then(function(response) {
        this.collection = response.data.filter(function(record) {
          return record.status === "owned";
        });
        this.wishList = response.data.filter(function(record) {
          return record.status === "wish_list";
        });
      }.bind(this));
    }
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
           { path: "/records/", component: RecordsIndexPage },
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






