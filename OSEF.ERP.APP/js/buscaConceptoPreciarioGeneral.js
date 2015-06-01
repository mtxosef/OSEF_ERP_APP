﻿//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) { 
    App.txtBuscar.getValue().toUpperCase();
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

//Acciones al seleccionar un registro
var gpConceptos_Select = function (gridview, registro, gvhtml, index) {
    App.txtDescripcion.setValue(registro.get('Descripcion'));
};


//Hacer doble clic sobre algun concepto del GridPanel
var gpConceptos_ItemDblClick = function (gridview, registro, gvhtml, index) {

    //Valida si se cambia otro concepto en un borrador para borrar las imagenes solo si el renglon ya tiene un cocnepto
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).get('ConceptoID') != '') {
        //se guarda el concepto y el Id del movimeinto para mandar llamar al metodo del lado del servidor
        Ext.util.Cookies.set('cookieIDBorrarFotosOrdenEstimacion', window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('ID'));
        Ext.util.Cookies.set('cookieConceptoFotosOrdenEstimacion', window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).get('ConceptoID'));
        //se manda llamar el metodo de lado del servidor
        window.parent.App.wEmergente.getBody().App.direct.obtenerImagenesPorConcepto();

    }


    //valida en el doble click si el concept ya esta en store del detalle de volumetria
    if (window.parent.App.wEmergente.getBody().App.sConceptos.find('ConceptoID', App.sConceptosFiltrados.getAt(index).get('ID')) == -1) {
        //se actualiza el Store contenedor con datos del store del grid de ayuda 
        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("RPreciarioConceptos", registro.data);
        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("ConceptoID", App.sConceptosFiltrados.getAt(index).get('ID'));
        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Unidad", App.sConceptosFiltrados.getAt(index).get('Unidad'));
        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Precio", App.sConceptosFiltrados.getAt(index).get('Costo'));
        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Moneda", App.sConceptosFiltrados.getAt(index).get('Moneda'));
        window.parent.App.wAyudaConcepto.hide();
    }

    //de lo contrario lanza este mensaje
    else {
        Ext.Msg.show({
            id: 'msgConceptoError',
            title: 'Error',
            msg: 'El concepto ya ha sido capturado ',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) {


                //Se verifica si es el mismo o si esta lleno el campo concepto para no borrar el concepto que ya esta
                if (window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).get('ConceptoID') != null) {

                }
                else {
                    if (btn === 'ok') {
                        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("ConceptoID", '');
                        window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Unidad", '');

                    }
                }

            },
            icon: Ext.MessageBox.ERROR
        });
    }

};

//Hacer doble clic sobre algun concepto del GridPanel
var gpConceptos_keyDown = function (gridview, registro, gvhtml, index, keyevent) {

    if (keyevent.getKey() == keyevent.ENTER) {


        //Valida si se cambia otro concepto en un borrador para borrar las imagenes solo si el renglon ya tiene un cocnepto
        if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).get('ConceptoID') != '') {
            //se guarda el concepto y el Id del movimeinto para mandar llamar al metodo del lado del servidor
            Ext.util.Cookies.set('cookieIDBorrarFotosOrdenEstimacion', window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('ID'));
            Ext.util.Cookies.set('cookieConceptoFotosOrdenEstimacion', window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).get('ConceptoID'));
            //se manda llamar el metodo de lado del servidor
            window.parent.App.wEmergente.getBody().App.direct.obtenerImagenesPorConcepto();

        }


        //valida en el doble click si el concept ya esta en store del detalle de volumetria
        if (window.parent.App.wEmergente.getBody().App.sConceptos.find('ConceptoID', App.sConceptosFiltrados.getAt(index).get('ID')) == -1) {
            //se actualiza el Store contenedor con datos del store del grid de ayuda
            window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("RPreciarioConceptos", registro.data);
            window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("ConceptoID", App.sConceptosFiltrados.getAt(index).get('ID'));
            window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Unidad", App.sConceptosFiltrados.getAt(index).get('Unidad'));
            window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Precio", App.sConceptosFiltrados.getAt(index).get('Costo'));
            window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Moneda", App.sConceptosFiltrados.getAt(index).get('Moneda'));
            window.parent.App.wAyudaConcepto.hide();
        }

        //de lo contrario lanza este mensaje
        else {
            Ext.Msg.show({
                id: 'msgConceptoError',
                title: 'Error',
                msg: 'El concepto ya ha sido capturado ',
                buttons: Ext.MessageBox.OK,
                onEsc: Ext.emptyFn,
                closable: false,
                fn: function (btn) {


                    //Se verifica si es el mismo o si esta lleno el campo concepto para no borrar el concepto que ya esta
                    if (window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).get('ConceptoID') != null) {

                    }
                    else {
                        if (btn === 'ok') {
                            window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("ConceptoID", '');
                            window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Unidad", '');

                        }
                    }

                },
                icon: Ext.MessageBox.ERROR
            });
        }

    }//termina if del enter

}