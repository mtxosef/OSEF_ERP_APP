﻿//------------------------------------------------ENCABEZADO------------------------------------------------------------
var indiceDetalle;
var ImporteFinal;
//Boton de nuevo de la forma no del tablero
var imgbtnFormaNuevo_Click = function () {
    //Asignar la fecha en una variable
    var d = new Date();

    //Habilitar o Deshabilitar controles
    //App.cmbMov.setValue("");
    //App.cmbMov.setReadOnly(false);

    //identificamos que tablero de que modulo es
    var tablero = window.parent.App.pCentro.getBody().App.gpOrdenesEstimaciones.title;

    if (tablero == 'REPORTES & ESTIMACIONES') {
        App.cmbMov.select('Mesa de reporte');
        App.cmbMov.setReadOnly(true);
        //Nos sirve como idenfificador para saber si se van a subir croquis de orden de cambio o reportes
        Ext.util.Cookies.set('cockieMovimientoCroquis', 'Reporte');
        App.chkBoxOrdenCompra.setVisible(false);


    }
    else {
        App.cmbMov.select('Orden de Cambio');
        App.cmbMov.setReadOnly(true);
        //Nos sirve como idenfificador para saber si se van a subir croquis de orden de cambio o reportes
        Ext.util.Cookies.set('cockieMovimientoCroquis', 'Orden');
        App.chkBoxOrdenCompra.setVisible(true);
    }


    App.txtfObservaciones.setDisabled(false);
    App.dfFechaEmision.setDisabled(false);
    App.imgbtnCancelar.setDisabled(true);
    App.imgbtnImprimir.setDisabled(true);
    //Limpiar campos
    App.txtfMovID.setValue('');
    App.txtfSucursalCR.setValue('');
    App.txtfSucursalCR.setDisabled(false);
    App.txtfSucursalNombre.setValue('');
    App.txtfObservaciones.setValue('');
    App.dfFechaEmision.setValue(d);
    App.txtfClave.setValue('');
    App.taDescripcion.setValue('');

    App.txtfNoReporte.setValue('');
    App.cmbDivision.setValue('');
    App.dfFechaOrigen.setValue('');
    App.dfFechaMaxima.setValue('');
    App.dfFechaOrigen.setReadOnly(false);
    App.dfFechaMaxima.setReadOnly(false);
    App.nfDiasAtencion.setValue('');
    App.txtfReporta.setValue('');
    App.txtfTrabajoRequerido.setValue('');

    App.txtfCodigoFalla.setValue('');
    App.dfFechaLlegada.setValue('');
    App.dfFechaLlegada.setReadOnly(false);
    App.tfHoraLlegada.setValue('');
    App.tfHoraLlegada.setReadOnly(false);
    App.dfFechaFinActividad.setValue('');
    App.dfFechaFinActividad.setReadOnly(false);
    App.tfHoraFinActividad.setValue('');
    App.tfHoraFinActividad.setReadOnly(false);
    App.cmbCuadrilla.setValue('');
    App.tHoraOrigen.setValue('');
    App.tHoraOrigen.setReadOnly(false);
    App.chkAtendido.setValue(false);


    //Cambiar Estatus, Cookie y Titulo Window
    App.sbOrdenEstimacion.setText('SIN AFECTAR');
    Ext.util.Cookies.set('cookieEditarOrdenEstimacion', 'Nuevo');
    Ext.util.Cookies.set('cookieEsEstimacion', 'No');
    window.parent.App.wEmergente.setTitle('Nuevo Movimiento');

    //Borrar el GridPanel del Detalle y Encabezado
    App.sConceptos.removeAll();
    App.sOrdenEstimacion.removeAll();
};

var imgbtnImprimir_Click = function () {
    if (App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Mesa de reporte' || App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {
        Ext.util.Cookies.set('NReporte', App.txtfNoReporte.getValue());
        window.parent.App.wGenerador.load('FormaReporteEstimacion.aspx');
        window.parent.App.wGenerador.setHeight(160);
        window.parent.App.wGenerador.setWidth(590);
        window.parent.App.wGenerador.center();
        window.parent.App.wGenerador.setTitle('Reporte del Movimiento: ' + Ext.util.Cookies.get('cookieEditarOrdenEstimacion'));
        window.parent.App.wGenerador.show();

    }
    else {
        window.parent.App.wGenerador.load('FormaReporteOrdenCambioD.aspx');
        window.parent.App.wGenerador.setHeight(160);
        window.parent.App.wGenerador.setWidth(590);
        window.parent.App.wGenerador.center();
        window.parent.App.wGenerador.setTitle('Reporte del Movimiento: ' + Ext.util.Cookies.get('cookieEditarOrdenEstimacion'));
        window.parent.App.wGenerador.show();
    }
}

//Vuelve al tablero ocultando la ventana emergente
var imgbtnAbrir_Click = function () {
    window.parent.App.wEmergente.hide();
};

//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Add = function (store, registros, index, eOpts) {
    var d = new Date();

    //Validar si es nuevo, se asigna el movimiento 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') == 'Nuevo') {

        //identificamos que tablero de que modulo es
        var tablero = window.parent.App.pCentro.getBody().App.gpOrdenesEstimaciones.title;



        if (tablero == 'REPORTES & ESTIMACIONES') {
            App.cmbMov.select('Mesa de reporte');
            App.cmbMov.setReadOnly(true);
            //Nos sirve como idenfificador para saber si se van a subir croquis de orden de cambio o reportes
            Ext.util.Cookies.set('cockieMovimientoCroquis', 'Reporte');
            App.chkBoxOrdenCompra.setVisible(false);
            App.txtReferenciaOrden.setVisible(false);


        }
        else {
            App.cmbMov.select('Orden de Cambio');
            App.cmbMov.setReadOnly(true);
            //Nos sirve como idenfificador para saber si se van a subir croquis de orden de cambio o reportes
            Ext.util.Cookies.set('cockieMovimientoCroquis', 'Orden');
            App.chkBoxOrdenCompra.setVisible(true);
            App.txtReferenciaOrden.setVisible(true);
        }

        // App.cmbMov.setReadOnly(true);
        App.dfFechaEmision.setValue(d);
        App.cmbMov.focus();
    }
};

//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Change = function (combo) {
    if (combo.value.trim() == 'Mesa de reporte') {
        Ext.util.Cookies.set('cookieMovimientoIdentificador', 'Mnto');
        //   App.pDatosReporte.show(); 
        App.pDatosReporte.tab.show();
        App.pDatosReporteDos.tab.show();
        //  App.cIntExt.hidden = false;
        App.cIntExt.setVisible(true);
        App.fufNormal.hidden = false;
        App.imgNormal.hidden = false;

        App.txtNoOrden.setVisible(false);
        //Nos sirve como idenfificador para saber si se van a subir croquis de orden de cambio o reportes
        Ext.util.Cookies.set('cockieMovimientoCroquis', 'Reporte');

        App.chkBoxOrdenCompra.setVisible(false);

    }

    if (combo.value.trim() == 'Orden de Cambio') {
        Ext.util.Cookies.set('cookieMovimientoIdentificador', 'Obra');
        App.pDatosReporte.hide();
        App.pDatosReporte.tab.hide();
        App.pDatosReporteDos.tab.hide();
        App.pDatosReporte.hide();
        //  App.cIntExt.setVisible(false);
        App.cIntExt.hidden = true;
        App.txtNoOrden.setVisible(true);
        //Nos sirve como idenfificador para saber si se van a subir croquis de orden de cambio o reportes
        Ext.util.Cookies.set('cockieMovimientoCroquis', 'Orden');

        App.chkBoxOrdenCompra.setVisible(false);
    }
    App.gpOrdenEstimacion.reconfigure();
};




