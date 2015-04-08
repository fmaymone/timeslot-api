m.route.mode = "search";
// m.route.mode = "pathname";

m.route(document.body, "/", {
    "/": app.landing,
    "/settings": app.settings,
    "/locationSearch": app.locationSearch,
    "/signup": User.signup,
    "/signin": User.signin,
    "/me": User.me,
    "/me/friendSlots": User.friendSlots,
    "/me/edit": User.edit,
    "/users": User.list,
    "/users/:userId": User.show,
    "/groups": Group.list,
    "/groups/new": Group.add,
    "/groups/invite": Group.invite,
    "/groups/:groupId": Group.show,
    "/groups/:groupId/addSlot": Slot.addGroupSlot,
    "/groups/:groupId/slots": Group.slots,
    "/slots/new": Slot.add,
    "/slots/:slotId/edit": Slot.edit,
    "/slots/:slotId": Slot.show,

    // "/home": {
    //     controller: User.controller,
    //     view: User.view
    // }
});
