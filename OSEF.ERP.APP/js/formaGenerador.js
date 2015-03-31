﻿var indiceDetalle;


//Evento lanzado al cargar el store de avance encabezado
var sFormaGenerador_Load = function () {



    App.sFormaGenerador.insert(App.sFormaGenerador.getCount(), { No: 'ADC-001' });

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

      

        if (registro.get('No').length != 0
        && registro.get('Localizacion').length != 0
        && registro.get('Total') != 0) {

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

    //    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de borrar
    //    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && App.sVolumetria.getAt(0).get('Estatus') == 'CONCLUIDO') {

    //        //Toma el primer elemento de la columna para poder desabilitarlo
    //        var botonEliminar = toolbar.items.get(0);
    //        botonEliminar.setDisabled(true);
    //        botonEliminar.setTooltip("No se puede borrar un concepto");
    //    }

    //    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de borrar
    //    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && App.sVolumetria.getAt(0).get('Estatus') == 'CANCELADO') {

    //        //Toma el primer elemento de la columna para poder desabilitarlo
    //        var botonEliminar = toolbar.items.get(0);
    //        botonEliminar.setDisabled(true);
    //        botonEliminar.setTooltip("No se puede borrar un concepto");
    //    }
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

    //    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo') {
    //        Ext.util.Cookies.set('cookieIDBorrarFotosVolumetria', App.sVolumetria.getAt(0).get('ID'));
    //        Ext.util.Cookies.set('cookieConceptoFotosVolumetria', registro.get('ConceptoID'));

    //        App.direct.obtenerImagenesPorConcepto();
    //    }

    //Validar si se habilita el boton de afectar
    //HabilitarAfectar();
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
    App.dfTotal.setValue('' + F.number(sum, "000,000,000.00"));
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
    App.dfTotal.setValue('' + F.number(sum, "000,000,000.00"));
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
    App.dfTotal.setValue('' + F.number(sum, "000,000,000.00"));
    ImporteFinal = sum;
}


//Obtner el indice del grid panel del detalle
var obetenerRenglon_Select = function (gridview, registro, index) {
    indiceDetalle = index;

}


var txtDescripcion_Corta_Change = function () {
    HabilitarGuardar();
}

//Validar si se habilita el botón d Afectar
function HabilitarGuardar() {
    //Obtiene la fecha de emision del store
    if (App.txtDescripcionCorta.getValue() != null) {


        if (App.gpFormaGenerador.getStore().getCount() != 0) 
            {

                if (App.sFormaGenerador.getAt(0).get('No').length != 0
                    && App.sFormaGenerador.getAt(0).get('Localizacion').length != 0
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
   
    window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Cantidad", parseFloat(App.dfTotal.getValue()));
    window.parent.App.wGenerador.hide();
}