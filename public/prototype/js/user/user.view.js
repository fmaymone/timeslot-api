// Me Page
moment.locale('en', {
    calendar : {
        lastDay : '[Yesterday]',
        sameDay : '[Today]',
        nextDay : '[Tomorrow]',
        lastWeek : '[last] dddd',
        nextWeek : 'dddd',
        sameElse : 'dddd D MMMM'
    }
});

// moment.locale('de', {
//     calendar : {
//         lastDay : '[Gestern]',
//         sameDay : '[Heute]',
//         nextDay : '[Morgen]',
//         lastWeek : '[letzten] dddd',
//         nextWeek : 'dddd',
//         sameElse : 'L'
//     }
// });

User.me.body = function(ctrl) {
    var vm = User.me.vm;

    return m('.user', [
        m('a[href="/users/' + app.current_user.id() +'"]', {config: m.route}, [
            m("figure#userImage", [
                m("img.user", {
                    src: (vm.user().image()) ? app.imageCloudURL + vm.user().image() : ''
                }),
            ])
        ]),
        function() {
            if(vm.slots().length == 0) return '';
            return [
                m('.slotListMenu', [
                    m("h2.calDate", vm.slots()[vm.earliestVisibleSlotIndex()].startDate().calendar()),
                ]),
                m("ul.slotList", { class: 'list', onscroll: vm.updateCurrentDay }, [
                    vm.slots().map( function(slot, i) {
                        console.log('slot is here');
                        // console.log(slot);
                        // console.log(i);
                        slotlistLayout = [
                            m('a[href="/slots/' + slot.id() +'"]', {config: m.route}, [
                                function() {
                                    if ((i == 0) ||
                                        (slot.startdate() != vm.slots()[i-1].startdate()))
                                        return m('time', slot.startDate().format('H:mm'));
                                }(),
                                m('.slotImg', [
                                    m('figure', [
                                        m('img', { src: (slot.photos().length > 0) ? slot.photos()[0].clyid : '' })
                                    ])
                                ]),
                                m('h2', slot.title()),
                                m('small', slot.visibility())
                            ])
                        ];
                        return [
                            function() {
                                if(i==0) return;
                                var currentSlotDate = moment(slot.startDate().format('YYYY-MM-DD'));
                                var lastSlotDate = vm.slots()[i-1].startDate().format('YYYY-MM-DD');

                                if(!(currentSlotDate.isSame(lastSlotDate)))
                                    return m('li.calDate.list-item', slot.startDate().calendar());
                            }(),
                            m('li.slot', {class: 'list-item', key: slot.id}, slotlistLayout)
                        ];

                    })
                ])
            ];
        }()
    ]);
};

User.me.nav = function() {
    return m("nav", {type: "toolbar", role: "navigation"}, [
        m("ul", [
            m("li", {id: "settings"}, [
                // m("a[href='/filter_slotlist']", {config: m.route}, "Filter")
                m("a[href='/settings']", {
                    title: "Go to Settings",
                    config: m.route
                }, "Filter")
            ]),
            m("li", {class: "center"}),
            m("li", {id: "add"}, [
                m("a[href='/slots/new']", {
                    title: "Add new Slot",
                    config: m.route
                }, "New Slot")
            ])
        ])
    ]);
};

User.me.menu = function(activeClass) {
    return m("menu", {type: "toolbar", role: "toolbar", class: "me"}, [
        m("li", [
            m("a[href='/me']", { id: 'me',
                                 class: activeClass == 'me' ? 'active' : '',
                                 config: m.route}, "Me")
        ]),
        m("li", [
            m("a[href='/groups']", { id: 'groups',
                                     class: activeClass == 'groups' ? 'active' : '',
                                     config: m.route}, "Groups")
        ]),
        m("li", [
            m("a[href='/users']", { id: 'friends',
                                    class: activeClass == 'friends' ? 'active' : '',
                                    config: m.route}, "Friends")
        ])
    ]);
};

User.me.view = function(ctrl) {
    console.log('init user view');
    document.title = "Me - Timeslot";
    return User.me.layout(ctrl, User.me.nav(), User.me.body, User.me.menu('me'));
};

