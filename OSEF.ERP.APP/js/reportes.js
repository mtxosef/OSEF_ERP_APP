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
    alert("En construccion")
    }

    if (reporte == 'P2') {
        alert("En construccion")
    }
};