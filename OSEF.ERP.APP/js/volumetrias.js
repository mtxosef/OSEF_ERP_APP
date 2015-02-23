//------------------------------------------------ENCABEZADO------------------------------------------------------------

//Boton de nuevo de la forma no del tablero
var imgbtnFormaNuevo_Click = function () {
    var d = new Date();
    //Limpiar controles del encabezado
  
    App.cmbMov.setReadOnly(false);
    App.txtfMovID.setValue(null);
    App.cmbPreciario.clearValue();
    App.cmbPreciario.setDisabled(false);
    App.txtfDescripcionPreciario.setValue(null);
    App.txtfIDSucursal.setValue('');
    App.txtfSucursalNombre.setValue('');

    App.dfFechaEmision.setDisabled(false);
    App.dfFechaEmision.setValue(d);

    App.imgbtnCancelar.setDisabled(true);
    App.txtfObservaciones.setValue(null);
    App.sbFormaVolumetriaDetalle.setText('SIN AFECTAR');

    //Borrar el GridPanel del Detalle y Encabezado
    App.sConceptos.removeAll();
    App.sPreciarioConcepto.removeAll();
    App.sVolumetria.removeAll();
    Ext.util.Cookies.set('cookieEditarVolumetria', 'Nuevo');
    window.parent.App.wEmergente.setTitle('Nueva Volumetría');
};

//Boton de abrir o cerrar de la forma
var imgbtnAbrir_Click = function () {
    window.parent.App.wEmergente.hide();
};


//Para el botón de eliminar de la forma, Eliminar un registro 
var imgbtnBorrar_Click_Success = function (response, result) {

    Ext.Msg.show({
        id: 'msgVolumetrias',
        title: 'Advertencia Volumetrias',
        msg: 'Se ha eliminado el movimiento',
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.WARNING
    });

    //Se actualiza el tablero
    window.parent.App.pCentro.getBody().App.sVolumetrias.reload();

    var d = new Date();
    //Limpiar controles del encabezado
    App.cmbMov.setReadOnly(false);
    App.txtfMovID.setValue(null);

    App.cmbPreciario.clearValue();
    App.cmbPreciario.setDisabled(false);
    App.txtfDescripcionPreciario.setValue(null);

    App.txtfIDSucursal.setValue('');
    App.txtfSucursalNombre.setValue('');


    App.dfFechaEmision.setValue(d);
    App.txtfObservaciones.setValue(null);
    App.sbFormaVolumetriaDetalle.setText('SIN AFECTAR');

    App.imgbtnBorrar.setDisabled(true);

    //Borrar el GridPanel del Detalle y Encabezado
    App.sConceptos.removeAll();
    App.sPreciarioConcepto.removeAll();
    App.sVolumetria.removeAll();
    Ext.util.Cookies.set('cookieEditarVolumetria', 'Nuevo');
    window.parent.App.wEmergente.setTitle('Nueva Volumetría');

};



//Para el botón de cancelar, cancela un registro
var imgbtnCancelar_Click_Success = function (response, result) {

    Ext.Msg.show({
        id: 'msgVolumetrias',
        title: 'Advertencia Volumetrias',
        msg: 'Se ha cancelado el movimiento',
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.WARNING
    });

    //Se actualiza el tablero
    window.parent.App.pCentro.getBody().App.sVolumetrias.reload();

    //Limpiar controles del encabezado
    App.cmbMov.setReadOnly(true);
    App.sbFormaVolumetriaDetalle.setText('CANCELADO');
    App.imgbtnCancelar.setDisabled(true);
    window.parent.App.wEmergente.setTitle('Volumetría Cancelada');
};


//Evento que se lanza al seleccionar algun valor de la sucursal
var cmbPreciario_Select = function (combobox, registro) {
    App.txtfDescripcionPreciario.setValue(registro[0].data.Descripcion);

    console.log(App.sPreciario.getAt(0).get('Sucursal'));

    if (App.sPreciario.getAt(0) != undefined) {
        App.txtfSucursalNombre.setValue(App.sPreciario.getAt(0).get('RSucursal').Nombre);
        App.txtfIDSucursal.setValue(App.sPreciario.getAt(0).get('RSucursal').ID);
    }

    //Valida qué movimiento es 
    if (App.cmbMov.getValue() == 'Fin') {

        //Valida si se habilita el boton de afectar cuando el movimiento es Fin
        HabilitarAfectarFin();
    }

    if (App.cmbMov.getValue() == 'Captura') {
        //Validar si se habilita el boton de afectar
        HabilitarAfectar();
    }


    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();

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
    //Valida qué movimiento es 
    if (App.cmbMov.getValue() == 'Fin') {
        //Valida si se habilita el boton de afectar cuando el movimiento es Fin
        HabilitarAfectarFin();
    }

    if (App.cmbMov.getValue() == 'Captura') {
        //Validar si se habilita el boton de afectar
        HabilitarAfectar();
    }

    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
};