//Evento que se lanza al seleccionar un elemento del ComboBox de Movimiento
var cmbMov_Select = function (combobox, registro) {
    //Asignar Fecha en el control Fecha de emisión
    var d = new Date();
    if (App.dfFechaEmision.getValue() == null) {
        App.dfFechaEmision.setValue(d);
    }
    //Limpia el detalle del preciario
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') == 'Nuevo') {
        App.sConceptos.removeAll();
    }
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Validar si se habilita el boton de afectar
    HabilitarAfectar();
    //Validar si se habilita Guardar
    HabilitarGuardar();
};

//Evento de clic del botón BuscarSucursal
var btnBuscarSucursal_Click = function () {
    window.parent.App.wAyudaConcepto.load('FormaBuscaSucursal.aspx');
    window.parent.App.wAyudaConcepto.setHeight(370);
    window.parent.App.wAyudaConcepto.setWidth(720);
    window.parent.App.wAyudaConcepto.center();
    window.parent.App.wAyudaConcepto.setTitle('Seleccionar Sucursal');
    window.parent.App.wAyudaConcepto.show();
};

//Evento de clic del botón BuscarCodigo
var btnBuscarCodigos_Click = function () {

    if (App.dfFechaOrigen.getValue() != null) {
        window.parent.App.wAyudaConcepto.load('FormaBuscaCodigoPPTA.aspx');
        window.parent.App.wAyudaConcepto.setHeight(370);
        window.parent.App.wAyudaConcepto.setWidth(615);
        window.parent.App.wAyudaConcepto.center();
        window.parent.App.wAyudaConcepto.setTitle('Seleccionar Código');
        window.parent.App.wAyudaConcepto.show();
    }
    else {
        Ext.Msg.show({
            id: 'msgOrdenesEstimaciones',
            title: 'CÓDIGO FALLA',
            msg: '<p align="center">Debes de seleccionar una fecha de origen.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });
    }
};

//Evento que se lanza al poner algun caracter en el control de la Sucursal
var txtfSucursalCR_Change = function () {
    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se habilita el boton de afectar
    HabilitarAfectar();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {

    //1. Validar si se hizo un INSERT o UPDATE
    if (result.extraParamsResponse.accion == 'insertar') {
        Ext.Msg.show({
            id: 'msgOrdenesEstimaciones',
            title: 'GUARDAR',
            msg: '<p align="center">Movimiento registrado ID: ' + App.sOrdenEstimacion.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });

        //2. Activa el boton de borrar movimiento
        App.imgbtnBorrar.setDisabled(false);

        //3. Actualiza al estatus BORRADOR de la captura
        App.sbOrdenEstimacion.setText(App.sOrdenEstimacion.getAt(0).get('Estatus'));


        //4. Recargar el tablero
        window.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.reload();
        App.txtNoOrden.setValue(App.sOrdenEstimacion.getAt(0).get('NoOrden'));
        //5. Asignar la cookie con el nuevo ID y asignarlo al titulo de la ventan
        Ext.util.Cookies.set('cookieEditarOrdenEstimacion', App.sOrdenEstimacion.getAt(0).get('ID'));
        window.parent.App.wEmergente.setTitle('Editar Movimiento ' + App.sOrdenEstimacion.getAt(0).get('ID'));

        App.cmbMov.setReadOnly(true);
        //6. Deshabilita los comandos del grid
        App.ccFotos.commands[0].disabled = false;
        App.ccFotos.commands[1].disabled = false;
        App.ccCroquis.commands[0].disabled = false;
        App.ccCroquis.commands[1].disabled = false;
        App.ccFacturas.commands[0].disabled = false;
        App.ccFacturas.commands[1].disabled = false;
        App.gpOrdenEstimacion.reconfigure();

    }
    else {
        Ext.Msg.show({
            id: 'msgOrdenesEstimaciones',
            title: 'ACTUALIZAR',
            msg: '<p align="center">Movimiento actualizado ID: ' + App.sOrdenEstimacion.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });
        //4. Recargar el tablero

        window.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.reload({
            callback: function () {
                window.parent.App.pCentro.getBody().App.gpOrdenesEstimaciones.getSelectionModel().select(window.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.find("Id", Ext.util.Cookies.get('cookieEditarOrdenEstimacion')));
            }

        });



    }
    App.sConceptos.reload({
        callback: function () {
            if (App.sConceptos.getCount() > 0) {
                //Obtener el Renglon anterior
                var auxRenglonAnterior = App.sConceptos.getCount() - 1;
                var renglonAnterior = App.sConceptos.getAt(auxRenglonAnterior).get('Renglon') + 1;
                App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
            } else {
                App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: 1 });
            }
        }
    });

};

//Para el botón de eliminar de la forma, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {
    Ext.Msg.show({
        id: 'msgOrdenEstimacion',
        title: 'Advertencia Movimiento',
        msg: 'Se ha eliminado el movimiento',
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.WARNING
    });

    //Se actualiza el tablero
    window.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.reload();
    window.parent.App.wEmergente.hide();

};

//Método que se lanza antes de llamar al procedimiento de Afectar
var imgbtnAfectar_Click_Before = function () {
    Ext.util.Cookies.set('cookieEsEstimacion', 'No');

    if (App.sOrdenEstimacion.getCount() != 0) {
        if (App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO' && App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Mesa de reporte') {
            Ext.util.Cookies.set('cookieIDMov', App.sOrdenEstimacion.getAt(0).get('ID'));
            Ext.util.Cookies.set('cookieEsEstimacion', 'Reporte');
            App.wEmergente.load('FormaAvanzarOrdenEstimacion.aspx');
            App.wEmergente.setHeight(170);
            App.wEmergente.setWidth(220);
            App.wEmergente.center();
            App.wEmergente.setTitle('Avanzar movimiento');
            App.wEmergente.show();
            return false;
        }
        else {
            Ext.util.Cookies.set('cookieIDMov', App.sOrdenEstimacion.getAt(0).get('ID'));
            Ext.util.Cookies.set('cookieEsEstimacion', 'No');
            return true;
        }
    }
    else {
        Ext.util.Cookies.set('cookieEsEstimacion', 'No');
        return true;
    }
};

