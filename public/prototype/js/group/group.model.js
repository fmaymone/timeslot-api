var Group = {};
Group.list = {};
Group.add = {};
Group.invite = {};
Group.show = {};
Group.slots = {};

Group.model = function(data) {
    this.id = m.prop(data.id);
    this.name = m.prop(data.name);
    this.ownerId = m.prop(data.ownerId);
    this.membersCanPost = m.prop(data.membersCanPost);
    this.membersCanInvite = m.prop(data.membersCanInvite);
    this.image = m.prop(data.image);
    this.createdAt = m.prop(moment(data.createdAt));
    this.updatedAt = m.prop(data.updatedAt);
    this.deletedAt = m.prop(data.deletedAt);
    this.upcomingCounter = m.prop(data.upcoming);
    this.nextSlotDate = m.prop(data.next ? moment(data.next) : '');
};

Group.list.convert = function(json) {
    var list = [];
    json.map(function(groupdata) {
        // console.log(groupdata);
        list.push(new Group.model(groupdata));
        // console.log(list);
    });
    return list;
};

Group.list.load = function() {
    console.log('groups ajax');

    return m.request({ method: "GET",
                       config: app.xhrConfig,
                       url: "/v1/groups"}).then(log).then(Group.list.convert);
};

Group.list.vm = function() {
    console.log('init group list vm');
    var vm = {};
    vm.init = function() {
        vm.groups = Group.list.load();
    };
    return vm;
}();


// add group

Group.add.vm = function() {
    var vm = {};
    vm.initialized = false || vm.initialized;
    console.log('init group add vm');
    console.log(vm.initialized);
    // vm.create = function() {
    vm.init = function() {
        console.log('init group add vm init');
        vm.name = m.prop('');

        vm.imageFile = m.prop('');
        vm.cloudinaryResponse = m.prop('');

        vm.membersCanPost = m.prop('');
        vm.membersCanInvite = m.prop('');

        vm.initialized = true;
    };
    return vm;
}();


// group invite

Group.invite.vm = function() {
    console.log('init group invite vm');
    var vm = {};
    vm.init = function() {
        // show list of users friends
    };
    return vm;
}();


// show group

Group.show.load = function(groupId) {
    log('load single group');
    var groupUrl = "/v1/groups/" + groupId;
    return m.request({
        method: "GET",
        url: groupUrl,
        config: app.xhrConfig,
        type: Group.model
    }).then(log);
};


Group.show.vm = function() {
    console.log('init group show vm');
    var vm = {};
    vm.init = function() {
        vm.group = Group.show.load(m.route.param("groupId"));
    };
    return vm;
}();


Group.slots.vm = function() {
    console.log('init group slots vm');
    var vm = {};

    vm.init = function() {
        var groupId = m.route.param("groupId");

        vm.slots = User.slots();
        vm.group = Group.show.load(groupId);
        vm.earliestVisibleSlotIndex = m.prop(0);
    };
    return vm;
}();