//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Add = function (store, registros, index, eOpts) {
    var d = new Date();

    //Validar si es nuevo, se asigna el movimieno 
    if (registros[0].get('ID') == 'Captura' && Ext.util.Cookies.get('cookieEditarVolumetria') == 'Nuevo') {
        App.cmbMov.select(registros[0].get('ID'));
        // App.cmbMov.setReadOnly(true);
        App.dfFechaEmision.setValue(d);
        App.cmbPreciario.focus();
    }
    

};

//Evento que se lanza al seleccionar un elemento del ComboBox de Movimiento
var cmbMov_Select = function (combobox, registro) {
    //Asignar Fecha en el control Fecha de emisión
    var d = new Date();
    if (App.dfFechaEmision.getValue() == null) {
        App.dfFechaEmision.setValue(d);
    }

    if (combobox.value == 'Captura') {
        //Validar si se asigna el primer renglon del detalle
        PrimerRenglonDetalle();
        //Validar si se habilita el boton de afectar
        HabilitarAfectar();
    }
    if (combobox.value == 'Fin') {
        //Validar si se asigna el primer renglon del detalle
        PrimerRenglonDetalle();
        HabilitarAfectarFin();
        App.sConceptos.removeAll();
    }
    //Validar si se habilita Guardar
    HabilitarGuardar();
};


//Evento lanzado al cargar el store de avance encabezado
var sVolumetria_Load = function () {
    App.direct.sVolumetria_Load();
    store = window.parent.App.pCentro.getBody().App.sVolumetrias;

};

//Evento lanzado al agregar un registro al store
var sVolumetria_Add = function (avance, registro) {
    //Valida el estatus para ver si permite seguir capturando o no
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && registro[0].get('Estatus') == 'CONCLUIDO') {
        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfIDSucursal.setValue(registro[0].get('Sucursal'));
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.cmbPreciario.setValue(registro[0].get('Preciario'));
        App.txtfDescripcionPreciario.setValue(registro[0].get('RPreciario').Descripcion);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbFormaVolumetriaDetalle.setText(registro[0].get('Estatus'));

        //Deshabilita los campos en un movimiento afectado
        App.cmbMov.setReadOnly(true);
        App.cmbPreciario.setDisabled(true);
        App.dfFechaEmision.setDisabled(true);
        App.imgbtnAfectar.setDisabled(true);
        App.imgbtnGuardar.setDisabled(true);
        App.imgbtnCancelar.setDisabled(false);
    }

    //Valida el estatus para ver si permite seguir capturando o no
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && registro[0].get('Estatus') == 'CANCELADO') {

        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfIDSucursal.setValue(registro[0].get('Sucursal'));
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.cmbPreciario.setValue(registro[0].get('Preciario'));
        App.txtfDescripcionPreciario.setValue(registro[0].get('RPreciario').Descripcion);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbFormaVolumetriaDetalle.setText(registro[0].get('Estatus'));

        //Deshabilita los campos en un movimiento afectado
        App.cmbMov.setReadOnly(true);
        App.cmbPreciario.setDisabled(true);
        App.dfFechaEmision.setDisabled(true);
        App.imgbtnAfectar.setDisabled(true);
        App.imgbtnGuardar.setDisabled(true);
        App.imgbtnCancelar.setDisabled(true);
    }

    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && registro[0].get('Estatus') == 'BORRADOR' || registro[0].get('Estatus') == '') {

        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfIDSucursal.setValue(registro[0].get('Sucursal'));
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.cmbPreciario.setValue(registro[0].get('Preciario'));
        App.txtfDescripcionPreciario.setValue(registro[0].get('RPreciario').Descripcion);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbFormaVolumetriaDetalle.setText(registro[0].get('Estatus'));

        //Agregar una fila para seguir capturando
        var renglonAnterior = App.sConceptos.getAt(App.sConceptos.getCount() - 1).get('Renglon') + 1;
        App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
        App.imgbtnBorrar.setDisabled(false);
    }

};


