//Variables gloables
var cuadrillaNuevo = false;
var cuadrillaEditar = false;
var indice = 0;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () { 
    window.parent.App.wEmergente.load('FormaCuadrillas.aspx');
    window.parent.App.wEmergente.setHeight(220);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nueva Cuadrilla');
    window.parent.App.wEmergente.show();
};


//Editar un registro
var imgbtnEditar_Click = function (imagebutton, evento, opciones) {

    //1. Campos y Botones a deshabilitar o habilitar 
    App.imgbtnNuevo.setDisabled(false);
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);

    cuadrillaEditar = true;
};


//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {

    if (result.extraParamsResponse.existe) {

        Ext.Msg.show({
            id: 'msgCodigopostal',
            title: 'Advertencia Cuadrilla',
            msg: 'La cuadrilla, esta siendo utilizada.',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpCuadrillas.getSelectionModel().getSelection()[0].get('Id');
//        var numero = App.gpCuadrillas.getSelectionModel().getSelection()[0].get('Numero');

        App.sCuadrillas.removeAt(App.gpCuadrillas.getSelectionModel().getSelection()[0].index);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Cuadrilla eliminada: ' + numero + '</p>',
            title: 'Registro eliminado'
        });
        App.gpCuadrillas.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);
        //4. Recargar el tablero  

    }
};
