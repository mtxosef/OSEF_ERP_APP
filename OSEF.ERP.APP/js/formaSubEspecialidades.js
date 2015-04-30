﻿
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
                    window.parent.App.wEmergente.hide();
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
                    window.parent.App.wEmergente.hide();
                }
            }
        });
    }

    window.parent.App.pCentro.getBody().App.sSubEspecialidades.reload();

};