//Afectar el movimiento
var imgbtnAfectar_Click_Success = function (response, result) {
    //1. Actualizar el store del tablero
    window.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.reload();
    var d = new Date();

    if (result.extraParamsResponse.mov == 'Estimacion') {

        //2. Lanzar ventana de movimiento afectado
        Ext.Msg.show({
            id: 'msgAvanzar',
            title: 'AFECTAR',
            msg: '<p align="center">Nueva Estimación ID: ' + App.sOrdenEstimacion.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });
        App.sConceptos.removeAt(App.sConceptos.getCount() - 1);
        //Actualizar campos 
        Ext.util.Cookies.set('cookieEditarOrdenEstimacion', App.sOrdenEstimacion.getAt(0).get('ID'));
        App.cmbMov.setReadOnly(true);
        App.txtfSucursalCR.setDisabled(true);
        App.txtfMovID.setValue(App.sOrdenEstimacion.getAt(0).get('MovID'));
        App.sbOrdenEstimacion.setText(App.sOrdenEstimacion.getAt(0).get('Estatus'));

        window.parent.App.wEmergente.setTitle('Editar Movimiento ' + Ext.util.Cookies.get('cookieEditarOrdenEstimacion'));
        App.cmbMov.setValue(App.sOrdenEstimacion.getAt(0).get('Mov'));

        App.dfFechaEmision.setValue(d);
        App.sbOrdenEstimacion.setText(App.sOrdenEstimacion.getAt(0).get('Estatus'));



        //6. Deshabilita los comandos del grid
        App.ccFotos.commands[0].disabled = false;
        App.ccFotos.commands[1].disabled = false;
        App.ccCroquis.commands[0].disabled = false;
        App.ccCroquis.commands[1].disabled = false;
        App.ccFacturas.commands[0].disabled = false;
        App.ccFacturas.commands[1].disabled = false;
        App.gpOrdenEstimacion.reconfigure();




    }

    if (result.extraParamsResponse.mov == 'Reporte') {
        //2. Lanzar ventana de movimiento afectado
        Ext.Msg.show({
            id: 'msgAvance',
            title: 'AFECTAR',
            msg: '<p align="center">Movimiento afectado ID: ' + App.sOrdenEstimacion.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });

        Ext.util.Cookies.set('cookieEditarOrdenEstimacion', App.sOrdenEstimacion.getAt(0).get('ID'));
        App.cmbMov.setReadOnly(true);
        App.txtfSucursalCR.setDisabled(true);
        App.dfFechaEmision.setReadOnly(true);
        App.txtfObservaciones.setReadOnly(true);
        App.txtfNoReporte.setReadOnly(true);
        App.cmbDivision.setReadOnly(true);
        App.dfFechaOrigen.setReadOnly(true);
        App.dfFechaMaxima.setReadOnly(true);
        App.tHoraOrigen.setReadOnly(true);
        App.nfDiasAtencion.setReadOnly(true);
        App.txtfReporta.setReadOnly(true);
        App.txtfTrabajoRequerido.setReadOnly(true);
        App.txtfCodigoFalla.setReadOnly(true);
        App.dfFechaLlegada.setReadOnly(true);
        App.tfHoraLlegada.setReadOnly(true);
        App.dfFechaFinActividad.setReadOnly(true);
        App.tfHoraFinActividad.setReadOnly(true);
        App.cmbCuadrilla.setReadOnly(true);
        App.chkAtendido.setReadOnly(true);


        //Actualizar campos afetados
        App.txtfMovID.setValue(App.sOrdenEstimacion.getAt(0).get('MovID'));
        App.sbOrdenEstimacion.setText(App.sOrdenEstimacion.getAt(0).get('Estatus'));
        window.parent.App.wEmergente.setTitle('Editar Movimiento ' + Ext.util.Cookies.get('cookieEditarOrdenEstimacion'));

        //Deshabilita boton de afectar porque aqui concluye el flujo
        App.imgbtnAfectar.setDisabled(false);
        App.imgbtnCancelar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(true);
        App.imgbtnGuardar.setDisabled(true);
        App.imgbtnImprimir.setDisabled(false);



        //3. Remover la útima fila
        var ultimoRegistro = App.sConceptos.getAt(App.sConceptos.getCount() - 1);
        if (ultimoRegistro.get('ConceptoID').length == 0 && ultimoRegistro.get('Cantidad') == 0 && ultimoRegistro.get('Precio') == 0) {
            App.sConceptos.removeAt(App.sConceptos.getCount() - 1);
        }

        //4. Deseleccionar datos del GridPanel y deshabilitar los controles
        App.gpOrdenEstimacion.getSelectionModel().deselectAll();

        //Deshabilita los comandos del Grid
        App.ccFotos.commands[0].disabled = false;
        App.ccFotos.commands[1].disabled = false;
        App.ccCroquis.commands[0].disabled = false;
        App.ccCroquis.commands[1].disabled = false;
        App.ccFacturas.commands[0].disabled = false;
        App.ccFacturas.commands[1].disabled = false;
        App.gpOrdenEstimacion.reconfigure();
    }

    if (result.extraParamsResponse.mov == 'Orden') {
        //2. Lanzar ventana de movimiento afectado
        Ext.Msg.show({
            id: 'msgAvance',
            title: 'AFECTAR',
            msg: '<p align="center">Movimiento afectado ID: ' + App.sOrdenEstimacion.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });

        Ext.util.Cookies.set('cookieEditarOrdenEstimacion', App.sOrdenEstimacion.getAt(0).get('ID'));
        App.cmbMov.setReadOnly(true);
        App.txtfSucursalCR.setDisabled(true);
        App.txtfObservaciones.setDisabled(true);
        App.chkBoxOrdenCompra.setDisabled(true);


        //Actualizar campos afetados
        App.txtfMovID.setValue(App.sOrdenEstimacion.getAt(0).get('MovID'));
        App.sbOrdenEstimacion.setText(App.sOrdenEstimacion.getAt(0).get('Estatus'));

        window.parent.App.wEmergente.setTitle('Editar Movimiento ' + Ext.util.Cookies.get('cookieEditarOrdenEstimacion'));

        //Deshabilita boton de afectar porque aqui concluye el flujo
        App.imgbtnAfectar.setDisabled(true);
        App.imgbtnGuardar.setDisabled(true);
        App.imgbtnCancelar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(true);
        App.imgbtnImprimir.setDisabled(false);

        //3. Remover la útima fila
        var ultimoRegistro = App.sConceptos.getAt(App.sConceptos.getCount() - 1);
        if (ultimoRegistro.get('ConceptoID').length == 0 && ultimoRegistro.get('Cantidad') == 0 && ultimoRegistro.get('Precio') == 0) {
            App.sConceptos.removeAt(App.sConceptos.getCount() - 1);
        }

        //4. Deseleccionar datos del GridPanel y deshabilitar los controles
        //DeshabilitarControlesAfectar();
        App.gpOrdenEstimacion.getSelectionModel().deselectAll();

        //Deshabilita los comandos del Grid
        App.ccFotos.commands[0].disabled = false;
        App.ccFotos.commands[1].disabled = false;
        App.ccCroquis.commands[0].disabled = false;
        App.ccCroquis.commands[1].disabled = false;
        App.ccFacturas.commands[0].disabled = false;
        App.ccFacturas.commands[1].disabled = false;
        App.gpOrdenEstimacion.reconfigure();

    }
    //4. Recargar el tablero

    window.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.reload({
        callback: function () {
            window.parent.App.pCentro.getBody().App.gpOrdenesEstimaciones.getSelectionModel().select(window.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.find("Id", Ext.util.Cookies.get('cookieEditarOrdenEstimacion')));
        }

    });

};



//Para el botón de cancelar, cancela un registro
var imgbtnCancelar_Click_Success = function (response, result) {

    Ext.Msg.show({
        id: 'msgOrdenesEstimaciones',
        title: 'Advertencia',
        msg: 'Se ha cancelado el movimiento',
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.WARNING
    });

    //Se actualiza el tablero
    window.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.reload();

    //Limpiar controles del encabezado
    App.cmbMov.setReadOnly(true);
    App.txtfObservaciones.setReadOnly(true);

    App.txtfNoReporte.setReadOnly(true);
    App.cmbDivision.setReadOnly(true);
    App.dfFechaOrigen.setReadOnly(true);
    App.dfFechaMaxima.setReadOnly(true);
    App.nfDiasAtencion.setReadOnly(true);
    App.txtfReporta.setReadOnly(true);
    App.txtfTrabajoRequerido.setReadOnly(true);
    App.txtfCodigoFalla.setReadOnly(true);
    App.dfFechaLlegada.setReadOnly(true);
    App.tfHoraLlegada.setReadOnly(true);
    App.dfFechaFinActividad.setReadOnly(true);
    App.tfHoraFinActividad.setReadOnly(true);
    App.cmbCuadrilla.setReadOnly(true);
    App.tHoraOrigen.setReadOnly(true);
    App.sbOrdenEstimacion.setText('CANCELADO');
    App.imgbtnCancelar.setDisabled(true);
    App.imgbtnImprimir.setDisabled(true);

    App.imgbtnAfectar.setDisabled(true);

    App.chkBoxOrdenCompra.setDisabled(true);

    window.parent.App.wEmergente.setTitle('Movimiento Cancelado');
};


//var store;
//Evento lanzado al cargar el store de avance encabezado
var sOrdenesMantenimiento_Load = function () {
    App.direct.sOrdenMantenimiento_Load();
    // store = window.parent.App.pCentro.getBody().App.sOrdenesEstimaciones;




};

