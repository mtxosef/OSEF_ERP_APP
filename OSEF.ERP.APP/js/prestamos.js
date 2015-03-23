//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarPrestamo', 'Nuevo');
    window.parent.App.wEmergente.load('FormaSolicitudPrestamo.aspx');
    window.parent.App.wEmergente.setHeight(576);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo prestamo');
    window.parent.App.wEmergente.show();
};