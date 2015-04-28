//Variables gloables
var estadoNuevo = false;
var estadoEditar = false;
var indice = 0;

//Evento que se lanza al abrir un nodo del TreePanel
var tpCodigosPPTA_BeforeLoad = function (store, operation, options) {
    //1. Obtener el nodo que se abre
    var node = operation.node;

    //2. Construir los nodos hijos
    App.direct.GenerarNodo(node.getId(), {
        success: function (result) {
            node.set('loading', false);
            node.set('loaded', true);
            var data = Ext.decode(result);
            if (data.length != 0) {
                node.appendChild(data, undefined, true);
                node.expand();
            }
        },

        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //3. Regresar falso para no lanzar el Load
    return false;
};
 


//Accion que se lanza al hacer clic en un registro
var tpCodigosPPTA_Select = function (gridview, registro, index, gvhtml) {
    //1. Validar que se lance cuando no se hace un nuevo registro
    if (!estadoNuevo && !estadoEditar) {
        //2. Habilitar los botones de editar y borrar
        App.imgbtnEditar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false);
        indice = App.gpCodigoPPTA.getSelectionModel().getSelection()[0].index;
    }
};

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarCodigoPPTA', 'Nuevo');
    window.parent.App.wEmergente.load('FormaCodigoPTTA.aspx');
    window.parent.App.wEmergente.setHeight(520);
    window.parent.App.wEmergente.setWidth(385);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('NUEVO CÓDIGO PPTA');
    window.parent.App.wEmergente.show();
};

//Editar un registro
var imgbtnEditar_Click = function (imagebutton, evento, opciones) {

    //1. Campos y Botones a deshabilitar o habilitar 
    App.imgbtnNuevo.setDisabled(false);
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);

    estadoEditar = true;
};



//Editar un registro
var imgbtnGuardar_Click = function () {

    //1. Validar la información 

    //2. Dejar forma lista para modificar 
    alert(App.cmbEstado.getValue());

};
// msg: '<p align="center">Código PPTA registrado ID: ' + App.sVolumetria.getAt(0).get('ID') + '.</p>',
 

var imgbtnGuardar_change = function () {
    var regex = /^[0-9]{5,5}$/
    if (regex.test(App.txtCP.getValue())) {
        App.imgbtnGuardar.setDisabled(false);
    } else {
        App.imgbtnGuardar.setDisabled(true);
    }
}


//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarCodigoPPTA', App.gpCodigoPPTA.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaCodigoPPTA.aspx');
    window.parent.App.wEmergente.setHeight(220);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('EDITAR CÓGIDO PPTA ' + Ext.util.Cookies.get('cookieEditarCodigoPPTA'));
    window.parent.App.wEmergente.show();
};



//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {

    if (result.extraParamsResponse.existe) {

        Ext.Msg.show({
            id: 'msgCodigoPPTA',
            title: 'Advertencia Código PPTA',
            msg: 'El código PPTA, esta siendo utilizado en algún modulo de Ordenes y Estimaciones.',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpCodigoPPTA.getSelectionModel().getSelection()[0].get('ID');

        App.sCodigoPPTA.removeAt(App.gpCodigoPPTA.getSelectionModel().getSelection()[0].index);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Codigo PPTA eliminado .</p>',
            title: 'Registro eliminado'
        });
        App.gpCodigoPPTA.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);
        //4. Recargar el tablero  

    }
};
   

//Cell Editor
var ceCodigoPPTA_Edit = function (cellEdit, datos, options) {
    var festado = App.sEstados.findRecord('ID', datos.value);
    var rsts = datos.record.get('REstado');
    rsts.ID = festado.get('ID');
    rsts.Descripcion = festado.get('Descripcion');
    datos.record.set('REstado', rsts);

};

//Editar el registro en el que se esta posicionado
var imgbtnsEditar_Click = function () {
    //Get index of record selection
    var index = App.gpCodigoPPTA.getSelectionModel().getSelection()[0].index;

    //Validar si el indice esta como indefinido
    if (index == undefined) {
        index = indice;
    }

    //Get store of GridPanel
    var store = App.gpCodigoPPTA.getStore();

    //Enabled the edit option
    App.gpCodigoPPTA.editingPlugin.startEdit(App.gpCodigoPPTA.getStore().getAt(index), App.gpCodigoPPTA.columns[1]);
};


//Validar la edición o un nuevo registro
var ceCodigoPPTA_ValidateEdit = function (editor, context) {
    var store = App.gpCodigoPPTA.getStore();
    if (context.field == 'Numero') {
        App.direct.ActualizarCodigoPPTA(store.getAt(context.rowIdx).get('ID'), store.getAt(context.rowIdx).get('Numero'), context.value.toUpperCase());
    }
};


//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {

    Ext.Msg.show({
        id: 'msgCP',
        title: 'CÓDIGO PPTA ',
        msg: '<p align="center">CP: ' + result.extraParamsResponse.data + ' registrado.</p>',
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.INFO,
        fn: function (btn) {
            if (btn === 'ok') {
                window.parent.App.wEmergente.hide();
            }
        }

    });
    //4. Recargar el tablero  

};

//Hacer la busqueda de información
var txtBuscarCodigoFalla_Change = function (textfield, newValue, oldValue, e) {
    App.sCodigoPPTA.clearFilter();
    App.sCodigoPPTA.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1
            || item.get('Especialidad').toUpperCase().indexOf(newValue.toUpperCase()) > -1
            || item.get('CodigoMainSaver').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpCodigoPPTA.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

function getData() {
    App.sCodigoPPTA.reload();
    App.gpCodigoPPTA.getSelectionModel().deselectAll();
} 


//Accion que se lanza al hacer clic en un registro
var tpCodigoPPTA_Select = function (gridview, registro, index, gvhtml) {
    //1. Validar que se lance cuando no se hace un nuevo registro
    if (!estadoNuevo && !estadoEditar) {
        //2. Habilitar los botones de editar y borrar
        App.imgbtnEditar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false);
        indice = App.gpCodigoPPTA.getSelectionModel().getSelection()[0].index;
    }
};

//Cambio en los datos del tablero
var sCodigoPPTA_DataChanged = function () {
    if (App.sCodigoPPTA.getCount() > 1 || App.sCodigoPPTA.getCount() == 0) {
        App.sbCodigoPPTA.setText(App.sCodigoPPTA.getCount() + ' CODIGOS PPTA');
    }
    else {
        App.sbCodigoPPTA.setText(App.sCodigoPPTA.getCount() + ' CODIGO PPTA');
    }
};

//Asignar la descripción "dias" a la columna
var cvDias_Renderer = function (valor, columna, registro) {
    if (valor != "" || valor.length != 0) {
        return valor + " días";
    } else {
        return "0 días";
    }
};