﻿//Cambio en los datos del tablero
var sExploradorPConcepto_DataChanged = function () {
    if (App.sPreciarioConcepto.getCount() > 1 || App.sPreciarioConcepto.getCount() == 0) {
        App.sbExploradorPreciarioConcepto.setText(App.sPreciarioConcepto.getCount() + ' ' + 'CONCEPTOS');
    }
    else {
        App.sbExploradorPreciarioConcepto.setText(App.sPreciarioConcepto.getCount() + ' ' + 'CONCEPTOS');
    }
};


//Concatenar la columna de Movimiento
var cMov_Renderer = function (valor, metaData, registro) {
    var utilizada = registro.get('Utilizada');

    if (utilizada > 0) {
        return '<img class="IconColumnaEstatus" src="images/concluido.png" alt="concluido" /> ' + registro.get('Clave')
    }
    else {
        return '<img class="IconColumnaEstatus" src="images/pendiente.png" alt="pendiente" /> ' + registro.get('Clave');
    }


};

//Pone todas las celdas de color segun la validacion
var renderCantidadUtilizada = function (value, metadata, registro) {

    if (parseFloat(registro.get('Utilizada')) > 0) {
        metadata.style = "background-color: #7E6FEB;";

    }

    return value;
};


//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sPreciarioConcepto.clearFilter();
    App.sPreciarioConcepto.filter([{ filterFn: function (item) {
        if (item.get('Clave').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpExploradorConceptosPreciario.getSelectionModel().deselectAll();

};



//Asignar la descripción de la sucursal a este combobox
var cPreciario_Renderer = function (combo, registro) {
    console.log(registro);
//    var Sucursal = registro.get('RSucursal');
//    return Sucursal.Nombre;

};


//Evento que hace el filtro al seleccionar algun elemento
var cmbCantidadFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sPreciarioConcepto.clearFilter();
    }

    if (valor =='1') {
        App.sPreciarioConcepto.filterBy(function (elemento) {
         
            if (elemento.get('Utilizada') > 0) {
                return true;
            }
            else {
                return false;
            }
        });

    }
    if (valor == '0') {
        App.sPreciarioConcepto.filterBy(function (elemento) {

            if (elemento.get('Utilizada') == 0) {
                return true;
            }
            else {
                return false;
            }
        });

    }
};


var gpExploradorConceptos_ItemClick = function (gridview, registro, gvhtml, index) {
    window.parent.App.wEmergente.load('FormaPreciarioExplorador.aspx');
    window.parent.App.wEmergente.setHeight(365);
    window.parent.App.wEmergente.setWidth(540);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Datos del concepto');
    window.parent.App.wEmergente.show();

    Ext.util.Cookies.set('cookiePreciario', registro.get('Preciario'));
    Ext.util.Cookies.set('cookieConceptoID', registro.get('ID'));
    Ext.util.Cookies.set('cookieConcepto', registro.get('Clave'));
    Ext.util.Cookies.set('cookieDescripcion', registro.get('Descripcion'));

};

//Evento lanzado al agregar un registro al store
var sParametrosExporador_Add = function (concepto, registro) {


};


var sParametrosExporador_Load = function () {

    App.txtPreciario.setValue(Ext.util.Cookies.get('cookiePreciario'));
    App.txtfConcepto.setValue(Ext.util.Cookies.get('cookieConcepto'));
    App.txtConceptoID.setValue(Ext.util.Cookies.get('cookieConceptoID'));
    App.txtADescripcion.setValue(Ext.util.Cookies.get('cookieDescripcion'));

};


var sPreciarioConcepto_Load = function () {
        if (App.sPreciarioConcepto.getCount() != 0) {
        App.imgbtnExporToExcel.setDisabled(false);
    }
}
