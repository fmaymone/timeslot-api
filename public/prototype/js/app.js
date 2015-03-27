var app = {};
app.landing = {};
app.settings = {};
app.locationSearch = {};


app.init = function() {
    console.log('initialize app');
    app.imageCloudURL = 'http://res.cloudinary.com/einselbst/image/upload/';
}();

function log(value) {
    // console.log(value);
    return value;
}

app.setCurrentUser = function(user) {
    console.log('set current user');
    console.log(user);
    app.current_user = user;
    app.current_user.authToken = user.authToken;
    app.redirectHome();
};

app.xhrConfig = function(xhr) {
    xhr.setRequestHeader("Content-Type", "application/json");
    if (app.current_user) {
        xhr.setRequestHeader("Authorization", "Token token=" + app.current_user.authToken);
    }
};

app.redirectHome = function(value) {
    console.log('redirect home');
    m.route("/me");
};

app.redirectToGroups = function(value) {
    console.log('redirect groups');
    m.route("/groups");
};

app.cloudinary = {};

app.cloudinary.model = function(data) {
    this.apiKey = m.prop(data.apiKey);
    this.signature = m.prop(data.signature);
    this.publicId = m.prop(data.publicId);
    this.timestamp = m.prop(data.timestamp);
};

app.getCloudinarySignature = function() {
    console.log('getting cloudinary signature');
    var deferred = m.deferred();

    deferred.resolve(m.request({ method: "GET",
                                 config: app.xhrConfig,
                                 url: "/v1/media-signature",
                                 type: app.cloudinary.model
                               }).then(log));

    return deferred.promise;

    // return m.request({ method: "GET",
    //                    config: app.xhrConfig,
    //                    url: "/v1/media-signature",
    //                    type: app.cloudinary.model
    //                  }).then(log);//.then(app.uploadToCloudinary);
};

// http://jsfiddle.net/2psha3v6/3/
// http://lhorie.github.io/mithril-blog/drag-n-drop-file-uploads.html
app.cloudinary.upload = function(value) {
    console.log('upload better');

    var formData = new FormData();
    formData.append("file", this.imageFile()[0]);
    formData.append("api_key", value.apiKey());
    formData.append("signature", value.signature());
    formData.append("public_id", value.publicId());
    formData.append("timestamp", value.timestamp());

    var deferred = m.deferred();

    return m.request({
        method: "POST",
        url: "https://api.cloudinary.com/v1_1/einselbst/image/upload",
        data: formData,
        serialize: function(value) {return value;}
    }).then(log).then(this.cloudinaryResponse);
};


app.nav = function(data) {
    var vm = data.vm;

    return m("nav", {type: "toolbar", role: "navigation"}, [
        m("ul", [
            function() {
                if(data.back)
                    return m("li.back", { onclick: app.browserBack }, "Back");
                if(data.goToMe)
                    return m("li", {class: "back"}, [
                        m("a[href='/me']", { config: m.route }, "Back")
                    ]);
                if(data.cancel)
                    return m("li.", { onclick: app.browserBack }, "Cancel");

            }(),
            function() {
                if(data.center) {
                    return m("li", {class: "center startdate"}, [
                        m("a[href='/#']",
                          { config: m.route }, data.center)
                    ]);
                }
            }(),
            function() {
                if(data.edit)
                    return m("li", {class: "edit"}, [
                        m("a[href='/slots/" + vm.slot().id() + "/edit']",
                          { config: m.route },
                          "Edit")
                    ]);
                if(data.done)
                    return m("li.done",
                             { onclick: data.doneAction },
                             "Done");
            }(),
        ])
    ]);
};

app.navCancel = function(target) {
    return m("nav", {type: "toolbar", role: "navigation"}, [
        m("ul", [
            m("li.cancel", { onclick: app.browserBack }, "Cancel")
        ])
    ]);
};

