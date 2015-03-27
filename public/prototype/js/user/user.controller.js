User.me.controller = function() {
    console.log('init user controller');

    User.me.vm.init();
};


User.list.controller = function() {
    console.log('init userlist controller');

    User.list.vm.init();

    var ctrl = this;
    ctrl.requestFriendship = function(user_id) {

        console.log('friend request ajax');
        console.log(user_id);
        m.request({
            method: "POST",
            url: "/v1/users/add_friends",
            config: app.xhrConfig,
            data: { ids: [user_id] }
            // data: vm.markedUsers()
        }).then(User.list.vm.init());
    };
};


User.show.controller = function() {
    console.log('init user controller');

    var ctrl = this;
    ctrl.vm = User.show.vm;
    ctrl.vm.init();
};


User.signin.controller = function() {
    var ctrl = this;
    var vm = User.signin.vm;
    vm.init();

    ctrl.login = function() {
        m.request({
            method: "POST",
            url: "/v1/users/signin",
            config: app.xhrConfig,
            data: {
                email: vm.email(),
                password: vm.password()
            },
            type: User.model
        }).then(app.setCurrentUser);
    };
};


User.signup.controller = function() {
    var ctrl = this;
    var vm = User.signup.vm;
    ctrl.vm = vm;
    vm.init();

    ctrl.signup = function() {
        m.request({
            method: "POST",
            url: "/v1/users",
            config: app.xhrConfig,
            data: {
                username: vm.name(),
                email: vm.email(),
                password: vm.password()
            },
            type: User.model
        }).then(app.setCurrentUser);
    };
};


User.edit.controller = function() {
    var ctrl = this;
    var vm = User.edit.vm;
    ctrl.vm = vm;
    vm.init();

    ctrl.patchUser = function() {
        console.log('patch current user');
        console.log(vm.cloudinaryResponse().public_id);
        var newData = {
            username: vm.user().name()
            // location: vm.user().name(),
            // image: { publicId: vm.cloudinaryResponse().public_id }
        };

        if(vm.cloudinaryResponse())
            newData['image'] =  { publicId: vm.cloudinaryResponse().public_id };

        m.request({
            method: "PATCH",
            url: "/v1/users",
            config: app.xhrConfig,
            data: newData,
            type: User.model
        }).then(log).then(app.setCurrentUser).then(m.route("/me"));
    };

    ctrl.update = function() {
        console.log('update user');

        if(vm.imageFile()) {
            console.log('patch with img');
            var signature = app.getCloudinarySignature();

            return signature.then(app.cloudinary.upload.bind(vm)).
                then(ctrl.patchUser)();
        } else
            return ctrl.patchUser();
    };
};
