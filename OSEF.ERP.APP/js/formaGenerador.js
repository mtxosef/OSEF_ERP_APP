﻿var indiceDetalle;



//Evento que valida si ya esta concluido para bloquear el detalle y si es borrador no hace nada si ya esta concluido o cancelado
var validaConcluidos = function (a, d, f) {

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {
        return false;
  
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    else if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {
        return false;

    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    else if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {
        return false;
    }

    else {
        return true
    }
};

//Evento lanzado al cargar el store de avance encabezado
var sFormaGenerador_Load = function () {

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {

        App.imgbtnAceptar.setDisabled(true);
        App.txtDescripcionCorta.setDisabled(true);
        App.txtPlano.setDisabled(true);

    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    else if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {

        App.imgbtnAceptar.setDisabled(true);
        App.txtDescripcionCorta.setDisabled(true);
        App.txtPlano.setDisabled(true);

    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    else if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {

        App.imgbtnAceptar.setDisabled(true);
        App.txtDescripcionCorta.setDisabled(true);
        App.txtPlano.setDisabled(true);

    }
    else if (App.sFormaGenerador.getCount() < 19) {
        App.sFormaGenerador.insert(App.sFormaGenerador.getCount(), {});

    }

    App.txtDescripcionCorta.setValue(App.sFormaGenerador.getAt(0).get('Descripcion'));
    App.txtPlano.setValue(App.sFormaGenerador.getAt(0).get('Plano'));

    //Pinta el total
    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue(F.number(sum, "000,000,000.00"));
    ImporteFinal = sum;
};


var nfLargo_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.00");
};

var nfAncho_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.00");
};

var nfAlto_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.00");
};

var nfCantidad_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.00");
};

var ncTotal_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.00");
};


//Evento que se lanza despues de editar una columna
var ceGenerador_Edit = function (cellediting, columna) {
    //Verificar si abajo de esta columna existe otra
    if (App.sFormaGenerador.getAt(columna.rowIdx + 1) == undefined) {
        //Verificar si toda la fila contiene datos
        var registro = App.sFormaGenerador.getAt(columna.rowIdx);



        if (registro.get('Area').length != 0
        && registro.get('Total') != 0 && App.sFormaGenerador.getCount() < 19) {

            //Insertar un nuevo registro
            App.sFormaGenerador.insert(App.sFormaGenerador.getCount(), {});
            //Actualiza el renglon anterior pintando el botón de borrar
            App.gpFormaGenerador.getView().refreshNode(App.sFormaGenerador.getCount() - 2);

           
            //Validar si se habilita el boton de afectar
            HabilitarGuardar();

        }
    }
};

//Ocultar el último renglon
var ccAcciones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    if (grid.getStore().getCount() - 1 == rowIndex) {
        toolbar.items.get(0).hide();
    }

};


//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
    //Eliminar registro
    App.sFormaGenerador.removeAt(fila);

   
   //Setea el valor final 
    ImporteFinal = ImporteFinal - parseFloat(registro.get('Total'));
    

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue('' + F.number(ImporteFinal, "000,000,000.00"));
    ImporteFinal = ImporteFinal;

};


var ImporteFinal;
//Calular Total cuando la columnas cambian
var calcularTotalLargo_Change = function (component) {

    var valorancho = App.sFormaGenerador.getAt(indiceDetalle).data.Ancho;
    var valorAlto = App.sFormaGenerador.getAt(indiceDetalle).data.Alto;
    var valorCantidad = App.sFormaGenerador.getAt(indiceDetalle).data.Cantidad;



    if (valorancho == null || valorancho == "") {
        valorancho = 1;
    }
    if (valorAlto == null || valorAlto == "") {
        valorAlto = 1;
    }
    if (valorCantidad == null || valorCantidad == "") {
        valorCantidad = 1;
    }

    var Total = parseFloat(component.getValue() * parseFloat(valorancho) * parseFloat(valorAlto) * parseFloat(valorCantidad))
    App.sFormaGenerador.getAt(indiceDetalle).set('Total', Total);

    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue('' + F.number(sum, "000,000,000.00"));
    ImporteFinal = sum;
}

