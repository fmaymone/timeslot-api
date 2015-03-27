Slot = {};
Slot.show = {};
Slot.media = {};
Slot.add = {};
Slot.addGroupSlot = {};
Slot.edit = {};

Slot.model = function(data) {
    // console.log(data);
    this.id = m.prop(data.id);
    this.title = m.prop(data.title);

    this.startdate = m.prop(data.startDate);
    this.startDate = m.prop(moment(data.startDate));
    // this.enddate = m.prop(data.endDate);
    this.endDate = m.prop(moment(data.endDate));
    this.startTime = m.prop(this.startDate().format('HH:mm'));
    this.duration = m.prop(moment.duration(this.endDate().diff(this.startDate())));
    this.durationHours = m.prop(this.endDate().diff(this.startDate(), 'hours'));

    this.location = m.prop(data.location);

    this.photos = m.prop(data.photos);
    this.voices = m.prop(data.voices);
    this.videos = m.prop(data.videos);
    this.notes = m.prop(data.notes);

    this.visibilityBits = m.prop(data.visibility);
    this.visibility = m.prop(function() {
        console.log('settype');
        if('visibility' in data) {
            if(data.visibility == '11')
                return 'Public Slot';
            else if(data.visibility == '01')
                return 'Friend Slot';
            else if(data.visibility == '00')
                return 'Secret Slot';
            else
                return 'huuh';
        } else
            return data.group;
    }());

    this.groupId = m.prop(data.groupId);
};

Slot.load = function(slotId) {
    log('load single slot');
    var slotUrl = "/v1/slots/" + slotId;
    return m.request({
        method: "GET",
        url: slotUrl,
        config: app.xhrConfig,
        type: Slot.model
    }).then(log);
};

Slot.show.vm = (function() {
    var vm = {};

    vm.init = function() {
        vm.slot = Slot.load(m.route.param("slotId"));
    };
    return vm;
}());

Slot.add.vm = (function() {
    var vm = {};

    vm.init = function(data) {
        var slot = {};
        vm.slot = m.prop(new Slot.model({}));

        vm.pageTitle = m.prop('Add a Slot');
        vm.slotType = m.prop(data.slotType);

        vm.durationHours = m.prop('');
        vm.durationMinutes = m.prop('');

        vm.visibilitySelect = new Select.controller({
            // caption: 'Seecrut',
            selected: '00',
            options: {
                '00': 'Secret',
                '01': 'Friend',
                '11': 'Public'
            }
        });

        vm.address = m.prop('');
        vm.locActive = m.prop(false);
        vm.locSearch = app.locationSearch;
        vm.locSearch.vm.init({ binds: vm.address });
    };
    return vm;
}());

Slot.edit.vm = (function() {
    var vm = {};

    vm.init = function(data) {
        vm.slot = Slot.load(m.route.param("slotId"));

        vm.pageTitle = m.prop('Edit Slot');
        vm.slotType = m.prop(data.slotType);

        vm.durationHours = m.prop('');
        vm.durationMinutes = m.prop('');

        vm.visibilitySelect = new Select.controller({
            // caption: 'Seecrut',
            // selected: slot().visibilityBits() || '00',
            options: {
                '00': 'Secret',
                '01': 'Friend',
                '11': 'Public'
            }
        });

        vm.address = m.prop('');
        vm.locActive = m.prop(false);
        vm.locSearch = app.locationSearch;
        vm.locSearch.vm.init({ binds: vm.address });
    };
    return vm;
}());
