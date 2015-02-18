//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarVolumetria', 'Nuevo');
    window.parent.App.wEmergente.load('FormaVolumetriaPreciario.aspx');
    window.parent.App.wEmergente.setHeight(591.5);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nueva Volumetría');
    window.parent.App.wEmergente.show();
};


//Boton de nuevo de la forma no del tablero
var imgbtnFormaNuevo_Click = function () {

    var d = new Date();
    //Limpiar controles del encabezado
  
    App.txtfMovID.setValue(null);
    App.txtfIDSucursal.setValue(null);
    App.txtfSucursalNombre.setValue(null);
    App.cmbPreciario.clearValue();
    App.txtfDescripcionPreciario.setValue(null);
    App.dfFechaEmision.setValue(d);
    App.txtfObservaciones.setValue(null);

    //Borrar el GridPanel del Detalle y Encabezado
    App.sConceptos.removeAll();
    App.sVolumetria.removeAll();
    Ext.util.Cookies.set('cookieEditarVolumetria', 'Nuevo');
    window.parent.App.wEmergente.setTitle('Nueva Volumetría');
};



//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarVolumetria', App.gpVolumetrias.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaVolumetriaPreciario.aspx');
    window.parent.App.wEmergente.setHeight(591.5);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Volumetría ' + Ext.util.Cookies.get('cookieEditarVolumetria'));
    window.parent.App.wEmergente.show();


};

//Boton de abrir o cerrar
var imgbtnAbrir_Click = function () {
    window.parent.App.wEmergente.hide();
};