//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {
    
    if (result.extraParamsResponse.accion == 'insertar') {
        Ext.Msg.show({
            id: 'msgVolumetria',
            title: 'GUARDAR',
            msg: '<p align="center">Movimiento registrado ID: ' + App.sVolumetria.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });
        Ext.util.Cookies.set('cookieEditarVolumetria', App.sVolumetria.getAt(0).get('ID'));
        //Activa el boton de borrar movimiento
        App.imgbtnBorrar.setDisabled(false);
        //Actualiza al estatus BORRADOR de la captura
        App.sbFormaVolumetriaDetalle.setText(App.sVolumetria.getAt(0).get('Estatus'));

        window.parent.App.pCentro.getBody().App.sVolumetrias.reload();

        //Deshabilita los comandos de Fotos
        App.ccFotos.commands[0].disabled = false;
        App.ccFotos.commands[1].disabled = false;
        App.gpVolumetriaDetalle.reconfigure();
    }
    else {
        Ext.Msg.show({
            id: 'msgVolumetria',
            title: 'ACTUALIZAR',
            msg: '<p align="center">Movimiento actualizado ID: ' + App.sVolumetria.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });
    }
};


//Afectar el movimiento
var imgbtnAfectar_Click_Success = function (response, result) {
    //1. Actualizar el store del tablero
    window.parent.App.pCentro.getBody().App.sVolumetrias.reload();

    //2. Lanzar ventana de movimiento afectado
    Ext.Msg.show({
        id: 'msgAvance',
        title: 'AFECTAR',
        msg: '<p align="center">Movimiento afectado ID: ' + App.sVolumetria.getAt(0).get('ID') + '.</p>',
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.INFO
    });

    Ext.util.Cookies.set('cookieEditarVolumetria', App.sVolumetria.getAt(0).get('ID'));

    //Actualizar campos afetados
    App.txtfMovID.setValue(App.sVolumetria.getAt(0).get('MovID'));
    App.sbFormaVolumetriaDetalle.setText(App.sVolumetria.getAt(0).get('Estatus'));

    //Deshabilita boton de afectar porque aqui concluye el flujo
    App.imgbtnAfectar.setDisabled(true);
    App.imgbtnCancelar.setDisabled(false);

    //3. Remover la útima fila
    var ultimoRegistro = App.sConceptos.getAt(App.sConceptos.getCount() - 1);
    if (ultimoRegistro.get('ConceptoID').length == 0 && ultimoRegistro.get('Cantidad') == 0 && ultimoRegistro.get('Utilizada') == 0) {
        App.sConceptos.removeAt(App.sConceptos.getCount() - 1);
    }

    //4. Deseleccionar datos del GridPanel y deshabilitar los controles
    App.gpVolumetriaDetalle.getSelectionModel().deselectAll();
    DeshabilitarControlesAfectar();

    //Deshabilita los comandos de Fotos
    App.ccFotos.commands[0].disabled = true;
    App.ccFotos.commands[1].disabled = false;
    App.gpVolumetriaDetalle.reconfigure();

};

//Método que se lanza antes de llamar al procedimiento de Afectar
var imgbtnAfectar_Click_Before = function () {
    if (App.sVolumetria.getCount() != 0) {
        if (App.sVolumetria.getAt(0).get('Estatus') == 'CONCLUIDO') {

            App.wEmergente.load('FormaAvanzarVolumetria.aspx');
            App.wEmergente.setHeight(170);
            App.wEmergente.setWidth(220);
            App.wEmergente.center();
            App.wEmergente.setTitle('Avanzar Movimiento');
            App.wEmergente.show();
            return false;
        }
        else {
            return true;
        }
    }
    else {
        return true;
    }
};


//-----------------------------------------DETALLE----------------------------------------------------------------
//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
    //Eliminar registro
    App.sConceptos.removeAt(fila);

    //Asignar renglones
    var renglon = 0;
    App.sConceptos.each(function (dato) {
        dato.set('Renglon', renglon);
        renglon = renglon + 1;
    });

    //Validar si se habilita el boton de afectar
    HabilitarAfectar();
};


