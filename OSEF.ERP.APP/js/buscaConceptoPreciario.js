//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sConceptosFiltrados.clearFilter();
    App.sConceptosFiltrados.filter([{ filterFn: function (item) {
        if (item.get('Clave').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpConceptos.getSelectionModel().deselectAll();
};

//Acciones al hacer clic en un registro
var gpConceptos_ItemClick = function (gridview, registro, gvhtml, index) {
    App.txtDescripcion.setValue(registro.get('Descripcion'));
};

//Hacer doble clic sobre algun concepto del GridPanel
var gpConceptos_ItemDblClick = function (gridview, registro, gvhtml, index) {

    //Valida si se cambia otro concepto en un borrador para borrar las imagenes solo si el renglon ya tiene un cocnepto
    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonVolumetriaD')).get('ConceptoID') != '') {

        Ext.util.Cookies.set('cookieIDBorrarFotosVolumetria', window.parent.App.wEmergente.getBody().App.sVolumetria.getAt(0).get('ID'));
        Ext.util.Cookies.set('cookieConceptoFotosVolumetria', window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonVolumetriaD')).get('ConceptoID'));

         window.parent.App.wEmergente.getBody().App.direct.obtenerImagenesPorConcepto();

    }


    if (window.parent.App.wEmergente.getBody().App.sConceptos.find('ConceptoID', App.sConceptosFiltrados.getAt(index).get('ID')) == -1) {


        //se actualiza el Store contenedor con datos del store del grid de ayuda
        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonVolumetriaD')).set("ConceptoID", App.sConceptosFiltrados.getAt(index).get('ID'));
        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonVolumetriaD')).set("Cantidad", App.sConceptosFiltrados.getAt(index).get('Cantidad'));
        window.parent.App.wAyudaConcepto.hide();
    }


    else {
        Ext.Msg.show({
            id: 'msgConceptoError',
            title: 'Error',
            msg: 'El concepto ya ha sido capturado ',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) {


                //Se verifica si es el mismo para no borrar el movimiento
                if (window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonVolumetriaD')).get('ConceptoID') =! null) {

                }
                else {
                    if (btn === 'ok') {
                        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonVolumetriaD')).set("ConceptoID", '');
                        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonVolumetriaD')).set("Cantidad", '');

                    }
                }

            },
            icon: Ext.MessageBox.ERROR
        });
    }



};