//Evento lanzado al agregar un registro al store
var sOrdenesMantenimiento_Add = function (avance, registro) {

    //Si es orden de cambio concluida
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && registro[0].get('Estatus') == 'CONCLUIDO'
    && registro[0].get('Mov').trim() == "Orden de Cambio") {


        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbOrdenEstimacion.setText(registro[0].get('Estatus'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));

        App.txtNoOrden.setValue(registro[0].get('NoOrden'));
        //Deshabilita los campos en un movimiento afectado
        //     App.cIntExt.hidden = true;
        App.cmbMov.setReadOnly(true);
        App.chkBoxOrdenCompra.setVisible(false);
        App.txtfSucursalCR.setDisabled(true);
        App.dfFechaEmision.setDisabled(true);
        App.imgbtnAfectar.setDisabled(true);
        App.imgbtnGuardar.setDisabled(true);
        App.imgbtnCancelar.setDisabled(false);
        App.txtfObservaciones.setDisabled(true);
        App.imgbtnImprimir.setDisabled(false);
    }

    //Si es orden de cambio concluida
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && registro[0].get('Estatus') == 'CONCLUIDO'
    && registro[0].get('Mov').trim() == "Orden de Compra") {
        console.log('Orden de compra(643): ' + registro[0].get('NoOrden'));
        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbOrdenEstimacion.setText(registro[0].get('Estatus'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));

        App.txtNoOrden.setValue(registro[0].get('NoOrden'));
        //Deshabilita los campos en un movimiento afectado
        //     App.cIntExt.hidden = true;
        App.cmbMov.setReadOnly(true);

        App.chkBoxOrdenCompra.setVisible(true);
        App.chkBoxOrdenCompra.setValue(true);
        App.chkBoxOrdenCompra.setDisabled(true);

        App.txtfSucursalCR.setDisabled(true);
        App.dfFechaEmision.setDisabled(true);
        App.imgbtnAfectar.setDisabled(true);
        App.imgbtnGuardar.setDisabled(true);
        App.imgbtnCancelar.setDisabled(false);
        App.txtfObservaciones.setDisabled(true);
        App.imgbtnImprimir.setDisabled(false);
    }

    //Si es Reporte
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && registro[0].get('Estatus') == 'CONCLUIDO'
         && registro[0].get('Mov').trim() == "Mesa de reporte") {

        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbOrdenEstimacion.setText(registro[0].get('Estatus'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));

        App.txtfNoReporte.setValue(registro[0].get('Reporte'));
        App.cmbDivision.setValue(registro[0].get('Division'));
        App.dfFechaOrigen.setValue(registro[0].get('FechaOrigen'));
        App.tHoraOrigen.setValue(registro[0].get('HoraOrigen'));
        App.dfFechaMaxima.setValue(registro[0].get('FechaMaximaAtencion'));
        App.nfDiasAtencion.setValue(registro[0].get('DiasAtencion'));
        App.txtfReporta.setValue(registro[0].get('Reporto'));
        App.txtfTrabajoRequerido.setValue(registro[0].get('TrabajoRequerido'));

        App.txtfCodigoFalla.setValue(registro[0].get('CodigoFalla'));
        App.dfFechaLlegada.setValue(registro[0].get('FechaLlegada'));
        App.tfHoraLlegada.setValue(registro[0].get('HoraLlegada'));
        App.dfFechaFinActividad.setValue(registro[0].get('FechaFinActividad'));
        App.tfHoraFinActividad.setValue(registro[0].get('HoraFinActividad'));
        App.cmbCuadrilla.setValue(registro[0].get('Cuadrilla'));

        App.imgbtnImprimir.setDisabled(false);
        App.pDatosReporte.tab.show();
        App.pDatosReporteDos.tab.show();
        //  App.cIntExt.hidden = false;

        App.cmbMov.setReadOnly(true);
        App.txtfSucursalCR.setDisabled(true);
        App.dfFechaEmision.setDisabled(true);

        //Deshabilita controles
        App.txtfObservaciones.setDisabled(true);

        App.txtfNoReporte.setReadOnly(true);
        App.cmbDivision.setReadOnly(true);
        App.dfFechaOrigen.setReadOnly(true);
        App.dfFechaMaxima.setReadOnly(true);
        App.nfDiasAtencion.setReadOnly(true);
        App.txtfReporta.setReadOnly(true);
        App.txtfTrabajoRequerido.setReadOnly(true);

        App.txtfCodigoFalla.setReadOnly(true);
        App.dfFechaLlegada.setReadOnly(true);
        App.tfHoraLlegada.setReadOnly(true);
        App.dfFechaFinActividad.setReadOnly(true);
        App.tfHoraFinActividad.setReadOnly(true);
        App.cmbCuadrilla.setReadOnly(true);
        App.chkAtendido.setReadOnly(true);
        if (registro[0].get('Atendido').trim().length > 0 && registro[0].get('Atendido').trim() == "Si") {
            App.chkAtendido.setValue(true);
        } else {
            App.chkAtendido.setValue(false);
        }
        App.imgbtnAfectar.setDisabled(false);
        App.imgbtnGuardar.setDisabled(true);
        App.imgbtnCancelar.setDisabled(false);
    }



    //Si es Reporte Y NO ESTA AFECTADO
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && registro[0].get('Estatus') == 'BORRADOR'
         && registro[0].get('Mov').trim() == "Mesa de reporte") {
        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbOrdenEstimacion.setText(registro[0].get('Estatus'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));

        App.txtfNoReporte.setValue(registro[0].get('Reporte'));
        App.cmbDivision.setValue(registro[0].get('Division'));
        App.dfFechaOrigen.setValue(registro[0].get('FechaOrigen'));
        App.tHoraOrigen.setValue(registro[0].get('HoraOrigen'));
        App.dfFechaMaxima.setValue(registro[0].get('FechaMaximaAtencion'));
        App.nfDiasAtencion.setValue(registro[0].get('DiasAtencion'));
        App.txtfReporta.setValue(registro[0].get('Reporto'));
        App.txtfTrabajoRequerido.setValue(registro[0].get('TrabajoRequerido'));
        App.txtfCodigoFalla.setValue(registro[0].get('CodigoFalla'));
        App.dfFechaLlegada.setValue(registro[0].get('FechaLlegada'));
        App.tfHoraLlegada.setValue(registro[0].get('HoraLlegada'));
        App.dfFechaFinActividad.setValue(registro[0].get('FechaFinActividad'));
        App.tfHoraFinActividad.setValue(registro[0].get('HoraFinActividad'));
        App.cmbCuadrilla.setValue(registro[0].get('Cuadrilla'));

        if (registro[0].get('Atendido').trim().length > 0 && registro[0].get('Atendido').trim() == "Si") {
            App.chkAtendido.setValue(true);
        } else {
            App.chkAtendido.setValue(false);
        }

        //     App.cIntExt.hidden = false;
        App.pDatosReporte.tab.show();
        App.pDatosReporteDos.tab.show();
        App.cmbMov.setReadOnly(true);
        App.dfFechaEmision.setDisabled(true);
        App.imgbtnGuardar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false);
    }


    //Si es Orden de cambio Y NO ESTA AFECTADO
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && registro[0].get('Estatus') == 'BORRADOR'
         && registro[0].get('Mov').trim() == "Orden de Cambio") {

        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbOrdenEstimacion.setText(registro[0].get('Estatus'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));

        App.txtNoOrden.setValue(registro[0].get('NoOrden'));
        App.chkBoxOrdenCompra.setVisible(false);

        //      App.cIntExt.hidden = true;
        App.cmbMov.setReadOnly(true);
        App.txtfSucursalCR.setDisabled(false);
        App.dfFechaEmision.setDisabled(true);
        App.imgbtnGuardar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false);
    }

    //Si es Orden de cambio Y NO ESTA AFECTADO
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && registro[0].get('Estatus') == 'BORRADOR'
         && registro[0].get('Mov').trim() == "Orden de Compra") {

        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbOrdenEstimacion.setText(registro[0].get('Estatus'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));

        App.txtNoOrden.setValue(registro[0].get('NoOrden'));
        App.chkBoxOrdenCompra.setValue(true);
        App.chkBoxOrdenCompra.setDisabled(false);

        App.chkBoxOrdenCompra.setVisible(true);

        //    App.cIntExt.hidden = true;
        App.cmbMov.setReadOnly(true);
        App.txtfSucursalCR.setDisabled(false);
        App.dfFechaEmision.setDisabled(true);
        App.imgbtnGuardar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false);
    }

    //Si es Estimacion
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && registro[0].get('Estatus') == 'PENDIENTE'
         && registro[0].get('Mov').trim() == "Estimacion") {

        App.txtOrigen.setVisible(true);
        App.txtOrigenID.setVisible(true);

        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));

        App.txtOrigen.setValue(registro[0].get('Origen'));
        App.txtOrigenID.setValue(registro[0].get('OrigenId'));

        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbOrdenEstimacion.setText(registro[0].get('Estatus'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));

        App.txtNoOrden.setValue(registro[0].get('NoOrden'));
        App.txtfNoReporte.setValue(registro[0].get('Reporte'));
        App.cmbDivision.setValue(registro[0].get('Division'));
        App.dfFechaOrigen.setValue(registro[0].get('FechaOrigen'));
        App.dfFechaMaxima.setValue(registro[0].get('FechaMaximaAtencion'));
        App.nfDiasAtencion.setValue(registro[0].get('DiasAtencion'));
        App.txtfReporta.setValue(registro[0].get('Reporto'));
        App.txtfTrabajoRequerido.setValue(registro[0].get('TrabajoRequerido'));

        App.txtfCodigoFalla.setValue(registro[0].get('CodigoFalla'));
        App.dfFechaLlegada.setValue(registro[0].get('FechaLlegada'));
        App.tfHoraLlegada.setValue(registro[0].get('HoraLlegada'));
        App.dfFechaFinActividad.setValue(registro[0].get('FechaFinActividad'));
        App.tfHoraFinActividad.setValue(registro[0].get('HoraFinActividad'));
        App.cmbCuadrilla.setValue(registro[0].get('Cuadrilla'));

        if (registro[0].get('Atendido').trim().length > 0 && registro[0].get('Atendido').trim() == "Si") {
            App.chkAtendido.setValue(true);
        } else {
            App.chkAtendido.setValue(false);
        }

        //Deshabilita controles
        App.txtfObservaciones.setReadOnly(true);

        App.txtfNoReporte.setReadOnly(true);
        App.cmbDivision.setReadOnly(true);
        App.dfFechaOrigen.setReadOnly(true);
        App.tHoraOrigen.setReadOnly(true);
        App.dfFechaMaxima.setReadOnly(true);
        App.nfDiasAtencion.setReadOnly(true);
        App.txtfReporta.setReadOnly(true);
        App.txtfTrabajoRequerido.setReadOnly(true);
        App.txtfCodigoFalla.setReadOnly(true);
        App.dfFechaLlegada.setReadOnly(true);
        App.tfHoraLlegada.setReadOnly(true);
        App.dfFechaFinActividad.setReadOnly(true);
        App.tfHoraFinActividad.setReadOnly(true);
        App.cmbCuadrilla.setReadOnly(true);

        //      App.cIntExt.hidden = false;
        App.pDatosReporte.tab.show();
        App.pDatosReporteDos.tab.show();
        App.cmbMov.setReadOnly(true);
        App.txtfSucursalCR.setDisabled(true);
        App.dfFechaEmision.setDisabled(true);
        App.imgbtnAfectar.setDisabled(true);
        App.imgbtnGuardar.setDisabled(true);
        App.imgbtnCancelar.setDisabled(true);
        App.imgbtnImprimir.setDisabled(false);
    }

    //Valida el estatus para ver si permite seguir capturando o no
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && registro[0].get('Estatus') == 'CANCELADO') {
        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbOrdenEstimacion.setText(registro[0].get('Estatus'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));

        //Deshabilita los campos en un movimiento afectado
        App.cmbMov.setReadOnly(true);
        App.txtfSucursalCR.setDisabled(true);
        App.dfFechaEmision.setDisabled(true);
        App.imgbtnAfectar.setDisabled(true);
        App.imgbtnGuardar.setDisabled(true);
        App.imgbtnCancelar.setDisabled(true);
        App.txtfObservaciones.setDisabled(true);
    }

    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && registro[0].get('Estatus') == 'BORRADOR' || registro[0].get('Estatus') == '') {
        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbOrdenEstimacion.setText(registro[0].get('Estatus'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));


        //Agregar una fila para seguir capturando
        var storeDetalle = App.sConceptos.getAt(App.sConceptos.getCount() - 1);

        //Validaciones antes de cargar el detalle del movimiento
        if (App.cmbMov.getValue().trim() == "Orden de Cambio" || App.cmbMov.getValue().trim() == "Orden de Compra") {


            if (storeDetalle.get('ConceptoID').length != 0 && storeDetalle.get('Cantidad') != 0 && storeDetalle.get('Precio') != 0) {
                //Obtener el Renglon anterior
                var auxRenglonAnterior = App.sConceptos.getCount() - 1;
                var renglonAnterior = App.sConceptos.getAt(auxRenglonAnterior).get('Renglon') + 1;
                //Insertar un nuevo registro
                App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
                //Actualiza el renglon anterior pintando el botón de borrar
                //                App.gpOrdenEstimacion.getView().refreshNode(App.sConceptos.getCount() - 2);
                //Validar si se habilita el boton de afectar
                HabilitarAfectar();
            }


        }

        if (App.cmbMov.getValue().trim() == "Mesa de reporte") {


            if (storeDetalle.get('ConceptoID').length != 0 && storeDetalle.get('Cantidad') != 0 && storeDetalle.get('Precio') != 0 && storeDetalle.get('IntExt').length != 0) {
                //Obtener el Renglon anterior
                var auxRenglonAnterior = App.sConceptos.getCount() - 1;
                var renglonAnterior = App.sConceptos.getAt(auxRenglonAnterior).get('Renglon') + 1;
                //Insertar un nuevo registro
                App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
                //Actualiza el renglon anterior pintando el botón de borrar
                //App.gpOrdenEstimacion.getView().refreshNode(App.sConceptos.getCount() - 2);
                //Validar si se habilita el boton de afectar
                HabilitarAfectar();
            }


        }



        //        var renglonAnterior = App.sConceptos.getAt(App.sConceptos.getCount() - 1).get('Renglon') + 1;
        //        App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
        App.imgbtnBorrar.setDisabled(false);

        App.cmbMov.setReadOnly(true);
        //        HabilitarAfectar();
    }


};



