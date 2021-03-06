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
    window.parent.App.wEmergente.setHeight(460);
    window.parent.App.wEmergente.setWidth(600);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Datos del concepto');
    window.parent.App.wEmergente.show();

    Ext.util.Cookies.set('cookiePreciario', registro.get('Preciario'));
    Ext.util.Cookies.set('cookieConceptoID', registro.get('ID'));
    Ext.util.Cookies.set('cookieConcepto', registro.get('Clave'));
    Ext.util.Cookies.set('cookieDescripcion', registro.get('Descripcion'));
    Ext.util.Cookies.set('cookieImporteInicial', registro.get('Importe'));
    Ext.util.Cookies.set('cookieImporteFinal', registro.get('Importefinal'));
    Ext.util.Cookies.set('cookiePrecioInicial', registro.get('Costo'));
    Ext.util.Cookies.set('cookieCantidadInicial', registro.get('Cantidad') + ' (' + registro.get('Unidad')+')');
    Ext.util.Cookies.set('cookieCantidadFinal', registro.get('Utilizada') + ' (' + registro.get('Unidad') + ')');
};

//Evento lanzado al agregar un registro al store
var sParametrosExporador_Add = function (concepto, registro) {


};

var sParametrosExporador_Load = function () {

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';



    App.txtPreciario.setValue(Ext.util.Cookies.get('cookiePreciario'));
    App.txtClave.setValue(Ext.util.Cookies.get('cookieConcepto'));
    App.txtConceptoID.setValue(Ext.util.Cookies.get('cookieConceptoID'));
    App.txtADescripcion.setValue(Ext.util.Cookies.get('cookieDescripcion'));
    App.txtImporteInicial.setValue(F.number(Ext.util.Cookies.get('cookieImporteInicial'), "$000,000,000.00"));
    App.txtImporteFinal.setValue(F.number(Ext.util.Cookies.get('cookieImporteFinal'), "$000,000,000.00"));
    App.txtPrecioInicial.setValue(F.number(Ext.util.Cookies.get('cookiePrecioInicial'), "$000,000,000.00"));
    App.txtCantidadInicial.setValue(Ext.util.Cookies.get('cookieCantidadInicial'));
    App.txtCantidadUtilizada.setValue(Ext.util.Cookies.get('cookieCantidadFinal'));

};


var sPreciarioConcepto_Load = function () {
        if (App.sPreciarioConcepto.getCount() != 0) {
        App.imgbtnExporToExcel.setDisabled(false);
    }
}



//Darle formato a la columna de Programado
var cImporte_renderer = function (valor, metadata, registro) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';

    if (parseFloat(registro.get('Importefinal')) > parseFloat(registro.get('Importe'))) {
        metadata.style = "background-color: #AE0000; color: #FFFFFF";

    }
    else {
        metadata.style = "background-color: #173300; color: #FFFFFF";
    }

    return F.number(valor, "$000,000,000.00");
};


//Darle formato a la columna de Programado
var txtCosto_renderer = function (valor) {


    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};


var imgbtnAceptarPreciarioExplorador = function () {
    var w = window.parent.App.wReporte;
    w.load('Previa.aspx');
    w.setHeight(146);
    w.setWidth(300);
    w.center();
    w.setTitle('Reporte del concepto');
    w.show(); 
}