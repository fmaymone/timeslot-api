Group.list.nav= function() {
    return m("nav", {type: "toolbar", role: "navigation"}, [
        m("ul", [
            m("li", {class: "slotlistfilter"}, [
                m("a[href='/filter_slotlist']", {config: m.route}, "Activity")
            ]),
            m("li", {class: "center"}),
            m("li", {class: "add_group"}, [
                m("a[href='/groups/new']", {config: m.route}, "New Group")
            ])
        ])
    ]);
};

Group.list.body = function(ctrl) {
    var vm = Group.list.vm;

    return m('.groups', [
        m("ul.list", { id: "groupList" }, [
            vm.groups().map(function(group) {
                console.log('group is here');
                // console.log(group);
                grouplistLayout = [
                    m('a[href="/groups/' + group.id() +'/slots"]', {config: m.route}, [
                        m('.groupImg', [
                            m('figure', [
                                m('img', { src: group.image() ? app.imageCloudURL + group.image() : '' })
                            ]),
                        ]),
                        m('.groupInfo', [
                            m('h2', group.name()),
                            function() {
                                if(group.upcomingCounter() == 1)
                                    return m('small', ' 1 Upcoming Slot');
                                else
                                    return m('small', group.upcomingCounter() + ' Upcoming Slots');
                            }(),
                            function() {
                                if(group.nextSlotDate())
                                    return m('small.red', 'Next Slot: ' + group.nextSlotDate().calendar() + ', ' + group.nextSlotDate().format('HH:mm'));
                            }()
                        ])
                    ])
                ];
                return m('li', {class: 'list-item'}, grouplistLayout);
            })
        ])
    ]);
};

Group.list.view = function(ctrl) {
    return [
        m("header", Group.list.nav()),
        m("main", Group.list.body(ctrl)),
        m("footer", User.me.menu('groups'))
    ];
};




////////


Group.add.nav= function() {
    return m("nav", {type: "toolbar", role: "navigation"}, [
        m("ul", [
            m("li", {class: "cancel"}, [
                m("a[href='/groups']", {config: m.route}, "Cancel")
            ]),
            m("li", {class: "center"}),
            m("li", {class: "add_group"}, [
                m("a[href='/groups/invite']", {config: m.route}, "Next")
            ])
        ])
    ]);
};

Group.add.form = function(ctrl) {
    var vm = Group.add.vm;

    return m('#createGroup', [
        m("figure#groupImage", [
            m("a[href='/photo']", {config: m.route}, "Group Photo")
            // m("img", { src: vm.image() }),
            // m("img", { src: m.withAttr("value", vm.image) })
        ]),
        m('br'),
        m('fieldset', [
            m("input[type=text][placeholder='Group Name']", {
                onchange: m.withAttr("value", vm.name) }),
            m("input", {
                name: 'file',
                type: 'file',
                onchange: function(e) {
                    console.log((e.dataTransfer || e.target).files);
                    vm.imageFile((e.dataTransfer || e.target).files);
                }
            })
        ])
    ]);
};


Group.add.view = function(ctrl) {
    document.title = "Create new Group - Timeslot";

    return [
        m("header", Group.add.nav()),
        m("main", Group.add.form(ctrl))
    ];
};


///////// invite

Group.invite.nav= function(ctrl) {
    var vm = Group.add.vm;

    return m("nav", {type: "toolbar", role: "navigation"}, [
        m("ul", [
            m("li", {class: "back"}, [
                m("a[href='/groups/new']", {config: m.route}, "Back")
            ]),
            m("li", {class: "center"}),
            m("li", {class: "add_group_members"}, [
                m("a", { onclick: ctrl.create.bind(vm), href:'#' }, "Create")
            ])
        ])
    ]);
};

Group.invite.form = function() {
    var vm = Group.invite.vm;

    return m('#createGroup', [
        m("figure#groupImage", [
            m("a[href='/photo']", {config: m.route}, "Group Photo")
            // m("img", { src: vm.image() }),
            // m("img", { src: m.withAttr("value", vm.image) })
        ]),
        m('br')
    ]);
};

Group.invite.view = function(ctrl) {
    document.title = "Invite Users to Group - Timeslot";

    return [
        m("header", Group.invite.nav(ctrl)),
        m("main", Group.invite.form())
    ];
};


////////// show single group

Group.show.body = function() {
    var vm = Group.show.vm;

    console.log(vm.group());
    return [
        m("figure", [
            m('img', { src: (vm.group().image()) ? app.imageCloudURL + vm.group().image() : '' })
        ]),
        m("h1", vm.group().name())
    ];
};

Group.show.view = function(ctrl) {
    var vm = ctrl.vm;
    document.title = "Group: " + vm.group().name() + " - Timeslot";

    return [
        m("header", app.nav({
            back: true,
            center: 'Group created on ' + vm.group().createdAt().format('MMMM d, YYYY')}
                           )
         ),
        m("main", Group.show.body(ctrl))
    ];
};

/////////// show slots in a group

Group.slots.nav= function(ctrl) {
    var group = ctrl.vm.group();

    return m("nav", {type: "toolbar", role: "navigation"}, [
        m("ul", [
            m("li.back", { onclick: app.browserBack }, "Back"),
            m("li.center", group.name()),
            m("li.add", [
                m('a[href="/groups/' + group.id() +'/addSlot"]', {config: m.route}, "+")
            ])
        ])
    ]);
};

Group.slots.body = function(ctrl) {
    var vm = ctrl.vm;
    var group = vm.group();
    var slots = vm.slots().filter(function(slot) {
        if(slot.groupId() == group.id())
            return true;
    });

    return m('#myGroupSlots', [
        m('a[href="/groups/' + group.id() +'"]', {config: m.route}, [
            m("figure#userImage", [
                m("img.user", {
                    src: (group.image()) ? app.imageCloudURL + group.image() : ''
                }),
            ])
        ]),
        m('.slotListMenu', [
            m("h2.calDate", vm.slots()[vm.earliestVisibleSlotIndex()].startDate().calendar()),
        ]),
        m("ul.slotList", { class: 'list', onscroll: vm.updateCurrentDay }, [
            slots.map( function(slot, i) {
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
    ]);
};


Group.slots.view = function(ctrl) {
    var vm = ctrl.vm;
    document.title = "Groupslots: " + vm.group().name() + " - Timeslot";

    return [
        m("header", Group.slots.nav(ctrl)),
        m("main", Group.slots.body(ctrl))
    ];
};
