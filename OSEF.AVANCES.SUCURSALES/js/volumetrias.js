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
    App.cmbSucursal.clearValue();
    App.cmbPreciario.clearValue();
    App.txtfSucursalNombre.setValue(null);
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
var cmbSucursal_Select = function (combobox, registro) {
    App.txtfSucursalNombre.setValue(registro[0].data.Nombre);
    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se habilita Información
    HabilitarInformacion();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle(); 
};

//Evento que se lanza al poner algun caracter en el control de la Sucursal
var cmbSucursal_Change = function (combobox, valorNuevo, viejoValor) {
    App.sSucursales.clearFilter();
    if (App.cmbSucursal.getValue() != null) {
        App.sSucursales.filter([{ filterFn: function (item) {
            if (item.get('ID').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1) { return true; }
            else { return false; }
        }
        }]);
    }
    else {
        App.txtfSucursalNombre.setValue('');
    }
    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se habilita Información
    HabilitarInformacion();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle(); 

};


//Evento que se lanza al seleccionar algun valor de la sucursal
var cmbPreciario_Select = function (combobox, registro) {
    App.txtfDescripcionPreciario.setValue(registro[0].data.Descripcion);
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
    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();

};



//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Add = function (store, registros, index, eOpts) {
    var d = new Date();

    //Validar si es nuevo, se asigna el movimieno 
    if (registros[0].get('ID') == 'Inicio' && Ext.util.Cookies.get('cookieEditarVolumetria') == 'Nuevo') {
        App.cmbMov.select(registros[0].get('ID'));
        App.cmbMov.setReadOnly(true);
        App.dfFechaEmision.setValue(d);
        App.cmbSucursal.focus();
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
    //Validar si se habilita Afectar
//    HabilitarAfectar();
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
        App.cmbSucursal.setValue(registro[0].get('Sucursal'));
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.cmbPreciario.setValue(registro[0].get('Preciario'));
        App.txtfDescripcionPreciario.setValue(registro[0].get('RPreciario').Descripcion);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.sbFormaVolumetriaDetalle.setText(registro[0].get('Estatus'));


      
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
    if (App.cmbMov.getValue() != null && App.cmbSucursal.getValue() != null && App.cmbPreciario.getValue() != null) {
        App.imgbtnGuardar.setDisabled(false);
    }
    else {
        App.imgbtnGuardar.setDisabled(true);
    }
}

//Validar si se habilita el botón de Información
function HabilitarInformacion() {
    if (App.cmbSucursal.getValue() != null) {
        App.imgbtnInfo.setDisabled(false);
    }
    else {
        App.imgbtnInfo.setDisabled(true);
    }
}

//Función que valida si se habilita el primer renlgon en el GridPanel detalle
function PrimerRenglonDetalle() {
    //Validar si se asigna el primer renglon del concepto
    if (App.cmbMov.getValue() != null && App.cmbPreciario.getValue() != null && App.cmbSucursal.getValue() != null) {
        if (App.cmbSucursal.isValid() && App.cmbPreciario.isValid()) {
            var store = App.gpVolumetriaDetalle.getStore();
            if (store.getCount() == 0) {
                //Insertar el primer registro
                store.insert(0, { Renglon: 0 });
            }
        }
    }
}