//Calular Total cuando la columnas cambian
var calcularTotalAncho_Change = function (component) {

    var valorLargo = App.sFormaGenerador.getAt(indiceDetalle).data.Largo;
    var valorAlto = App.sFormaGenerador.getAt(indiceDetalle).data.Alto;
    var valorCantidad = App.sFormaGenerador.getAt(indiceDetalle).data.Cantidad;


    if (valorLargo == null || valorLargo == "") {
        valorLargo = 1;
    }
    if (valorAlto == null || valorAlto == "") {
        valorAlto = 1;
    }
    if (valorCantidad == null || valorCantidad == "") {
        valorCantidad = 1;
    }
   
    var Total = parseFloat(component.getValue() * parseFloat(valorLargo) * parseFloat(valorAlto) * parseFloat(valorCantidad))
    App.sFormaGenerador.getAt(indiceDetalle).set('Total', Total);

    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue(F.number(sum, "000,000,000.00"));
    ImporteFinal = sum;
}


//Calular Total cuando la columnas cambian
var calcularTotalAlto_Change = function (component) {


    var valorLargo = App.sFormaGenerador.getAt(indiceDetalle).data.Largo;
    var valorAncho = App.sFormaGenerador.getAt(indiceDetalle).data.Ancho;
    var valorCantidad = App.sFormaGenerador.getAt(indiceDetalle).data.Cantidad;

    if (valorLargo == null || valorLargo == "") {
        valorLargo = 1;
    }
    if (valorAncho == null || valorAncho == "") {
        valorAncho = 1;
    }
    if (valorCantidad == null || valorCantidad == "") {
        valorCantidad = 1;
    }

    var Total = parseFloat(component.getValue() * parseFloat(valorLargo) * parseFloat(valorAncho) * parseFloat(valorCantidad))
    App.sFormaGenerador.getAt(indiceDetalle).set('Total', Total);

    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue(F.number(sum, "000,000,000.00"));
    ImporteFinal = sum;

}

//Calular Total cuando la columnas cambian
var calcularTotalCantidad_Change = function (component) {

    var valorLargo = App.sFormaGenerador.getAt(indiceDetalle).data.Largo;
    var valorAncho = App.sFormaGenerador.getAt(indiceDetalle).data.Ancho;
    var valorAlto = App.sFormaGenerador.getAt(indiceDetalle).data.Alto;

    if (valorLargo == null || valorLargo == "") {
        valorLargo = 1;
    }
    if (valorAncho == null || valorAncho == "") {
        valorAncho = 1;
    }
    if (valorAlto == null || valorAlto == "") {
        valorAlto = 1;
    }

    var Total = parseFloat(component.getValue() * parseFloat(valorLargo) * parseFloat(valorAncho) * parseFloat(valorAlto))
    App.sFormaGenerador.getAt(indiceDetalle).set('Total', Total);

    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue(F.number(sum, "000,000,000.00"));
    ImporteFinal = sum;
}


//Obtner el indice del grid panel del detalle
var obetenerRenglon_Select = function (gridview, registro, index) {
    indiceDetalle = index;

}


var txtDescripcion_Corta_Change = function () {

    App.txtDescripcionCorta.setValue(App.txtDescripcionCorta.getValue().toUpperCase());
    HabilitarGuardar();
}

//Validar si se habilita el botón d Afectar
function HabilitarGuardar() {
    //Obtiene la fecha de emision del store
    if (App.txtDescripcionCorta.getValue() != '' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'BORRADOR' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Mov').trim() != 'Estimacion') {


        if (App.gpFormaGenerador.getStore().getCount() != 0) 
            {

                if (App.sFormaGenerador.getAt(0).get('Area').length != 0
                    && App.sFormaGenerador.getAt(0).get('Total') != 0) {

                    App.imgbtnAceptar.setDisabled(false);
                }
            }
            else 
            {
                App.imgbtnAceptar.setDisabled(true);
            }
        
        
    }
    else {
        App.imgbtnAceptar.setDisabled(true);
    }
}


var imgbtnAceptar_Click = function () {


    window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Cantidad", parseFloat(ImporteFinal));
    window.parent.App.wGenerador.hide();
}




var txtDescripcion_Corta_SpecialKey = function (field, eventArgs) {



    if (eventArgs.getKey() == eventArgs.ENTER) {

      

    }



};