//Evento que muestra el valor de la columna Concepto por su descripción y no por su ID del Detalle
var cDescripcion_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sPreciarioConcepto.findRecord('ID', valor);
        return registro.get('Descripcion');
    }
};


//Darle formato a la columna de Cantidad
var cCantidad_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.00");
};

//Darle formato a la columna de Cantidad
var cUtilizada_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.00");
};



//Ocultar el último renglon
var ccAcciones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    if (grid.getStore().getCount() - 1 == rowIndex) {
        toolbar.items.get(0).hide();
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de borrar
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && App.sVolumetria.getAt(0).get('Estatus') == 'CONCLUIDO' ) {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonEliminar = toolbar.items.get(0);
        botonEliminar.setDisabled(true);
        botonEliminar.setTooltip("No se puede borrar un concepto");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de borrar
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && App.sVolumetria.getAt(0).get('Estatus') == 'CANCELADO' ) {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonEliminar = toolbar.items.get(0);
        botonEliminar.setDisabled(true);
        botonEliminar.setTooltip("No se puede borrar un concepto");
    }

};


//Validaciones de comandos para fotos
var ccFotos_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    //alert('Si entro');
    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && App.sVolumetria.getAt(0).get('Estatus') == 'CONCLUIDO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar fotos a un movimiento concluido");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && App.sVolumetria.getAt(0).get('Estatus') == 'CANCELADO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar fotos a un movimiento cancelado");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar fotos 
    if (Ext.util.Cookies.get('cookieEditarVolumetria') == 'Nuevo' && App.sVolumetria.getAt(0) == undefined) {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(true);
        botonVerFotos2.setDisabled(true);
        botonCargar2.setTooltip("Debes de guardar el movimiento antes");
        botonVerFotos2.setTooltip("Debes de guardar el movimiento antes");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar y ver fotos
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && App.sVolumetria.getAt(0).get('Estatus') == 'BORRADOR') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(false);
        botonVerFotos2.setDisabled(false);
        botonCargar2.setTooltip("Cargar Fotos");
        botonVerFotos2.setTooltip("Ver Fotos");
    }

};


//Evento que se lanza despues de editar una columna en PreciarioConceptoVolumetria
var cePreciarioConcepto_Edit = function (cellediting, columna) {
    //Verificar si abajo de esta columna existe otra
    if (App.sConceptos.getAt(columna.rowIdx + 1) == undefined) {
        //Verificar si toda la fila contiene datos
        var registro = App.sConceptos.getAt(columna.rowIdx);
        //        var prueba =/^[a-zA-Z0-9]{1,2000}$/;
        if (registro.get('ConceptoID').length != 0 && registro.get('Utilizada') != 0) {
            //Obtener el Renglon anterior
            var renglonAnterior = App.sConceptos.getAt(columna.rowIdx).get('Renglon') + 1;
            //Insertar un nuevo registro
            App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
            //Actualiza el renglon anterior pintando el botón de borrar
            App.gpVolumetriaDetalle.getView().refreshNode(App.sConceptos.getCount() - 2);
            //Validar si se habilita el boton de afectar
            HabilitarAfectar();
        }
    }
};


//Evento que pondra la cantidad según el concepto obtenido
var cmbConcepto_Select = function (combobox, registro) {
    //Ayuda para traer lo que trae toda la funcion como parámetro
    //console.log(arguments);

    if (App.sConceptos.find('ConceptoID', registro[0].get('ID')) == -1) {

        //Variable que contiene el indicie del elemento seleccionado del comboBox
        var indiceCombo = registro[0].index;
        //Variale que guarda el indicie del renglon del GridPanel segun la posicion en la que se encuentre capturando el usuario
        var indice = App.gpVolumetriaDetalle.getSelectionModel().getSelection()[0].internalId;

        //se actualiza el Store contenedor con datos del store del comboBox
        App.sConceptos.getAt(indice).set("Cantidad", App.sPreciarioConcepto.getAt(indiceCombo).get('Cantidad'));
    }
    else {
        Ext.Msg.show({
            id: 'msgConceptoError',
            title: 'Error',
            msg: 'El concepto ya ha sido capturado ',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { 
                if (btn === 'ok') { 
                    App.cmbConcepto.setValue('');
                    App.sConceptos.getAt(App.gpVolumetriaDetalle.getSelectionModel().getSelection()[0].internalId).set('ConceptoID', '');
                } 
            },
            icon: Ext.MessageBox.ERROR
        });
    }
}


