
//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {
    if (Ext.util.Cookies.get('cookieNuevaEspecialidad') != 'Nuevo') {

        Ext.Msg.show({
            id: 'msgCP',
            title: 'ESPECIALIDADES ',
            msg: '<p align="center">ESPECIALIDAD : ' + result.extraParamsResponse.data + ' ACTUALIZADA.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO,
            fn: function (btn) {
                if (btn === 'ok') {
                    window.parent.App.wNew.hide();
                }
            }

        });
    }
    else {
        Ext.Msg.show({
            id: 'msgCP',
            title: 'ESPECIALIDADES',
            msg: '<p align="center">ESPECIALIDAD: ' + result.extraParamsResponse.data + ' REGISTRADA.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO,
            fn: function (btn) {
                if (btn === 'ok') {
                    window.parent.App.wNew.hide();
                }
            }
        });
    } 
   
    window.parent.App.wEmergente.getBody().App.sEspecialidad.reload();

};

var imgbtnGuardar_change = function () {
    var regex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{1,99}$/
    var desregex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{1,499}$/
    if (regex.test(App.txtNombre.getValue())) {
        App.imgbtnGuardar.setDisabled(false);
        App.sbEspecialidad.setText('La información esta completa/correcta.');
    } else {
        App.imgbtnGuardar.setDisabled(true);
        App.sbEspecialidad.setText('No se permiten caracteres especiales o vacíos.');
    }
}