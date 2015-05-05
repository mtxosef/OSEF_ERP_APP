
//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {
    if (Ext.util.Cookies.get('cookieNuevaSubEspecialidad') != 'Nuevo') {

        Ext.Msg.show({
            id: 'msgCP',
            title: 'SUBESPECIALIDADES ',
            msg: '<p align="center">SUBESPECIALIDAD : ' + result.extraParamsResponse.data + ' ACTUALIZADA.</p>',
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
            title: 'SUBESPECIALIDADES',
            msg: '<p align="center">SUBESPECIALIDAD: ' + result.extraParamsResponse.data + ' REGISTRADA.</p>',
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
    var vespecialidad = window.parent.App.wEmergente.getBody().App.cmbEspecialidad.getValue();
    if(vespecialidad != null){
        window.parent.App.wEmergente.getBody().App.sSubEspecialidad.reload({ Especialidad: vespecialidad });
    }
};

var imgbtnGuardar_change = function () {
    var regex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{2,99}$/
    var desregex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{2,499}$/
    if (regex.test(App.txtNombre.getValue()) &&
     App.cmbFamilia.getValue() != null) { 
        App.imgbtnGuardar.setDisabled(false);
        App.sbSubEspecialidad.setText('La información esta completa/correcta.');
    } else {
        App.imgbtnGuardar.setDisabled(true);
        App.sbSubEspecialidad.setText('No se permiten caracteres especiales o vacíos.');
    }
}