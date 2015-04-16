var indice = 0;
var store;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    window.parent.App.wEmergente.load('FormaPreciario.aspx');
    Ext.util.Cookies.set('cookieEditarPreciario', 'Nuevo');
    window.parent.App.wEmergente.setHeight(580);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Preciario');
    window.parent.App.wEmergente.show();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    window.parent.App.wEmergente.load('FormaPreciario.aspx');
    Ext.util.Cookies.set('cookieEditarPreciario', App.gpPreciarios.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.setHeight(580);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Preciario ' + Ext.util.Cookies.get('cookieEditarPreciario'));
    window.parent.App.wEmergente.show();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sPreciarios.reload();
    App.sbFormaPreciario.setText('ACTIVO');
};

//Cambio en los datos del tablero
var sPreciarios_DataChanged = function () {
    if (App.sPreciarios.getCount() > 1 || App.sPreciarios.getCount() == 0) {
        App.sbPreciarios.setText(App.sPreciarios.getCount() + ' ' + 'PRECIARIOS');
    }
    else {
        App.sbPreciarios.setText(App.sPreciarios.getCount() + ' ' + 'PRECIARIO');
    }
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sPreciarios.clearFilter();
    App.sPreciarios.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1
        || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1
        || item.get('Sucursal').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpPreciarios.getSelectionModel().deselectAll(); 
};

//Asignar el nombre de la sucursal en base al ID
var cSucursal_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        if (registro.get('Sucursal') != registro.get('RSucursal').ID) {
            var sts = App.sPreciarios.findRecord('Sucursal', valor);
            return sts.get('Nombre');
        } else {
            return registro.get('RSucursal').Nombre;
        }
    }
};

//Acciones al hacer clic en un registro
var gpPreciarios_ItemClick = function (gridview, registro, gvhtml, index) {
    alert(index);
    indice = index;
};

//Hacer doble clic sobre algun concepto del GridPanel
var gpPreciarioActivo_ItemDblClick = function (gridview, registro, gvhtml, index) {
    console.log(registro);
    var prt = window.parent.App.wEmergente.getBody();
    prt.App.cmbPreciario.setValue(App.sPreciarios.getAt(index).get('ID'));
    prt.App.txtfDescripcionPreciario.setValue(App.sPreciarios.getAt(index).get('Descripcion'));
    prt.App.txtfIDSucursal.setValue(App.sPreciarios.getAt(index).get('Sucursal'));
    prt.App.txtfSucursalNombre.setValue(App.sPreciarios.getAt(index).get('RSucursal').Nombre);
     //    Ext.util.Cookies.set('cookieCP', App.sCodigosPostales.getAt(index).get('Id'));
    window.parent.App.wAyudaConcepto.hide();
}