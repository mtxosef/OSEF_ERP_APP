//Evento que se lanza al seleccionar algun valor de la sucursal
var cmbPreciario_Select = function (combobox, registro) {
    App.txtfDescripcionPreciario.setValue(registro[0].data.Descripcion);


    if (App.sPreciario.getAt(0) != undefined) {
        App.txtfSucursalNombre.setValue(App.sPreciario.getAt(0).get('RSucursal').Nombre);
        App.txtfIDSucursal.setValue(App.sPreciario.getAt(0).get('RSucursal').ID);
    }


};

//Evento que se lanza al poner algun caracter en el control de la Sucursal
var cmbPreciario_Change = function (combobox, valorNuevo, viejoValor) {
    App.sPreciario.clearFilter();

    if (App.cmbPreciario.getValue() != null) {
        App.sPreciario.filter([{ filterFn: function (item) {
            if (item.get('ID').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1) { return true; }
            else { return false; }
        }
        }]);
    }
    else {
        App.txtfDescripcionPreciario.setValue('');
    }


    if (App.sPreciario.getAt(0) != undefined) {
        App.txtfSucursalNombre.setValue(App.sPreciario.getAt(0).get('RSucursal').Nombre);
        App.txtfIDSucursal.setValue(App.sPreciario.getAt(0).get('RSucursal').ID);
    }

};