//-----------------------------------------DETALLE----------------------------------------------------------------
var cCantidad_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.00");
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


//Evento que actualuza el importe total cuando se usa el generador
var sConceptos_DataUpdate = function (store, registro, operacion, columnaStore) {

    var Importe = parseFloat(registro.get('Cantidad')) * parseFloat(registro.get('Precio'));
    registro.set('Importe', Importe);



    var sum = 0;
    App.sConceptos.each(function (record) {

        sum += record.get('Importe');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue('' + F.number(sum, "$000,000,000.00"));
    App.dfTotalSinRender.setValue(sum);
    ImporteFinal = sum;


    //Verificar si abajo de esta columna existe otra
    if (App.sConceptos.getAt(indiceDetalle + 1) == undefined) {
        //Verificar si toda la fila contiene datos

        if (App.cmbMov.getValue().trim() == "Orden de Cambio" || App.cmbMov.getValue().trim() == "Orden de Compra") {


            if (registro.get('ConceptoID').length != 0 && registro.get('Cantidad') != 0 && registro.get('Precio') != 0) {
                //Obtener el Renglon anterior
                var renglonAnterior = App.sConceptos.getAt(indiceDetalle).get('Renglon') + 1;
                //Insertar un nuevo registro
                App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
                //Actualiza el renglon anterior pintando el botón de borrar
                App.gpOrdenEstimacion.getView().refreshNode(App.sConceptos.getCount() - 2);
                //Validar si se habilita el boton de afectar
                HabilitarAfectar();
            }
        }

        if (App.cmbMov.getValue().trim() == "Mesa de reporte") {


            if (registro.get('ConceptoID').length != 0 && registro.get('Cantidad') != 0 && registro.get('Precio') != 0 && registro.get('IntExt').length != 0) {
                //Obtener el Renglon anterior
                var renglonAnterior = App.sConceptos.getAt(indiceDetalle).get('Renglon') + 1;
                //Insertar un nuevo registro
                App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
                //Actualiza el renglon anterior pintando el botón de borrar
                App.gpOrdenEstimacion.getView().refreshNode(App.sConceptos.getCount() - 2);
                //Validar si se habilita el boton de afectar
                HabilitarAfectar();
            }
        }
    }
}

//Evento que se lanza despues de editar una columna en PreciarioConceptoOrdenEstimacion
var cePreciarioConcepto_Edit = function (cellediting, columna) {


    if (App.cmbMov.getValue().trim() == "Orden de Cambio" || App.cmbMov.getValue().trim() == "Orden de Compra") {
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
                HabilitarAfectar();
            }
        }

    }
    if (App.cmbMov.getValue().trim() == "Mesa de reporte") {
        //Verificar si abajo de esta columna existe otra
        if (App.sConceptos.getAt(columna.rowIdx + 1) == undefined) {
            //Verificar si toda la fila contiene datos
            var registro = App.sConceptos.getAt(columna.rowIdx);
            if (registro.get('ConceptoID').length != 0 && registro.get('Cantidad') != 0 && registro.get('Precio') != 0 && registro.get('IntExt').length != 0) {
                //Obtener el Renglon anterior
                var renglonAnterior = App.sConceptos.getAt(columna.rowIdx).get('Renglon') + 1;
                //Insertar un nuevo registro
                App.sConceptos.insert(App.sConceptos.getCount(), { Renglon: renglonAnterior });
                //Actualiza el renglon anterior pintando el botón de borrar
                App.gpOrdenEstimacion.getView().refreshNode(App.sConceptos.getCount() - 2);
                //Validar si se habilita el boton de afectar
                HabilitarAfectar();
            }
        }
    }

    //Valida que el movimiento sea diferente de nuevo y que la columna en la que se obtenga el valor original seal la unica que se mande al metodo del lado del servidor
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo') {
        if (columna.field == 'ConceptoID') {
            Ext.util.Cookies.set('cookieIDBorrarFotosOrdenEstimacion', App.sOrdenEstimacion.getAt(0).get('ID'));
            Ext.util.Cookies.set('cookieConceptoFotosOrdenEstimacion', columna.originalValue);
            App.direct.obtenerImagenesPorConcepto();
        }
    }

    var sum = 0;
    App.sConceptos.each(function (record) {

        sum += record.get('Importe');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue('' + F.number(sum, "$000,000,000.00"));
    App.dfTotalSinRender.setValue(sum);
    ImporteFinal = sum;


};


//Trae la descripcion al displayfield
var gpOrdenEstimacion_ItemClick = function (gridview, registro, gvhtml, index) {

    indiceDetalle = index;

    //    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO'
    //        && App.sOrdenEstimacion.getAt(0).get('Mov').trim() == "Orden de Cambio") {

    //        App.imgbtnImprimir.setDisabled(false);
    //    }
    //    Ext.util.Cookies.set('cookieConceptoMovReporte', registro.get('ConceptoID'));
    //    Ext.util.Cookies.set('cookieConceptoClaveMovReporte', registro.get('RPreciarioConceptos').Clave);

    App.txtfClave.setValue(registro.get('RPreciarioConceptos').Clave);
    App.taDescripcion.setValue(registro.get('RPreciarioConceptos').Descripcion);
};


//Obtner el indice del grid panel del detalle y desplegar informacion
var obetenerRenglon_Select = function (a, registro, c) {
    indiceDetalle = registro.internalId;

    //    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO'
    //            && App.sOrdenEstimacion.getAt(0).get('Mov').trim() == "Orden de Cambio") {

    //        App.imgbtnImprimir.setDisabled(false);

    //    }

    //    Ext.util.Cookies.set('cookieConceptoMovReporte', registro.get('ConceptoID'));
    //    Ext.util.Cookies.set('cookieConceptoClaveMovReporte', registro.get('RPreciarioConceptos').Clave);

    App.txtfClave.setValue(registro.get('RPreciarioConceptos').Clave);
    App.taDescripcion.setValue(registro.get('RPreciarioConceptos').Descripcion);
}






//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
    //Eliminar registro
    App.sConceptos.removeAt(fila);


    //Setea el valor final 
    ImporteFinal = ImporteFinal - parseFloat(registro.get('Importe'));


    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue('' + F.number(ImporteFinal, "$000,000,000.00"));
    App.dfTotalSinRender.setValue(ImporteFinal);

    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo') {
        Ext.util.Cookies.set('cookieIDBorrarFotosOrdenEstimacion', App.sOrdenEstimacion.getAt(0).get('ID'));
        Ext.util.Cookies.set('cookieConceptoFotosOrdenEstimacion', registro.get('ConceptoID'));

        App.direct.obtenerImagenesPorConcepto();
    }

    //Asignar renglones
    var renglon = 0;
    App.sConceptos.each(function (dato) {
        dato.set('Renglon', renglon);
        renglon = renglon + 1;
    });

    //Validar si se habilita el boton de afectar
    HabilitarAfectar();
};


