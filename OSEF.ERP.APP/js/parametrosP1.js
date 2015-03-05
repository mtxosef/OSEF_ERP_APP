//Evento que se lanza al seleccionar algun valor de la sucursal
var cmbPreciario_Select = function (combobox, registro) {
    App.txtfDescripcionPreciario.setValue(registro[0].data.Descripcion);
    App.txtConcepto.setDisabled(false);

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


var imgBtnSeleccionarConcepto_Click_Success = function (response, result) {

    window.parent.App.wAyudaConcepto.load('FormaBuscaPreciarioConcepto.aspx');
    window.parent.App.wAyudaConcepto.setHeight(500);
    window.parent.App.wAyudaConcepto.setWidth(685);
    window.parent.App.wAyudaConcepto.center();
    window.parent.App.wAyudaConcepto.setTitle('Selecciona concepto');
    window.parent.App.wAyudaConcepto.show();

}