User.me.layout = function(ctrl, nav, body, menu) {
    return [
        m("header", nav),
        m("main", body(ctrl)),
        m("footer", menu)
    ];
};


// List of Users / befriending

User.list.body = function(ctrl) {
    var vm = User.list.vm;

    return m('.users', [
        m("ul#userList", { class: 'list' }, [
            vm.users().map( function(user) {
                console.log('user is here');
                console.log(user);

                return m('li', {class: 'list-item'}, [
                    m('a[href="/users/' + user.id() +'"]', {config: m.route}, [
                        m('figure', [
                            m('img', {
                                src: (user.image()) ? app.imageCloudURL + user.image().clyid : ''
                            })
                        ]),
                        m('h2', user.name())
                    ]),
                    m('small', function() {
                        switch (user.friendship()) {
                        case "00":
                            return m('button', {
                                onclick: ctrl.requestFriendship.bind(ctrl, user.id())
                            }, 'Accept Friend Request');
                        case "10":
                            return "Request Send";
                        case "01":
                            return "Request denied";
                        case "11":
                            return "Friend";
                        default:
                            return m('button', {
                                onclick: ctrl.requestFriendship.bind(ctrl, user.id())
                            }, 'Send Friend Request');
                        };
                    }())
                ]);
            })
        ])
    ]);
};

User.list.view = function(ctrl) {
    console.log('init user view');
    document.title = "Users - Timeslot";
    return User.list.layout(ctrl, app.backNav(), User.list.body, User.me.menu);
};

User.list.layout = function(ctrl, nav, body, menu) {
    return [
        m("header", nav),
        m("main", body(ctrl)),
        m("footer", menu('friends'))
    ];
};


// show single User Profile

User.show.menu = function(ctrl) {
    return m("menu", {type: "toolbar", role: "toolbar", class: "buttonMenu oneButton"}, [
        m("li", [
            m("a[href='/me/edit']", { class: 'red', config: m.route }, "Edit")
            // m("button[type=button]", { class: 'buttonRed', onclick: test }, "Edit")
        ])
    ]);
};

User.show.body = function(ctrl) {
    var vm = User.show.vm;

    return m('#user', [
        m("figure#userImage", [
            m("img.user", {
                src: (vm.user().image()) ? app.imageCloudURL + vm.user().image() : ''
            }),
        ]),
        m("h2", vm.user().name()),
        m("p", "Los Angeles, US"),
        // m("p", vm.user().location()),
        m('dl', [
            m('dt', 'Slots'),
            m('dd', '111'),
            m('dt', 'Reslots'),
            m('dd', '111'),
            m('dt', 'Friends'),
            m('dd', '111')
        ])
    ]);
};

User.show.view = function(ctrl) {
    console.log('init user view');
    var vm = ctrl.vm;
    var user = vm.user();

    document.title = vm.user().name() + " - Timeslot";

    return [
        m("header", app.backNav()),
        m("main", User.show.body(ctrl)),
        function() {
            if(app.current_user.id() == user.id())
                return m("footer", User.show.menu('me'));
        }()
    ];
};


///// user sign in

User.signin.form = function(ctrl) {
    var vm = User.signin.vm;

    return m('.login', [
        m('p', "Log in with"),
        m('.socialLinks', [
            m("a[href='/facebook']", { id: 'facebook-login', config: m.route }, "facebook"),
            m("a[href='/twitter']", { id: 'twitter-login', config: m.route }, "twitter")
        ]),
        m('p', "or"),
        m('fieldset.border', [
            m("div", { class: 'email'}, [
                m('label', "Email:"),
                m('input[type=email]', {
                    onchange: m.withAttr("value", vm.email), value: vm.email() })
            ]),
            m("div", [
                m('label', "Password:"),
                m('input[type=password]', {
                    onchange: m.withAttr("value", vm.password), value: vm.password() })
            ])
        ]),
        m('a', { class: "greenFull ok", onclick: ctrl.login.bind(vm), href:'#' }, 'OK')
    ]);
};

