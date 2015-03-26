//------------------------------------------------ENCABEZADO------------------------------------------------------------
var indiceDetalle;
//Boton de nuevo de la forma no del tablero
var imgbtnFormaNuevo_Click = function () {
    //Asignar la fecha en una variable
    var d = new Date();

    //Habilitar o Deshabilitar controles
    App.cmbMov.setValue("");
    App.txtfObservaciones.setDisabled(false);
    App.dfFechaEmision.setDisabled(false);
    App.imgbtnCancelar.setDisabled(true);

    //Limpiar campos
    App.txtfMovID.setValue('');
    App.cmbSucursal.setValue('');
    App.txtfSucursalNombre.setValue('');
    App.txtfObservaciones.setValue('');
    App.dfFechaEmision.setValue(d);
    App.txtfClave.setValue('');
    App.taDescripcion.setValue('');

    //Cambiar Estatus, Cookie y Titulo Window
    App.sbOrdenEstimacion.setText('SIN AFECTAR');
    Ext.util.Cookies.set('cookieEditarOrdenEstimacion', 'Nuevo');
    window.parent.App.wEmergente.setTitle('Nuevo Movimiento');

    //Borrar el GridPanel del Detalle y Encabezado
    App.sConceptos.removeAll();
    App.sOrdenEstimacion.removeAll();
};



//Vuelve al tablero ocultando la ventana emergente
var imgbtnAbrir_Click = function () {
    window.parent.App.wEmergente.hide();
};

//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Add = function (store, registros, index, eOpts) {
    var d = new Date();

    //Validar si es nuevo, se asigna el movimiento 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') == 'Nuevo') {
        
        // App.cmbMov.setReadOnly(true);
        App.dfFechaEmision.setValue(d);
        App.cmbMov.focus();
    }
};

//Evento que se lanza al seleccionar un elemento del ComboBox de Movimiento
var cmbMov_Select = function (combobox, registro) {
    //Asignar Fecha en el control Fecha de emisión
    var d = new Date();
    if (App.dfFechaEmision.getValue() == null) {
        App.dfFechaEmision.setValue(d);
    }

        //Validar si se asigna el primer renglon del detalle
        PrimerRenglonDetalle();
        //Validar si se habilita el boton de afectar
        //HabilitarAfectar();
        //Validar si se habilita Guardar
        // HabilitarGuardar();
};


     //Evento que se lanza al seleccionar algun valor de la sucursal
    var cmbSucursal_Select = function (combobox, registro) {
  
    App.txtfSucursalNombre.setValue(registro[0].data.Nombre);

    //Validar si se habilita el boton de afectar
    //HabilitarAfectar();
    //Validar si se habilita Guardar
    //HabilitarGuardar();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Asiganmos la cookie
    //Ext.util.Cookies.set('cookiePreciarioBusqueda', combobox.getValue());
};

     //Evento que se lanza al poner algun caracter en el control de la Sucursal
var cmbSucursal_Change = function (combobox, valorNuevo, viejoValor) {

    alert("entra");

    App.sSucursal.clearFilter();
    if (App.cmbSucursal.getValue() != null) {
        App.sSucursal.filter([{ filterFn: function (item) {
            if (item.get('ID').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1) { return true; }
            else { return false; }
        }
        }]);
    }
    else {
        App.txtfSucursalNombre.setValue('');
    }


    //Validar si se habilita el boton de afectar
    //HabilitarAfectar();

    //Validar si se habilita Guardar
    //HabilitarGuardar();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Asiganmos la cookie
    //Ext.util.Cookies.set('cookiePreciarioBusqueda', combobox.getValue());
};


//-----------------------------------------DETALLE----------------------------------------------------------------
var cCantidad_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};

var cPrecio_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};

var cImporte_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};




//Calular Importe cuando la columna de precio cambia
var calcularImportePrecio_Change = function (component) {
    var valorCantidad = App.sConceptos.getAt(indiceDetalle).data.Cantidad;

    if (valorCantidad == null || valorCantidad == "") {
        valorCantidad = 0;
    }

    var Importe = parseFloat(component.getValue() * parseFloat(valorCantidad))
    App.sConceptos.getAt(indiceDetalle).set('Importe', Importe);
}

