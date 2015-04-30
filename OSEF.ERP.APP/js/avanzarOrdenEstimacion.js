var btnAceptar_Click_Success = function (response, result) {
    //1. Obtener datos de la nueva revisión
    App.direct.ObtenerOrdenEstimacion(result.extraParamsResponse.ordenestimacion, {
        //2. Asignar los datos a los controles
        success: function (result) {
            //Actualizar store de OrdenEstimacion
            window.parent.App.sOrdenEstimacion.getAt(0).set("ID", result.Id);
            window.parent.App.sOrdenEstimacion.getAt(0).set("Mov", result.Mov);
            window.parent.App.sOrdenEstimacion.getAt(0).set("MovID", result.MovID);
            window.parent.App.sOrdenEstimacion.getAt(0).set("Origen", result.Origen);
            window.parent.App.sOrdenEstimacion.getAt(0).set("OrigenId", result.OrigenId);
            window.parent.App.sOrdenEstimacion.getAt(0).set("FechaEmision", result.FechaEmision);
            window.parent.App.sOrdenEstimacion.getAt(0).set("Estatus", result.Estatus);

            window.parent.App.cmbMov.setValue(window.parent.App.sOrdenEstimacion.getAt(0).get('Mov'));
            window.parent.App.cmbMov.setReadOnly(false);
            window.parent.App.txtfMovID.setValue('');
            window.parent.App.dfFechaEmision.setValue(window.parent.App.sOrdenEstimacion.getAt(0).get('FechaEmision'));
            window.parent.App.sbOrdenEstimacion.setText(window.parent.App.sOrdenEstimacion.getAt(0).get('Estatus'));

            //Obtener el Renglon anterior
            var renglonAnterior = window.parent.App.sConceptos.getAt(window.parent.App.sConceptos.getCount() - 1).get('Renglon') + 1;
            //Insertar un nuevo registro
            window.parent.App.sConceptos.insert(window.parent.App.sConceptos.getCount(), { Renglon: renglonAnterior });

            HabilitarControlesAvanzar();
            window.parent.App.wEmergente.hide();
        },
        failure: function (errorMessage) { },
        eventMask: { showMask: true }
    });
};

//Habilitar los controles de la FormaAvance
function HabilitarControlesAvanzar() {
    window.parent.App.gpOrdenEstimacion.setDisabled(false);
    window.parent.App.dfFechaEmision.setDisabled(false);
    window.parent.App.txtfObservaciones.setDisabled(false);
    window.parent.App.imgbtnGuardar.setDisabled(false);
    window.parent.App.imgbtnBorrar.setDisabled(false);

    //6. Deshabilita los comandos del grid
    window.parent.App.ccFotos.commands[0].disabled = false;
    window.parent.App.ccFotos.commands[1].disabled = false;
    window.parent.App.ccCroquis.commands[0].disabled = false;
    window.parent.App.ccCroquis.commands[1].disabled = false;
    window.parent.App.ccFacturas.commands[0].disabled = false;
    window.parent.App.ccFacturas.commands[1].disabled = false;
    window.parent.App.ccConcepto.commands[0].disabled = false;
    window.parent.App.gpOrdenEstimacion.reconfigure();
}