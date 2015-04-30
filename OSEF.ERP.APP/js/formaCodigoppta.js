var imgbtnGuardar_change = function () {
    var regex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{1,99}$/
    var desregex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{1,499}$/
    if (regex.test(App.txtCodigoMainSaver.getValue()) && desregex.test(App.txtDescripcion.getValue())
    && Ext.getCmp('txtDias').getValue() > 0 && Ext.getCmp('txtPrioridad').getValue() > 0 && Ext.getCmp('txtTiempoEstimado').getValue() > 0) {
        App.txtCodigoMainSaver.setValue(App.txtCodigoMainSaver.getValue());
        App.imgbtnGuardar.setDisabled(false);
        App.sbPPTA.setText('La información esta completa/correcta.');
    } else {
        App.imgbtnGuardar.setDisabled(true);
        App.sbPPTA.setText('No se permiten caracteres especiales o vacíos.');
    }
}

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {
    if (Ext.util.Cookies.get('cookieEditarCodigoPPTA') != 'Nuevo') {

        Ext.Msg.show({
            id: 'msgCP',
            title: 'CÓDIGO PPTA ',
            msg: '<p align="center">CÓDIGO PPTA: ' + result.extraParamsResponse.data + ' ACTUALIZADO.</p>',
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
    }
    else {
        Ext.Msg.show({
            id: 'msgCP',
            title: 'CÓDIGO PPTA ',
            msg: '<p align="center">CÓDIGO PPTA: ' + result.extraParamsResponse.data + ' REGISTRADO.</p>',
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
    }

    window.parent.App.pCentro.getBody().App.sCodigoPPTA.reload();

};


//Evento de clic del botón Nuevo
var imgbtnNuevaEspecialidad_Click = function () {
    var w = window.parent.App.wNew;
    Ext.util.Cookies.set('cookieNuevaEspecialidad', 'Nuevo');
    w.load('FormaEspecialidad.aspx');
    w.setHeight(230);
    w.setWidth(380);
    w.center();
    w.setTitle('NUEVA ESPECIALIDAD');
    w.show();
};

//Evento de clic del botón Nuevo
var imgbtnNuevaFamilia_Click = function () {
    var w = window.parent.App.wNew;
    Ext.util.Cookies.set('cookieNuevaFamilia', 'Nuevo');
    w.load('FormaFamilias.aspx');
    w.setHeight(230);
    w.setWidth(380);
    w.center();
    w.setTitle('NUEVA FAMILIA');
    w.show();
};

//Evento de clic del botón Nuevo
var imgbtnNuevaSubEspecialidad_Click = function () {
    var w = window.parent.App.wNew;
    Ext.util.Cookies.set('cookieNuevaSubEspecialidad', 'Nuevo');
    w.load('FormaSubEspecialidad.aspx');
    w.setHeight(230);
    w.setWidth(380);
    w.center();
    w.setTitle('NUEVA SUBESPECIALIDAD');
    w.show();
}; 