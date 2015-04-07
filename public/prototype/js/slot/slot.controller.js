Slot.show.controller = function() {
    console.log('this.slotId: ' + m.route.param("slotId"));
    Slot.show.vm.init();
};

Slot.add.controller = function() {
    var vm = Slot.add.vm;
    vm.init({ slotType: 'stdSlot' });

    var ctrl = this;
    ctrl.vm = vm;

    ctrl.add = function (test) {
        console.log('add slot controller');
        // console.log(test);
        var slot = vm.slot();

        var start = moment(slot.startDate());
        start.hour(slot.startTime().split(':')[0]);
        start.minutes(slot.startTime().split(':')[1]);

        var endDate = moment(start);
        endDate.add(vm.durationHours(), 'h');
        endDate.add(vm.durationMinutes(), 'm');

        console.log(start.toJSON());
        console.log(endDate.toJSON());

        m.request(
            {
                method: "POST",
                url: "/v1/stdslot",
                config: app.xhrConfig,
                data: {
                    title: slot.title(),
                    startDate: start.toJSON(),
                    endDate: endDate.toJSON(),
                    visibility: vm.visibilitySelect.value(),
                    locationId: vm.address().id
                }
            }).then(log).then(app.redirectHome);
    };
};

Slot.addGroupSlot.controller = function() {
    var vm = Slot.add.vm;
    vm.init({ slotType: 'groupSlot' });

    var ctrl = this;
    ctrl.vm = vm;

    ctrl.add = function() {
        console.log('add groupslot controller');

        var slot = vm.slot();

        var start = moment(slot.startDate());
        start.hour(slot.startTime().split(':')[0]);
        start.minutes(slot.startTime().split(':')[1]);

        var endDate = moment(start);
        endDate.add(vm.durationHours(), 'h');
        endDate.add(vm.durationMinutes(), 'm');

        console.log(start.toJSON());
        console.log(endDate.toJSON());

        m.request(
            {
                method: "POST",
                url: "/v1/groupslot",
                config: app.xhrConfig,
                data: {
                    title: slot.title(),
                    startDate: start.toJSON(),
                    endDate: endDate.toJSON(),
                    groupId: m.route.param("groupId"),
                    locationId: vm.address().id
                }
            }).then(log).then(app.redirectHome);
    };
};

Slot.edit.controller = function() {
    console.log('edit slot with Id :' + m.route.param("slotId"));

    var ctrl = this;
    var vm = Slot.edit.vm;
    ctrl.vm = vm;
    vm.init({ slotType: 'groupSlot' });

    ctrl.edit = function() {
        console.log('slot patch ajax');
        var slot = vm.slot();

        var start = moment(slot.startDate());
        start.hour(slot.startTime().split(':')[0]);
        start.minutes(slot.startTime().split(':')[1]);

        var endDate = moment(start);

        if(vm.durationHours() || vm.durationMinutes())
            endDate.add(vm.durationHours(), 'h');
        else
            endDate.add(slot.durationHours(), 'h');

        if(vm.durationMinutes())
            endDate.add(vm.durationMinutes(), 'm');
        else
            endDate.add(slot.duration().minutes(), 'm');

        var changedData =  {
            title: slot.title(),
            startDate: start.toJSON(),
            endDate: endDate.toJSON()
        };
        if(vm.visibilitySelect.value())
            changedData['visibility'] = vm.visibilitySelect.value();

        if(vm.address())
            changedData['locationId'] = vm.address().id;

        m.request(
            {
                method: "PATCH",
                url: "/v1/groupslot/" + slot.id(),
                config: app.xhrConfig,
                data: changedData
            }).then(log).then(
                // I have a race condition here because the following request
                // for the slot data might use a server thread which does not
                // yet return the updated data...
                function() {
                    // console.log('should be good');
                    m.route("/slots/" + slot.id());
                }
                // m.route("/slots/" + slot.id())
            );//app.redirectHome);
    };
};
