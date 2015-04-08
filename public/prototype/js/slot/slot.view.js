Slot.show.nav = function() {
    var vm = Slot.show.vm;

    return m("nav", {type: "toolbar", role: "navigation"}, [
        m("ul", [
            m("li", {class: "back"}, [
                m("a[href='/me']", { config: m.route }, "Back")
            ]),
            m("li", {class: "center startdate"}, [
                m("a[href='/#']",
                  { config: m.route },
                  moment(vm.slot().startdate()).format("ddd, MMM Do YYYY"))
            ]),
            m("li", {class: "edit"}, [
                m("a[href='/slots/" + vm.slot().id() + "/edit']",
                  { config: m.route },
                  "Edit")
            ])
        ])
    ]);
};


Slot.show.menu = function() {
    return m("menu", {type: "toolbar", role: "toolbar"}, [
        m("li", [
            m("a[href='#share']", { class: 'share', config: m.route}, "Share")
        ]),
        m("li", [
            m("a[href='#fave']", { class: 'fave', config: m.route}, "Favourite")
        ]),
        m("li", [
            m("a[href='#alerts']", { class: 'alarm', config: m.route}, "Alerts")
        ]),
        m("li", [
            m("a[href='#delete']", { class: 'delete', config: m.route}, "Delete")
        ])
    ]);
};


Slot.show.body = function() {
    var vm = Slot.show.vm;

    console.log(vm.slot());
    return [
        m("p", {class: "time"}, moment(vm.slot().startdate()).format("HH:mm")),
        m("p", {class: "duration"},
          vm.slot().duration().humanize() + " Slot"),
          // moment.duration(moment(vm.slot().enddate()) - moment(vm.slot().startdate())).humanize() + " Slot"),
        m("figure", [
            m('img', { src: (vm.slot().photos().length > 0) ? vm.slot().photos()[0].clyid : '' })
        ]),
        m("h1", vm.slot().title()),
        m("address", Slot.show.addressLayout(vm.slot().location())),
        m("p", {class: "visibility"}, vm.slot().visibility())
    ];
};

Slot.show.addressLayout = function(address) {
    if (address)
        return address.name+" - "+address.street+" - "+address.city+" - "+address.country;
    else return 'no address';

};

Slot.show.layout = function(nav, body, menu) {
    return [
        m("header", nav),
        m("main", body),
        m("footer", menu)
    ];
};

Slot.show.view = function(ctrl) {
    console.log('init slot show view');

    var vm = Slot.show.vm;
    document.title = "Slot: " + vm.slot().title() + " - Timeslot";

    return Slot.show.layout(Slot.show.nav(), Slot.show.body(), Slot.show.menu());
};


//////// slot add

Slot.add.form = function(ctrl) {
    var vm = ctrl.vm;
    var slot = vm.slot();

    return m('.addSlot', [
        m('h1', vm.pageTitle()),
        m('fieldset', [
            m("div", [
                m("input[placeholder='Start']", {
                    config: app.pikaday({ binds: slot.startDate }),
                    value: slot.startDate() ? slot.startDate().calendar() : '' }),
                m("input[type=time][placeholder='Start time']", {
                    onchange: m.withAttr("value", slot.startTime),
                    value: slot.startTime() ? slot.startTime() : '' }),
                m("input[type=text][placeholder='Title'][required]", {
                    onchange: m.withAttr("value", slot.title),
                    value: slot.title() ? slot.title() : '' }),
                m("input[type=number][min=0][placeholder='Duration Hours']", {
                    onchange: m.withAttr("value", vm.durationHours),
                    value: vm.durationHours() ? vm.durationHours() :
                        slot.durationHours() ? slot.durationHours() : '' }),
                m("input[type=number][min=0][placeholder='Duration Minutes']", {
                    onchange: m.withAttr("value", vm.durationMinutes),
                    value: vm.durationMinutes() ? vm.durationMinutes() :
                        slot.duration() > 50 ? slot.duration().minutes() : '' }),
                m("input[type=text][placeholder='Location']", {
                    onclick: m.toggle(vm.locActive),
                    value: vm.address() ? vm.address().name :
                        slot.location() ? slot.location().name : '' }),
                function() {
                    if(vm.slotType() == 'stdSlot')
                        return new Select.view(vm.visibilitySelect,
                                               slot.visibilityBits());
                }()
            ])
        ]),
    ]);

};

Slot.add.menu = function(ctrl) {
    var vm = Slot.add.vm;

    return m("menu",
             {type: "toolbar", role: "toolbar", class: "buttonMenu oneButton" },
             [
                 m("li", [
                     m('a.greenFull.submit',
                       { onclick: ctrl.add.bind(vm), href:'#' },
                       'Slot')
                 ])
             ]);
};

Slot.add.view = function(ctrl) {
    console.log('init add slot view');
    document.title = "Add a Slot - Timeslot";
    var vm = ctrl.vm;

    return m('.noOverflow', [
        m('.viewWithLocSearch.mainForm', { class: vm.locActive() ? "" : 'active' }, [
            m("header", app.navCancel()),
            m("main", Slot.add.form(ctrl)),
            m("footer", Slot.add.menu(ctrl))
        ]),
        m('.viewWithLocSearch.locForm', { class: vm.locActive() ? "active" : "" }, [
            new vm.locSearch.view({ toggleClass: vm.locActive})
        ])
    ]);
};

Slot.addGroupSlot.view = Slot.add.view;

Slot.edit.view = function(ctrl) {
    console.log('init edit slot view');
    document.title = "Edit Slot - Timeslot";
    var vm = ctrl.vm;

    return m('.noOverflow', [
        m('.viewWithLocSearch.mainForm', { class: vm.locActive() ? "" : 'active' }, [
            m("header", app.nav({
                vm: vm, cancel: true,
                done: true, doneAction: ctrl.edit
            })),
            m("main", Slot.add.form(ctrl)),
            // m("footer", Slot.add.menu(ctrl))
        ]),
        m('.viewWithLocSearch.locForm', { class: vm.locActive() ? "active" : "" }, [
            new vm.locSearch.view({ toggleClass: vm.locActive })
        ])
    ]);
};