app.backNav = function(data) {
    return m("nav", {type: "toolbar", role: "navigation"}, [
        m("ul", [
            // m("li", {class: "back", onclick: test}, "Back")
            m("li.back",
              { onclick: (data && data.action) ? data.action : app.browserBack },
              "Back"),
            (data && data.title) ? m("li", {class: "center"}, data.title) : ''

            // [
            // m("a[href=" + target + "]", {config: m.route}, "Back")
            // m("a[href=#]", { onclick: app.browserBack()}, "Back")
            // m("input[type=button]", {

            // ])
        ])
    ]);
};

app.browserBack = function() {
    window.history.back();
};


m.toggle = function (prop) {
    return function(evt) { prop(!prop()); };
};

////// landing page

app.landing.controller = function() {};

app.landing.body = function() {
    return [
        m('h1', 'Welcome to Timeslot'),
        m('h4', 'Discover, design and share your time.'),
        m("a[href='/me']", { config: m.route }, [
            m('p', 'Continue without registration')
        ])
    ];
};

app.landing.menu = function() {
    return m("menu", { type: "toolbar", class: "landing-menu" }, [
        m("li", [
            m("a[href='/signup']", { id: 'join', config: m.route }, "Join Timeslot")
        ]),
        m("li", [
            m("a[href='/signin']", { id: 'login', config: m.route }, "Log in")
        ])
    ]);
};

app.landing.view = function() {
    document.title = "Welcome to Timeslot";
    return [
        m("main.landing", app.landing.body()),
        m("footer", app.landing.menu())
    ];
};

////// settings page

app.settings = {
    controller: function() {},
    view: function() {
        document.title = "Welcome to Timeslot";
        return m("main.settings", [
            m('br'),
            m("a[href='/']", { config: m.route }, "Landing Page"),
            m('br'),
            m('br'),
            m("a[href='/me']", { config: m.route }, "Me"),
            m('br'),
            m('br'),
            m("a[href='/users']", { config: m.route }, "Find Friends"),
        ]);
    }
};

////// location search

app.locationSearch = {
    controller: function() {
        console.log('location search controller');

        var vm = app.locationSearch.vm;
        vm.init();
    },
    view: function(ctrl) {
        document.title = "Location Search";

        return [
            m("header", app.backNav({
                action: m.toggle(ctrl.toggleClass), title: 'Add a location'})),
            m("main", app.locationSearch.form())
        ];
    }
};

app.locationSearch.form = function() {
    var vm = app.locationSearch.vm;

    return m(".locationSearch", [
        vm.addressAC.view({data: vm.addresses, binds: vm.selectedAddress})
        // vm.projectAC.view({data: vm.projects, binds: vm.selectedProject}),
    ]);
};


app.locationSearch.query = function(term) {
    log('location query');
    var url = "/v1/locations/search?q=" + term + "&limit=7"; // &pos=13.0,52.0";

    return m.request({
        method: "GET",
        url: url,
        config: app.xhrConfig
    }).then(log).then(app.locationSearch.vm.addresses);
};

app.locationSearch.vm = function() {
    var vm = {};

    vm.init = function(data) {
        vm.addresses = m.prop([]);
        vm.selectedAddress = data.binds;//m.prop();
        vm.addressAC = new autocompleter({data: vm.addresses});

        // vm.projects = m.prop([{id: 1, name: "John's project"}, {id: 2, name: "Bob's project"}, {id: 2, name: "Mary's project"}]);
        // vm.selectedProject = m.prop();
        // vm.projectAC = new autocompleter();
    };
    return vm;
}();


///// pikaday

app.pikaday  = function(data){
    return function( el, isInitialized ){
        // This function runs whenever the view is re-rendered.
        // We only want its content to execute when this element
        // is being generated the first time.
        if( isInitialized ){
            console.log('is initialized');
            return;
        }

        new Pikaday( {
            defaultDate : moment(),
            field       : el,
            onSelect    : function (){
                // Except here, where we bind Pikaday's events back to
                // the Mithril model
                data.binds( moment(this.getDate()) );
                m.redraw();
                // inputElem.value = muiU.dateToIso(this.getDate());
                // el.dispatchEvent(new Event("change"));
                // m.redraw();
            }
        } );
    };
};
