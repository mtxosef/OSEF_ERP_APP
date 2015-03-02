var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {

    var reporte = registro.data.id;


    if (reporte == 'P1') {
        window.parent.App.wEmergente.load('FormaParametrosP1.aspx');
        window.parent.App.wEmergente.setHeight(370);
        window.parent.App.wEmergente.setWidth(740);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Especificar Parámetros');
        window.parent.App.wEmergente.show();
    }

    if (reporte == 'P2') {
        window.parent.App.wEmergente.load('FormaParametrosP2.aspx');
        window.parent.App.wEmergente.setHeight(370);
        window.parent.App.wEmergente.setWidth(740);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Especificar Parámetros');
        window.parent.App.wEmergente.show();
    }

    if (reporte == 'P3') {
        window.parent.App.wEmergente.load('FormaParametrosP3.aspx');
        window.parent.App.wEmergente.setHeight(370);
        window.parent.App.wEmergente.setWidth(740);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Especificar Parámetros');
        window.parent.App.wEmergente.show();
    }
    if (reporte == 'P4') {
        window.parent.App.wEmergente.load('FormaParametrosP4.aspx');
        window.parent.App.wEmergente.setHeight(370);
        window.parent.App.wEmergente.setWidth(740);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Especificar Parámetros');
        window.parent.App.wEmergente.show();
    }

    if (reporte == 'P5') {
        window.parent.App.wEmergente.load('FormaParametrosP5.aspx');
        window.parent.App.wEmergente.setHeight(370);
        window.parent.App.wEmergente.setWidth(740);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Especificar Parámetros');
        window.parent.App.wEmergente.show();
    }
};