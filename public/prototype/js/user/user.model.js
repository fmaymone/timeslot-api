var User = {};
User.me = {};
User.friendSlots = {};
User.list = {};
User.show = {};
User.edit = {};
User.signup = {};
User.signin = {};

User.model = function(data) {
    this.id = m.prop(data.id);
    this.name = m.prop(data.username);
    this.email = m.prop(data.email);
    this.image = m.prop(data.image);
    this.friendship = m.prop(data.friendshipState);
    this.location = m.prop(data.location);
    this.publicUrl = m.prop(data.publicUrl || '');
    this.authToken = m.prop(data.authToken || '');
};

User.loadAll = function() {
    console.log('user all ajax');

    return m.request({ method: "GET",
                       config: app.xhrConfig,
                       url: "/v1/users"}).then(User.convertToUsers).then(log).then(m.redraw());
};

User.convertToUsers = function(json) {
    console.log('create userlist');
    var list = [];
    json.map(function(data) {
        if(data.id == app.current_user.id()) return;
        list.push(new User.model(data));
    });
    return list;
};

User.slots = function() {
    console.log('user slots ajax');

    return m.request({ method: "GET",
                       config: app.xhrConfig,
                       url: "/v1/slots"}).then(log).then(User.convertToSlots);
};

User.convertToSlots = function(json) {
    console.log('create slotlist');
    // console.log(json);

    // sort slots by start date
    json.sort(function(a, b) {
        return moment(a.startDate) - moment(b.startDate);
    });

    var slotlist = [];
    json.map(function(slotdata) {
        // remove past slots
        if(moment(slotdata.startDate).isAfter())
            slotlist.push(new Slot.model(slotdata));
    });
    return slotlist;
};

User.load = function(user_id) {
    console.log('load user');
    console.log(user_id);
    console.log(m.route.param("userId"));

    var url = "/v1/users/" + user_id;

    return m.request({
        method: "GET",
        config: app.xhrConfig,
        url: url,
        type: User.model
    }).then(log);
};

User.me.vm = (function() {
    console.log('init current_user vm');
    var vm = {};

    vm.init = function() {
        vm.slots = User.slots();
        vm.user = User.load(app.current_user.id());
        vm.earliestVisibleSlotIndex = m.prop(0);
        vm.slotMediaBrowser = 1;
    };

    vm.updateCurrentDay = function(event) {
        // this is quite a hack
        // console.log(event);

        var scrolled = event.srcElement.scrollTop;
        var domListItems = event.srcElement.children;
        var scrolledOutItemsPx = 0;
        var scrolledOutItemsCounter = 0;
        var idx = 0;

        for (var i = 0; i < idx; i++) {
            scrolledOutItemsPx += domListItems[i].offsetHeight;
        }

        while(scrolled > scrolledOutItemsPx) {
            scrolledOutItemsPx += domListItems[scrolledOutItemsCounter].offsetHeight;

            if(domListItems[scrolledOutItemsCounter].classList.contains('slot'))
                idx++;

            scrolledOutItemsCounter++;
        }
        if(idx > 0) vm.earliestVisibleSlotIndex(idx-1);
    };

    return vm;
}());

User.list.vm = (function() {
    console.log('init userlist vm');
    var vm = {};
    vm.init = function() {
        vm.users = User.loadAll();
        vm.markedUsers = [];
    };
    return vm;
}());

User.show.vm = (function() {
    console.log('init user vm');
    var vm = {};
    vm.init = function() {
        vm.user = User.load(m.route.param("userId"));
    };
    return vm;
}());

User.edit.vm = (function() {
    console.log('init user edit vm');
    var vm = {};
    vm.init = function() {
        vm.user = User.load(app.current_user.id());

        vm.address = m.prop('');
        vm.locActive = m.prop(false);
        vm.locSearch = app.locationSearch;
        vm.locSearch.vm.init({ binds: vm.address });

        vm.imageFile = m.prop('');
        vm.cloudinaryResponse = m.prop('');
    };
    return vm;
}());

User.signin.vm = (function() {
    var vm = {};

    vm.init = function() {
        vm.email = m.prop("");
        vm.password = m.prop("");
    };
    return vm;
}());

User.signup.vm = (function() {
    var vm = {};

    vm.init = function() {
        vm.name = m.prop("");
        vm.email = m.prop("");
        vm.password = m.prop("");
    };
    return vm;
}());
