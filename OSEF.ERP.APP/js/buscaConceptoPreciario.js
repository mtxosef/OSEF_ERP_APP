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
   
    App.txtConcepto.setValue(registro.get('ID'));
    App.txtDescripcion.setValue(registro.get('Descripcion'));
    indice = index;
};