//Calcula el importe cuando cambia la cantidad
var calcularImporteCantidad_Change = function (component) {
    var valorPrecio = App.sConceptos.getAt(indiceDetalle).data.Precio;

    if (valorPrecio == null || valorPrecio == "") {
        valorPrecio = 0;
    }

    var Importe = parseFloat(component.getValue() * parseFloat(valorPrecio))
    App.sConceptos.getAt(indiceDetalle).set('Importe', Importe);
}
//Obtner el indice del grid panel del detalle
var obetenerRenglon_Select = function (a, b, c) {
    indiceDetalle= b.internalId;
}


//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
    //Eliminar registro
    App.sConceptos.removeAt(fila);

//    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo') {
//        Ext.util.Cookies.set('cookieIDBorrarFotosVolumetria', App.sVolumetria.getAt(0).get('ID'));
//        Ext.util.Cookies.set('cookieConceptoFotosVolumetria', registro.get('ConceptoID'));

//        App.direct.obtenerImagenesPorConcepto();
//    }

    //Asignar renglones
    var renglon = 0;
    App.sConceptos.each(function (dato) {
        dato.set('Renglon', renglon);
        renglon = renglon + 1;
    });

    //Validar si se habilita el boton de afectar
    //HabilitarAfectar();
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



//Evento que se lanza despues de editar una columna en PreciarioConceptoVolumetria
var cePreciarioConcepto_Edit = function (cellediting, columna) {

    //Valida que el movimiento sea diferente de nuevo y que la columna en la que se obtenga el valor original seal la unica que se mande al metodo del lado del servidor
//    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo') {
//        if (columna.field == 'ConceptoID') {
//            Ext.util.Cookies.set('cookieIDBorrarFotosVolumetria', App.sVolumetria.getAt(0).get('ID'));
//            Ext.util.Cookies.set('cookieConceptoFotosVolumetria', columna.originalValue);
//            App.direct.obtenerImagenesPorConcepto();
//        }
//    }

    //Verificar si abajo de esta columna existe otra
    if (App.sConceptos.getAt(columna.rowIdx + 1) == undefined) {
        //Verificar si toda la fila contiene datos
        var registro = App.sConceptos.getAt(columna.rowIdx);
        if (registro.get('ConceptoID').length != 0 && registro.get('Cantidad') != 0 && registro.get('Precio') != 0) {
            //Obtener el Renglon anterior
            var renglonAnterior = App.sConceptos.getAt(columna.rowIdx).get('Renglon') + 1;
            //Insertar un nuevo registro
            App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
            //Actualiza el renglon anterior pintando el botón de borrar
            App.gpOrdenEstimacion.getView().refreshNode(App.sConceptos.getCount() - 2);
            //Validar si se habilita el boton de afectar
           // HabilitarAfectar();
        }
    }
};

//Evento que abre el generador
var ccGenerador_Command = function (columna, comando, registro, fila, opciones) {
    window.parent.App.wGenerador.load('FormaGenerador.aspx');
    window.parent.App.wGenerador.setHeight(295);
    window.parent.App.wGenerador.setWidth(820);
    window.parent.App.wGenerador.center();
    window.parent.App.wGenerador.setTitle('Generador');
    window.parent.App.wGenerador.show();


};


//-----------------------------------------------VALIDACIONES-----------------------------------------------
//Función que valida si se habilita el primer renlgon en el GridPanel detalle
function PrimerRenglonDetalle() {
    //Validar si se asigna el primer renglon del concepto
        if (App.cmbMov.getValue() != null && App.cmbSucursal.getValue() != null) {

            var store = App.gpOrdenEstimacion.getStore();
                if (store.getCount() == 0) {
                    //Insertar el primer registro
                    store.insert(0, { Renglon: 0 });
            
            }
        }
    };


    //Evento que valida si ya esta concluido para bloquear el detalle y si es borrador no hace nada si ya esta concluido o cancelado
    var validaConcluidos = function (a, d, f) {
        if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {
            return false;
        }
        if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {
            return false;
        }
        else {
            return true
        }
    };