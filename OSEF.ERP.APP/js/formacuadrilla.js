
var imgbtnGuardar_Click_Success = function (response, result) {
    window.parent.App.wEmergente.hide();
}


var imgbtnGuardar_change = function () {
    var regex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{10,99}$/
    var desregex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{10,499}$/
    if (regex.test(App.txtNombre.getValue()) && desregex.test(App.txtDescripcion.getValue())) { 
        App.txtNombre.setValue(App.txtNombre.getValue().toUpperCase());
        App.txtDescripcion.setValue(App.txtDescripcion.getValue().toUpperCase());
        App.imgbtnGuardar.setDisabled(false);
    } else {
        App.imgbtnGuardar.setDisabled(true);
    }
}

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {
    Ext.Msg.show({
        id: 'msgCP',
        title: 'CUADRILLA ',
        msg: '<p align="center">CP: ' + result.extraParamsResponse.data + ' registrada.</p>',
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
    window.parent.App.pCentro.getBody().App.sCuadrillas.reload();
   
};

