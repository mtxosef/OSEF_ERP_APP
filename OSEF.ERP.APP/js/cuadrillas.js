//Variables gloables
var cuadrillaNuevo = false;
var cuadrillaEditar = false;
var indice = 0;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarCuadrilla', 'Nuevo');
    window.parent.App.wEmergente.load('FormaCuadrillas.aspx');
    window.parent.App.wEmergente.setHeight(280);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('NUEVA CUADRILLA');
    window.parent.App.wEmergente.show();
};
 
//Editar un registro
var imgbtnEditar_Click = function (imagebutton, evento, opciones) {
    //1. Campos y Botones a deshabilitar o habilitar 
    App.imgbtnNuevo.setDisabled(false);
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
    Ext.util.Cookies.set('cookieEditarCuadrilla', App.gpCuadrillas.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaCuadrillas.aspx');
    window.parent.App.wEmergente.setHeight(280);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('EDITAR CUADRILLA ' + Ext.util.Cookies.get('cookieEditarCuadrilla'));
//    alert(Ext.util.Cookies.get('cookieEditarCuadrilla'));
    window.parent.App.wEmergente.show();
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
        var identificador = App.gpCuadrillas.getSelectionModel().getSelection()[0].get('ID');
        var cuadrilla = App.gpCuadrillas.getSelectionModel().getSelection()[0].get('Nombre'); 
        App.sCuadrillas.removeAt(App.gpCuadrillas.getSelectionModel().getSelection()[0].index);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Cuadrilla eliminada: ' + cuadrilla + '</p>',
            title: 'REGISTRO ELIMINADO'
        });
        App.gpCuadrillas.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true); 
    }
};
 
function getData() {
    App.sCuadrillas.reload();
    App.gpCuadrillas.getSelectionModel().deselectAll();
} 

//Accion que se lanza al hacer clic en un registro
var gpCuadrillas_Select = function (gridview, registro, index, gvhtml) {
    //1. Validar que se lance cuando no se hace un nuevo registro 
        //2. Habilitar los botones de editar y borrar
        App.imgbtnEditar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false);
        indice = App.gpCuadrillas.getSelectionModel().getSelection()[0].index; 
}; 
