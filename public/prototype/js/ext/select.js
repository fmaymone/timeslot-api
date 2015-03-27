// https://github.com/lhorie/mithril.js/issues/81
//
// Example usage:
//
// In your controller:
// this.select = new Select.controller({
//     caption: 'Please select an option',
//     options: {
//         'key1': 'Label 1',
//         'key2': 'Label 2'
//     }
// });
//
// Include in your view like:
// new Select.view(ctrl.select)
//

var Select;

Select = {
    controller: function(data) {
        this.classes = data.classes || '';
        this.value = m.prop(data.selected);
        this.caption = data.caption;
        this.options = data.options || {};
        // this.selected = data.selected || '';
        return this;
    },
    view: function(ctrl, selected) {
        var defaultSelect = selected || ctrl.selected;

        var option = function(key) {
            return m((defaultSelect == key) ? 'option[selected]' : 'option',
                     { value: key },
                     ctrl.options[key]);
        };
        return [
            m("select", {
                onchange: m.withAttr("value", ctrl.value),
                value: ctrl.value(),
                'class': ctrl.classes
            }, [
                ctrl.caption ? m('option', {
                    value: ''
                }, ctrl.caption) : '', Object.keys(ctrl.options).map(option)
            ])
        ];
    }
};