var ccFotos_Command = function (column, nombre, registro, renglon, opciones) {
    Ext.util.Cookies.set('cookieConceptoVolumetria', registro.get('ConceptoID'));
 
    if (nombre == 'cnCargarFotos') {
        App.wEmergente.load('FormaSubirImagenesPreciario.aspx');
        App.wEmergente.setHeight(350);
        App.wEmergente.setWidth(600);
        App.wEmergente.center();
        App.wEmergente.setTitle('Cargar Fotografías');
        App.wEmergente.show();
    }
    else {
        App.wEmergente.load('FormaImagenesPreciarios.aspx');
        App.wEmergente.setHeight(530);
        App.wEmergente.setWidth(680);
        App.wEmergente.center();
        App.wEmergente.setTitle('Visualizar Fotografías');
        App.wEmergente.show();
    }
};

//-----------------------------------------------VALIDACIONES-----------------------------------------------
//Función que valida si se habilita el primer renlgon en el GridPanel detalle
function PrimerRenglonDetalle() {
    //Validar si se asigna el primer renglon del concepto
    if (App.cmbMov.getValue() != null && App.cmbPreciario.getValue() != null && App.cmbMov.getValue() != 'Fin') {
        if (App.cmbPreciario.isValid()) {
            var store = App.gpVolumetriaDetalle.getStore();
            if (store.getCount() == 0) {
                //Insertar el primer registro
                store.insert(0, { Renglon: 0 });
            }
        }
    }
}

//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {
    if (App.cmbMov.getValue() != null && App.cmbPreciario.getValue() != null) {
        App.imgbtnGuardar.setDisabled(false);
    }
    else {
        App.imgbtnGuardar.setDisabled(true);
    }
}

//Validar si se habilita el botón d Afectar
function HabilitarAfectar() {
    //Obtiene la fecha de emision del store
    if (App.cmbMov.getValue() != null && App.cmbPreciario.getValue() != null) {
        if (App.cmbMov.isValid() && App.cmbPreciario.isValid()) {
            if (App.gpVolumetriaDetalle.getStore().getCount() != 0) {
                if (App.sConceptos.getAt(0).get('ConceptoID').length != 0 && App.sConceptos.getAt(0).get('Utilizada') != 0) {
                    App.imgbtnAfectar.setDisabled(false);
                }
            }
            else {
                App.imgbtnAfectar.setDisabled(true);
            }
        }
        else {
            App.imgbtnAfectar.setDisabled(true);
        }
    }
    else {
        App.imgbtnAfectar.setDisabled(true);
    }
}

//Validar si se habilita el botón d Afectar cuando se selecciona FIN
function HabilitarAfectarFin() {

    if (App.cmbMov.getValue() != null && App.cmbPreciario.getValue() != null && App.dfFechaEmision.getValue() != null) {
        App.imgbtnAfectar.setDisabled(false);
    }
    else {
        App.imgbtnAfectar.setDisabled(true);
    }
}

//Validar si se habilita el botón de Información
function HabilitarInformacion() {
    if (App.txtfIDSucursal.getValue() != null) {
        App.imgbtnInfo.setDisabled(false);
    }
    else {
        App.imgbtnInfo.setDisabled(true);
    }
}

//Evento que valida si ya esta concluido para bloquear el detalle y si es borrador no hace nada si ya esta concluido o cancelado
var validaConcluidos = function (a, d, f) {

    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && App.sVolumetria.getAt(0).get('Estatus') == 'CONCLUIDO') {

        return false;
    }
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && App.sVolumetria.getAt(0).get('Estatus') == 'CANCELADO') {

        return false;
    }
    else {
        return true
    }
};

//Función que deshabilita todos los controles cuando se afecta un movimiento
function DeshabilitarControlesAfectar() {
    App.cmbMov.setReadOnly(true);
    App.cmbPreciario.setDisabled(true);
    App.dfFechaEmision.setDisabled(true);
    App.txtfObservaciones.setDisabled(true);
    // App.gpVolumetriaDetalle.setDisabled(true);
    App.imgbtnGuardar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
}