var sConceptos_Load = function (avance, registro, index) {
    var sum = 0;
    App.sConceptos.each(function (record) {
        sum += record.get('Importe');
    });
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue('' + F.number(sum, "$000,000,000.00"));
    App.dfTotalSinRender.setValue(sum);
}



//Ocultar el último renglon
var ccAcciones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    if (grid.getStore().getCount() - 1 == rowIndex) {
        toolbar.items.get(0).hide();

    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de borrar
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonEliminar = toolbar.items.get(0);
        botonEliminar.setDisabled(true);
        botonEliminar.setTooltip("No se puede borrar un concepto");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de borrar
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonEliminar = toolbar.items.get(0);
        botonEliminar.setDisabled(true);
        botonEliminar.setTooltip("No se puede borrar un concepto");
    }
};

//Deshablitar comandos detalle
var ccDimensiones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    var boton;

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar conceptos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        boton = toolbar.items.get(0);
        boton.setDisabled(false);
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar fotos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') == 'Nuevo' && App.sOrdenEstimacion.getAt(0) == undefined) {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var boton = toolbar.items.get(0);
        boton.setDisabled(true);
        boton.setTooltip("Debes de guardar el movimiento antes");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar y ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'BORRADOR') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var boton = toolbar.items.get(0);
        boton.setDisabled(false);
    }

};




//Validaciones de comandos para conceptos
var ccConcepto_PrepareToolbar = function (grid, toolbar, rowIndex, record) {

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver conceptos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver conceptos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar conceptos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') == 'Nuevo' && App.sOrdenEstimacion.getAt(0) == undefined) {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        botonCargar2.setDisabled(false);
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar conceptos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        botonCargar2.setDisabled(true);
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de conceptos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'BORRADOR') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        botonCargar2.setDisabled(false);
    }
};




