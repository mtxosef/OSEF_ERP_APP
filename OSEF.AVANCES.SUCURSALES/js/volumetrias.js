//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarVolumetria', 'Nuevo');
    window.parent.App.wEmergente.load('../Obra/FormaVolumetriaPreciario.aspx');
    window.parent.App.wEmergente.setHeight(561.5);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nueva Volumetria');
    window.parent.App.wEmergente.show();
};