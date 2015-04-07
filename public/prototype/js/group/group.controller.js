Group.list.controller = function() {
    Group.list.vm.init();
};


Group.add.controller = function() {

    var vm = Group.add.vm;
    if(!vm.initialized) vm.init();

    var ctrl = this;
    ctrl.postGroup = function() {
        console.log('group create ajax');

        var newData = {
            name: vm.name()
        };

        if(vm.cloudinaryResponse())
            newData['image'] =  { publicId: vm.cloudinaryResponse().public_id };

        m.request({
            method: "POST",
            url: "/v1/groups",
            config: app.xhrConfig,
            data: newData,
            type: Group.model
        }).then(log).then(app.redirectToGroups);
    };

    ctrl.create = function() {
        console.log('create group');

        if(vm.imageFile()) {
            console.log('patch with img');
            var signature = app.getCloudinarySignature();

            return signature.then(app.cloudinary.upload.bind(vm)).
                then(ctrl.postGroup)();
        } else
            return ctrl.postGroup();
    };
};


Group.invite.controller = Group.add.controller;


Group.show.controller = function() {
    this.vm = Group.show.vm;
    this.vm.init();
};


Group.slots.controller = function() {
    console.log('init group slots controller');
    this.vm = Group.slots.vm;
    this.vm.init();
};