//Validaciones de comandos para fotos
var ccFotos_PrepareToolbar = function (grid, toolbar, rowIndex, record) {

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar fotos a un movimiento concluido");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar fotos a un movimiento cancelado");
    }


    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar conceptos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        botonCargar2.setDisabled(true);
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar fotos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') == 'Nuevo' && App.sOrdenEstimacion.getAt(0) == undefined) {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(true);
        botonVerFotos2.setDisabled(true);
        botonCargar2.setTooltip("Debes de guardar el movimiento antes");
        botonVerFotos2.setTooltip("Debes de guardar el movimiento antes");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar y ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'BORRADOR') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(false);
        botonVerFotos2.setDisabled(false);
        botonCargar2.setTooltip("Cargar Fotos");
        botonVerFotos2.setTooltip("Ver Fotos");
    }
};


//Lo que hace el comando de fotos
var ccFotos_Command = function (column, nombre, registro, renglon, opciones) {



    //Valida que se escocja un concepto antes
    if (registro.get('ConceptoID') != '') {

        Ext.util.Cookies.set('cookieConceptoOrdenEstimacion', registro.get('ConceptoID'));

        if (nombre == 'cnCargarFotos') {
            window.parent.App.wGenerador.load('FormaSubirImagenesOrdenEstimacion.aspx');
            window.parent.App.wGenerador.setHeight(350);
            window.parent.App.wGenerador.setWidth(600);
            window.parent.App.wGenerador.center();
            window.parent.App.wGenerador.setTitle('Subir Fotos');
            window.parent.App.wGenerador.show();
        }
        else {
            window.parent.App.wGenerador.load('FormaImagenesOrdenEstimacion.aspx');
            window.parent.App.wGenerador.setHeight(520);
            window.parent.App.wGenerador.setWidth(670);
            window.parent.App.wGenerador.center();
            window.parent.App.wGenerador.setTitle('Visualizar Fotos');
            window.parent.App.wGenerador.show();
        }

    }
    else {
        Ext.Msg.show({
            id: 'msgFotos',
            title: 'Advertencia',
            msg: 'Debes Seleccionar un concepto antes',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }

};


//Lo que hace el comando de croquis
var ccCroquis_Command = function (column, nombre, registro, renglon, opciones) {



    //Valida que se escocja un concepto antes
    if (registro.get('ConceptoID') != '') {

        Ext.util.Cookies.set('cookieConceptoOrdenEstimacion', registro.get('ConceptoID'));

        if (nombre == 'cnCargarCroquis') {
            window.parent.App.wGenerador.load('FormaSubirCroquisOrdenEstimacion.aspx');
            window.parent.App.wGenerador.setHeight(350);
            window.parent.App.wGenerador.setWidth(600);
            window.parent.App.wGenerador.center();
            window.parent.App.wGenerador.setTitle('Subir Croquis');
            window.parent.App.wGenerador.show();
        }
        else {
            window.parent.App.wGenerador.load('FormaCroquisOrdenEstimacion.aspx');
            window.parent.App.wGenerador.setHeight(520);
            window.parent.App.wGenerador.setWidth(670);
            window.parent.App.wGenerador.center();
            window.parent.App.wGenerador.setTitle('Visualizar Croquis');
            window.parent.App.wGenerador.show();
        }

    }
    else {
        Ext.Msg.show({
            id: 'msgFotos',
            title: 'Advertencia',
            msg: 'Debes Seleccionar un concepto antes',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }


};

//Lo que hace el comando de croquis
var ccFactura_Command = function (column, nombre, registro, renglon, opciones) {


    //Valida que se escocja un concepto antes
    if (registro.get('ConceptoID') != '') {


        Ext.util.Cookies.set('cookieConceptoOrdenEstimacion', registro.get('ConceptoID'));

        if (nombre == 'cnCargarFactura') {
            window.parent.App.wGenerador.load('FormaSubirFacturasOrdenEstimacion.aspx');
            window.parent.App.wGenerador.setHeight(350);
            window.parent.App.wGenerador.setWidth(600);
            window.parent.App.wGenerador.center();
            window.parent.App.wGenerador.setTitle('Subir Factura');
            window.parent.App.wGenerador.show();
        }
        else {
            window.parent.App.wGenerador.load('FormaFacturasOrdenEstimacion.aspx');
            window.parent.App.wGenerador.setHeight(520);
            window.parent.App.wGenerador.setWidth(670);
            window.parent.App.wGenerador.center();
            window.parent.App.wGenerador.setTitle('Visualizar Factura');
            window.parent.App.wGenerador.show();
        }

    }
    else {
        Ext.Msg.show({
            id: 'msgFotos',
            title: 'Advertencia',
            msg: 'Debes Seleccionar un concepto antes',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }


};


//Validaciones de comandos para croquis
var ccCroquis_PrepareToolbar = function (grid, toolbar, rowIndex, record) {

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar croquis a un movimiento concluido");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar croquis a un movimiento cancelado");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar fotos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') == 'Nuevo' && App.sOrdenEstimacion.getAt(0) == undefined) {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(true);
        botonVerFotos2.setDisabled(true);
        botonCargar2.setTooltip("Debes de guardar el movimiento antes");
        botonVerFotos2.setTooltip("Debes de guardar el movimiento antes");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar conceptos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        botonCargar2.setDisabled(true);
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar y ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'BORRADOR') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(false);
        botonVerFotos2.setDisabled(false);
        botonCargar2.setTooltip("Cargar Croquis");
        botonVerFotos2.setTooltip("Ver Croquis");
    }
};


//Validaciones de comandos para facturas
var ccFacturas_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    var botonCargar;
    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar facturas a un movimiento concluido");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar conceptos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        botonCargar2 = toolbar.items.get(0);
        botonCargar2.setDisabled(true);
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar facturas a un movimiento cancelado");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar fotos 
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') == 'Nuevo' && App.sOrdenEstimacion.getAt(0) == undefined) {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(true);
        botonVerFotos2.setDisabled(true);
        botonCargar2.setTooltip("Debes de guardar el movimiento antes");
        botonVerFotos2.setTooltip("Debes de guardar el movimiento antes");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar y ver fotos
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'BORRADOR') {

        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(false);
        botonVerFotos2.setDisabled(false);
        botonCargar2.setTooltip("Cargar Facturas");
        botonVerFotos2.setTooltip("Ver Facturas");
    }
};



//Evento que abre el generador
var ccGenerador_Command = function (columna, comando, registro, fila, opciones) {
    //Asigno el concpeto
    indiceDetalle = fila;

    Ext.util.Cookies.set('cookieRenglonOrdenEstimacionD', fila);
    if (registro.get('ConceptoID') != '') {


        Ext.util.Cookies.set('cookieConceptoOrdenEstimacion', registro.get('ConceptoID'));

        window.parent.App.wGenerador.load('FormaGenerador.aspx');
        window.parent.App.wGenerador.setHeight(310);
        window.parent.App.wGenerador.setWidth(915);
        window.parent.App.wGenerador.center();
        window.parent.App.wGenerador.setTitle('Generador');
        window.parent.App.wGenerador.show();

    }
    else {
        Ext.Msg.show({
            id: 'msgGenerador',
            title: 'Advertencia',
            msg: 'Debes Seleccionar un concepto antes',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }

};




//Acciones del boton d agregar concepto en el detalle
var ccConcepto_Command = function (columna, comando, registro, fila, opciones) {
    window.parent.App.wAyudaConcepto.load('FormaBuscaPreciarioGeneralConcepto.aspx');
    window.parent.App.wAyudaConcepto.setHeight(430);
    window.parent.App.wAyudaConcepto.setWidth(685);
    window.parent.App.wAyudaConcepto.center();
    window.parent.App.wAyudaConcepto.setTitle('Selecciona concepto');
    window.parent.App.wAyudaConcepto.show();
    //Asigno el indicie del renglon
    Ext.util.Cookies.set('cookieRenglonOrdenEstimacionD', fila);
};



//-----------------------------------------------VALIDACIONES-----------------------------------------------
//Función que valida si se habilita el primer renlgon en el GridPanel detalle
function PrimerRenglonDetalle() {
    //Validar si se asigna el primer renglon del concepto


    if (App.cmbMov.getValue() != null && App.txtfSucursalCR.getValue() != '') {

        var store = App.gpOrdenEstimacion.getStore();
        if (store.getCount() == 0) {

            //Insertar el primer registro
            store.insert(0, { Renglon: 0 });

        }
    }
};

//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {

    if (App.cmbMov.getValue() != null && App.txtfSucursalCR.getValue() != '') {
        App.imgbtnGuardar.setDisabled(false);
    }
    else {
        App.imgbtnGuardar.setDisabled(true);
    }
}

//Evento que valida si ya esta concluido para bloquear el detalle y si es borrador no hace nada si ya esta concluido o cancelado
var validaConcluidos = function (a, d, f) {
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {
        return false;
    }
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {
        return false;
    }
    //si es estimacion ya no se pueden editar
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {
        return false;
    }
    else {
        return true
    }
};


//Validar si se habilita el botón d Afectar
function HabilitarAfectar() {

    //Obtiene la fecha de emision del store
    if (App.cmbMov.getValue() != null && App.txtfSucursalCR.getValue() != '') {

        if (App.cmbMov.isValid() && App.txtfSucursalCR.isValid()) {

            if (App.gpOrdenEstimacion.getStore().getCount() != 0) {

                if (App.sConceptos.getAt(0).get('ConceptoID').length != 0 && App.sConceptos.getAt(0).get('Cantidad') != 0 && App.sConceptos.getAt(0).get('Precio') != 0) {

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

//Función que deshabilita todos los controles cuando se afecta un movimiento
function DeshabilitarControlesAfectar() {
    App.cmbMov.setReadOnly(true);
    App.txtfSucursalCR.setDisabled(true);
    App.dfFechaEmision.setDisabled(true);
    App.txtfObservaciones.setDisabled(true);
    App.imgbtnGuardar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
}




// Función que suma o resta días a la fecha indicada

function sumarDiasAtencion(d, fecha) {

    if (fecha != null) {

        var sFecha = fecha.getDate() + '/' + (fecha.getMonth() + 1) + '/' + fecha.getFullYear();
        var sep = sFecha.indexOf('/') != -1 ? '/' : '-';
        var aFecha = sFecha.split(sep);
        var fecha = aFecha[2] + '/' + aFecha[1] + '/' + aFecha[0];
        fecha = new Date(fecha);
        fecha.setDate(fecha.getDate() + parseInt(d));
        var anno = fecha.getFullYear();
        var mes = fecha.getMonth() + 1;
        var dia = fecha.getDate();
        mes = (mes < 10) ? ("0" + mes) : mes;
        dia = (dia < 10) ? ("0" + dia) : dia;
        var fechaFinal = dia + sep + mes + sep + anno;

        App.dfFechaMaxima.setValue(fechaFinal);
    }
}



//Evento que se lanza al poner algun caracter en el control de la Cuadrilla
var cmbCuadrilla_Change = function (combobox, valorNuevo, viejoValor) {
    App.sCuadrillas.clearFilter();
    if (App.cmbCuadrilla.getValue() != null) {
        App.sCuadrillas.filter([{ filterFn: function (item) {
            if (item.get('ID').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1) { return true; }
            else { return false; }
        }
        }]);
    }

};

Ext.util.Cookies.set('cookieTieneImagenReporte', 'NO')

//Imagen Preview Normal
var fufNormal_Change = function (event, control, txtReporte) {




    if (txtReporte.length != 0) {

        var filePath = control.value;
        //Se declara un arreglo con las extenciones que serán permitidas
        var validFilesTypes = ["jpg", "jpeg", "png", "gif"];

        //Se extrae la cadena a apartir del punto
        var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
        //Se declara la bandera falsa
        var isValidFile = false;
        //se recorre el arreglo que contiene las extenciones validas y se compara
        for (var i = 0; i < validFilesTypes.length; i++) {
            //Si la extenvion es igual a la valida la variable es igual a true
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }
        //si no es valida no la deja pasar y manda el mensaje ademas de poner en blanco el control
        if (!isValidFile) {
            filePath.value = null;
            control.reset();

            Ext.Msg.show({
                id: 'msgPreciarios',
                title: 'Advertencia Preciarios',
                msg: "Extensión inválida, sólo archivos con extensión:\n\n" + validFilesTypes.join(", "),
                buttons: Ext.MessageBox.OK,
                onEsc: Ext.emptyFn,
                closable: false,
                icon: Ext.MessageBox.WARNING
            });
        }

        if (isValidFile) {
            App.imgNormal.setImageUrl(URL.createObjectURL(event.target.files[0]));

            if (App.sOrdenEstimacion.getAt(0) != undefined) {
                App.sOrdenEstimacion.getAt(0).set('RutaImagen', URL.createObjectURL(event.target.files[0]));
            }

            Ext.util.Cookies.set('cookieTieneImagenReporte', 'SI')

        }
        else {
            Ext.util.Cookies.set('cookieTieneImagenReporte', 'NO')
            return isValidFile;
        }
    }
    else {
        Ext.Msg.show({
            id: 'msgOrdenEstimacion',
            title: 'Advertencia',
            msg: "Es necesario ingresar un Número de Reporte.",
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }

};


var PopupPic = function () {

    if (App.sOrdenEstimacion.getAt(0) != undefined) {
        var direccion = App.sOrdenEstimacion.getAt(0).get('RutaImagen');
        window.open(direccion, "", "resizable=1,HEIGHT=500,WIDTH=600");
    }
    else {
        Ext.Msg.show({
            id: 'msgOrdenEstimacion',
            title: 'Advertencia',
            msg: "Debes de guardar el movimiento antes",
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }

}
//RENDER COLUMN PICTURES
var cConFotos_Renderer = function (value, metadata, registro) {
    metadata.style = "background-color: #71DB00; color: #fff;";
};
//RENDER COLUMN PICTURES
var cSinFotos_Renderer = function (value, metadata, registro) {
    metadata.style = "background-color: #FF1205; color: #fff;";
};
//Render column
var cCheckFotos_Renderer = function (value, metadata, registro) {
    if (registro.get('Fotos') > 0 && registro.get('ConceptoID').trim().length > 0) {
        metadata.style = "background-color: #669900; color: #fff;";
    } else {
        if (registro.get('ConceptoID').trim().length > 1) {
            metadata.style = "background-color: #CC0000; color: #fff;";
        }
    }
}

//Render column
var cCheckCroquis_Renderer = function (value, metadata, registro) {
    if (registro.get('Croquis') > 0 && registro.get('ConceptoID').trim().length > 0) {
        metadata.style = "background-color: #669900; color: #fff;";
    } else {
        if (registro.get('ConceptoID').trim().length > 1) {
            metadata.style = "background-color: #CC0000; color: #fff;";
        }
    }
}


//Render column
var cCheckFacturas_Renderer = function (value, metadata, registro) {
    if (registro.get('Facturas') > 0 && registro.get('ConceptoID').trim().length > 0) {
        metadata.style = "background-color: #669900; color: #fff;";
    } else {
        if (registro.get('ConceptoID').trim().length > 1) {
            metadata.style = "background-color: #CC0000; color: #fff;";
        }
    }
}



//Validador Compra o no
var chkBoxOrdenCompra_AfterRender = function (componente, value) {
    if (componente.checked) {
        App.cmbMov.setValue('Orden de Compra');
    } else {
        App.cmbMov.setValue('Orden de Cambio');
    }
}