User.signin.menu = function() {
    return m("menu", { type: "toolbar", role: "toolbar", id: "login-menu" }, [
        m("li", [
            m("a[href='/forgotPassword']", { config: m.route }, "Forgot Password?")
        ])
    ]);
};

User.signin.view = function(ctrl) {
    console.log('init login view');
    return [
        m("header", app.backNav()),
        m("main", User.signin.form(ctrl)),
        m("footer", User.signin.menu())
    ];
};


////////// user signup

User.signup.form = function(ctrl) {
    var vm = User.signup.vm;

    return m('.signup', [
        m('fieldset.border', [
            m("div", [
                m('label', "Name:"),
                m('input[type=text]', {
                    onchange: m.withAttr("value", vm.name), value: vm.name() })
            ]),
            m("div", { class: 'email'}, [
                m('label', "Email:"),
                m('input[type=email, required]', {
                    onchange: m.withAttr("value", vm.email), value: vm.email() })
            ]),
            m("div", [
                m('label', "Password:"),
                m('input[type=password]', {
                    onchange: m.withAttr("value", vm.password), value: vm.password() })
            ])
        ])
    ]);
};

User.signup.menu = function(ctrl) {
    var vm = ctrl.vm;

    return m("menu", {type: "toolbar", role: "toolbar", class: "buttonMenu oneButton" }, [
        m("li", [
            m('a.greenFull.submit', { onclick: ctrl.signup.bind(vm), href:'#' }, 'OK')
        ])
    ]);
};

User.signup.view = function(ctrl) {
    console.log('init signup view');
    return [
        m("header", app.backNav()),
        m("main", User.signup.form(ctrl)),
        m("footer", User.signup.menu(ctrl))
    ];
};


// edit current user / me


User.edit.form = function(ctrl) {
    var vm = ctrl.vm;
    var user = vm.user();

    return m('.editMe', [
        m('figure', [
            m('.userImg', [
                m('img.user', {
                    src: (user.image()) ? app.imageCloudURL + user.image() : ''
                }),
                m('p', { onclick: console.log }, 'Add Photo')
            ])
        ]),
        m('fieldset.border', [
            m("div", [
                m('label', "Name"),
                m('input[type=text]', {
                    onchange: m.withAttr("value", user.name), value: user.name() })
            ]),
            m("div", [
                m('label', "City, Land?"),
                m('input[type=text][placeholder="not available"]', {
                    onclick: m.toggle(vm.locActive),
                    value: vm.address() ? vm.address().name :
                        user.location() ? user.location().name : '' })
            ]),
            m("div", [
                m('label', "Public URL"),
                m('input[type=url][placeholder="not available"]', {
                    onchange: m.withAttr("value", user.publicUrl), value: user.publicUrl() })
            ]),
            m("div", [
                m("input", {
                    name: 'file',
                    type: 'file',
                    onchange: function(e) {
                        console.log((e.dataTransfer || e.target).files);
                        vm.imageFile((e.dataTransfer || e.target).files);
                    }
                })
            ])
        ])
    ]);
};

User.edit.menu = function(ctrl) {
    var vm = ctrl.vm;

    return m("menu", {type: "toolbar", role: "toolbar", class: "buttonMenu twoButtons" }, [
        m("li", [
            m('button.red', { onclick: app.browserBack }, 'Cancel')
        ]),
        m("li", [
            m('button.green.submit', { onclick: ctrl.update }, 'Done')
        ])
    ]);
};

User.edit.view = function(ctrl) {
    console.log('init edit view');
    var vm = ctrl.vm;

    return m('.noOverflow', [
        m('.viewWithLocSearch.mainForm', { class: vm.locActive() ? "" : 'active' }, [
            m("main", User.edit.form(ctrl)),
            m("footer", User.edit.menu(ctrl))
        ]),
        m('.viewWithLocSearch.locForm', { class: vm.locActive() ? "active" : "" }, [
            new vm.locSearch.view({ toggleClass: vm.locActive })
        ])
    ]);
};
