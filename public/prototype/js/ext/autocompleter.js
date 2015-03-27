// http://lhorie.github.io/mithril/components.html

var autocompleter = function(vm) {
    var autocompleter = {};

    autocompleter.vm = {
        term: m.prop(""),
        search: function(value) {
            // console.log('keep on searchin');
            autocompleter.vm.term(value.toLowerCase());
            var newdata = app.locationSearch.query(autocompleter.vm.term());
            vm.data(newdata);
        },
        // the filter is not used for location search...
        filter: function(item) {
            console.log(item);
            return autocompleter.vm.term() && item.name.toLowerCase().indexOf(autocompleter.vm.term()) > -1;
        }
    };

    autocompleter.view = function(ctrl) {
        return [
            m(".search", [
                m("input.locSearchField[type=search][autofocus]", {
                    oninput: m.withAttr("value", autocompleter.vm.search)})
            ]),
            function() {
                if(ctrl.data().length == 0) return '';
                return [
                    m('h2', 'Locations'),
                    m('ul.results', [
                        // ctrl.data().filter(autocompleter.vm.filter).map(function(item) {
                        ctrl.data().map(function(item) {
                            return m("li.result",
                                     // { onclick: ctrl.binds.bind(self, item)
                                     { onclick: function() {
                                         ctrl.binds.bind(this, item)();
                                     },
                                       class: ctrl.binds().id == item.id ? 'active' : ''
                                     },
                                     [
                                         m('p', item.name + ' (' + item.score.toFixed(2) + ')'),
                                         m('small', item.street + ', ' + item.city + ', ' + item.country ),

                                     ]);
                        })
                    ])
                ];
            }()
        ];
    };
    return autocompleter;
};