//Concatenar la columna de Movimiento
var cMov_Renderer = function (valor, metaData, registro) {
    var estatus = registro.get('Estatus');

    switch (estatus) {
        case 'BORRADOR':
            return '<img class="IconColumnaEstatus" src="images/cancelar.png" alt="borrador" />' + registro.get('Mov') +" "+ registro.get('MovID');
        case 'PENDIENTE':
            return '<img class="IconColumnaEstatus" src="images/pendiente.png" alt="pendiente" /> ' + registro.get('Mov') + " " + registro.get('MovID');
        case 'CONCLUIDO':
            return '<img class="IconColumnaEstatus" src="images/concluido.png" alt="concluido" /> ' + registro.get('Mov') + " " + registro.get('MovID');
        case 'CANCELADO':
            return '<img class="IconColumnaEstatus" src="images/cancelar.png" alt="cancelar" /> ' + registro.get('Mov') + " " + registro.get('MovID');
    }
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sVolumetrias.clearFilter();
    App.sVolumetrias.filter([{ filterFn: function (item) {
        if (item.get('Mov').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('MovID').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpPreciarios.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};


//Cambio en los datos del tablero
var sVolumetrias_DataChanged = function () {
    if (App.sVolumetrias.getCount() > 1 || App.sVolumetrias.getCount() == 0) {
        App.sbVolumetrias.setText(App.sVolumetrias.getCount() + ' ' + 'VOLUMETRÍAS');
    }
    else {
        App.sbVolumetrias.setText(App.sVolumetrias.getCount() + ' ' + 'VOLUMETRÍAS');
    }


};

//Acciones al hacer clic en un registro
var gpVolumetrias_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};




//Evento que se lanza al seleccionar algun valor de la sucursal
var cmbPreciario_Select = function (combobox, registro) {
    App.txtfDescripcionPreciario.setValue(registro[0].data.Descripcion);

    console.log(App.sPreciario.getAt(0).get('Sucursal'));

    if (App.sPreciario.getAt(0) != undefined) {
        App.txtfSucursalNombre.setValue(App.sPreciario.getAt(0).get('RSucursal').Nombre);
        App.txtfIDSucursal.setValue(App.sPreciario.getAt(0).get('RSucursal').ID);
    }


    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Validar si se habilita el boton de afectar
    HabilitarAfectar();


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

    console.log(App.sPreciario.getAt(0).get('Sucursal'));
    if (App.sPreciario.getAt(0) != undefined) {
        App.txtfSucursalNombre.setValue(App.sPreciario.getAt(0).get('RSucursal').Nombre);
        App.txtfIDSucursal.setValue(App.sPreciario.getAt(0).get('RSucursal').ID);

       
    }

    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Validar si se habilita el boton de afectar
    HabilitarAfectar();

};



//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Add = function (store, registros, index, eOpts) {
    var d = new Date();

    //Validar si es nuevo, se asigna el movimieno 
    if (registros[0].get('ID') == 'Inicio' && Ext.util.Cookies.get('cookieEditarVolumetria') == 'Nuevo') {
        App.cmbMov.select(registros[0].get('ID'));
        App.cmbMov.setReadOnly(true);
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

    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se habilita el boton de afectar
    HabilitarAfectar();
};


 
//Evento lanzado al cargar el store de avance encabezado
var sVolumetria_Load = function () {
    App.direct.sVolumetria_Load();
    store = window.parent.App.pCentro.getBody().App.sVolumetrias;
};

//Evento lanzado al agregar un registro al store
var sVolumetria_Add = function (avance, registro) {
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo') {
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
      
    }
};


//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {
    window.parent.App.pCentro.getBody().App.sVolumetrias.reload();
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
        App.imgbtnBorrar.setDisabled(false);
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



//Regresar el nombre de la sucursal
var cSucursal_Renderer = function (valor, metaData, registro) {
    return registro.get('RSucursal').Nombre;
};

//Regresar el nombre del preciario
var cPreciario_Renderer = function (valor, metaData, registro) {
    return registro.get('RPreciario').Descripcion;
};



//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {
    if (App.cmbMov.getValue() != null  && App.cmbPreciario.getValue() != null) {
        App.imgbtnGuardar.setDisabled(false);
    }
    else {
        App.imgbtnGuardar.setDisabled(true);
    }
}



//Validar si se habilita el botón d Afectar
function HabilitarAfectar() {

    if (App.cmbMov.getValue() != null && App.cmbPreciario.getValue() != null && App.dfFechaEmision.getValue() != null) {

        if (App.cmbMov.isValid() && App.cmbPreciario.isValid() && App.dfFechaEmision.isValid()) {

            if (App.gpVolumetriaDetalle.getStore().getCount() != 0) {
  
                if (App.sConceptos.getAt(0).get('ConceptoID').length != 0 && App.sConceptos.getAt(0).get('Utilizada') != 0) {

                    App.imgbtnAfectar.setDisabled(false);
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


//Función que valida si se habilita el primer renlgon en el GridPanel detalle
function PrimerRenglonDetalle() {
    //Validar si se asigna el primer renglon del concepto
    if (App.cmbMov.getValue() != null && App.cmbPreciario.getValue() != null ) {
        if (App.cmbPreciario.isValid()) {
            var store = App.gpVolumetriaDetalle.getStore();
            if (store.getCount() == 0) {
                //Insertar el primer registro
                store.insert(0, { Renglon: 0 });
            }
        }
    }
}




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




//Evento que muestra el valor de la columna Concepto por su descripción y no por su ID
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


    //Variable que contiene el indicie del elemento seleccionado del comboBox
    var indiceCombo = registro[0].index;
    //Variale que guarda el indicie del renglon del GridPanel segun la posicion en la que se encuentre capturando el usuario
    var indice = App.gpVolumetriaDetalle.getSelectionModel().getSelection()[0].internalId;

    //se actualiza el Store contenedor con datos del store del comboBox
    App.sConceptos.getAt(indice).set("Cantidad", App.sPreciarioConcepto.getAt(indiceCombo).get('Cantidad'));


}



//Método que se lanza antes de llamar al procedimiento de Afectar
var imgbtnAfectar_Click_Before = function () {
    if (App.sVolumetria.getCount() != 0) {
        if (App.sVolumetria.getAt(0).get('Estatus') == 'PENDIENTE') {



            window.parent.App.wEmergente.load('FormaAvanzarVolumetria.aspx');
            window.parent.App.wEmergente.setHeight(170);
            window.parent.App.wEmergente.setWidth(220);
            window.parent.App.wEmergente.center();
            window.parent.App.wEmergente.setTitle('Avanzar Movimiento');
            window.parent.App.wEmergente.show();
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

    //Actualizar campos afetados
    App.txtfMovID.setValue(App.sVolumetria.getAt(0).get('MovID'));
    App.sbFormaVolumetriaDetalle.setText(App.sVolumetria.getAt(0).get('Estatus'));

    //3. Remover la útima fila
    var ultimoRegistro = App.sConceptos.getAt(App.sConceptos.getCount() - 1);
    if (ultimoRegistro.get('ConceptoID').length == 0 && ultimoRegistro.get('Cantidad') == 0 && ultimoRegistro.get('Utilizada') == 0) {
        App.sConceptos.removeAt(App.sConceptos.getCount() - 1);
    }

    //4. Deseleccionar datos del GridPanel y deshabilitar los controles
    App.gpVolumetriaDetalle.getSelectionModel().deselectAll();
    DeshabilitarControlesAfectar();
    Ext.util.Cookies.set('cookieEditarVolumetria', App.sConceptos.getAt(0).get('ID'));
};

//Función que deshabilita todos los controles cuando se afecta un movimiento
function DeshabilitarControlesAfectar() {
    App.cmbMov.setDisabled(true);
    App.cmbPreciario.setDisabled(true);
    App.dfFechaEmision.setDisabled(true);
    App.txtfObservaciones.setDisabled(true);
    App.gpVolumetriaDetalle.setDisabled(true);
    App.imgbtnGuardar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
}