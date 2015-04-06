//Cambio en los datos del tablero
var sExploradorPConcepto_DataChanged = function () {
    if (App.sPreciarioConcepto.getCount() > 1 || App.sPreciarioConcepto.getCount() == 0) {
        App.sbExploradorPreciarioConcepto.setText(App.sPreciarioConcepto.getCount() + ' ' + 'CONCEPTOS');
    }
    else {
        App.sbExploradorPreciarioConcepto.setText(App.sPreciarioConcepto.getCount() + ' ' + 'CONCEPTO');
    }
};


//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sPreciarioConcepto.clearFilter();
    App.sPreciarioConcepto.filter([{ filterFn: function (item) {
        if (item.get('RPreciarioConceptos').Clave.toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('RPreciarioConceptos').Descripcion.toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
App.gpExploradorConceptosPreciarioGeneral.getSelectionModel().deselectAll();

};


var gpExploradorConceptos_ItemClick = function (gridview, registro, gvhtml, index) {
    window.parent.App.wEmergente.load('FormaPreciarioGeneralExplorador.aspx');
    window.parent.App.wEmergente.setHeight(460);
    window.parent.App.wEmergente.setWidth(600);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Datos del concepto');
    window.parent.App.wEmergente.show();


    Ext.util.Cookies.set('CookieMovimiento', registro.get('RMovimiento').Mov.trim() + ' ' + registro.get('RMovimiento').MovID);
    Ext.util.Cookies.set('cookieConceptoID', registro.get('ConceptoID'));
    Ext.util.Cookies.set('cookieClave', registro.get('RPreciarioConceptos').Clave);
    Ext.util.Cookies.set('cookieDescripcion', registro.get('RPreciarioConceptos').Descripcion);
    Ext.util.Cookies.set('cookieCantidad', registro.get('Cantidad'));

    Ext.util.Cookies.set('cookieUnidadd', registro.get('Unidad'));
    Ext.util.Cookies.set('cookiePrecio', registro.get('Precio'));
    Ext.util.Cookies.set('cookieImporte', registro.get('Importe'));

   

};


var sParametrosExporador_Load = function () {

   

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';

    App.txtPreciario.setValue(Ext.util.Cookies.get('CookieMovimiento'));
    App.txtClave.setValue(Ext.util.Cookies.get('cookieClave'));
    App.txtConceptoID.setValue(Ext.util.Cookies.get('cookieConceptoID'));
    App.txtADescripcion.setValue(Ext.util.Cookies.get('cookieDescripcion'));
    App.txtPrecioInicial.setValue(F.number(Ext.util.Cookies.get('cookiePrecio'), "$000,000,000.00"));
    App.txtCantidad.setValue(F.number(Ext.util.Cookies.get('cookieCantidad'), "000,000,000.00") + ' ' + Ext.util.Cookies.get('cookieUnidadd'));
    App.txtImporte.setValue(F.number(Ext.util.Cookies.get('cookieImporte'), "$000,000,000.00"));


};





//Darle formato a la columna de Programado
var txtCosto_renderer = function (valor) {


    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};




//Asignar la descripción de la categoria a esta columna
var cClave_Renderer = function (valor, columna, registro) {
  
    if (valor.length != 0) {
        return registro.get('RPreciarioConceptos').Clave;
    }
};

//Asignar la descripción de la categoria a esta columna
var cConcepto_Renderer = function (valor, columna, registro) {

    if (valor.length != 0) {
        return registro.get('RPreciarioConceptos').Descripcion;
    }
};

//Asignar la descripción de la categoria a esta columna
var cCantidad_Renderer = function (valor, columna, registro) {

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.00");
};

//Asignar la descripción de la categoria a esta columna
var cMov_renderer = function (valor, columna, registro) {

    if (valor.length != 0) {
        return registro.get('RMovimiento').Mov +' '+ registro.get('RMovimiento').MovID;
    }
};


var cImporte_renderer = function (valor) {


    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};


var cFecha_renderer = function (valor, columna, registro) {


    if (valor.length != 0) {

        return Ext.util.Format.date(registro.get('RMovimiento').FechaEmision, 'd/m/Y');



    }
};



//Filtros

//Evento que hace el filtro al seleccionar algun elemento
var cmbMovimientoFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro 
    if (valor == 'Todos') {
        App.sPreciarioConcepto.clearFilter();
    }

        else {
            App.sPreciarioConcepto.filterBy(function (elemento) {

           
                if (elemento.get('RMovimiento').Mov.trim() == valor) {
                    return true
                }
                else {
                    return false;
                }
            });
        }
    };



    //Evento que hace el filtro al seleccionar algun elemento
    var cmbUsuarioFiltro_Select = function (combobox, registro) {
        //1. Obtener el valor
        var valor = combobox.getValue();

        //2. Validar si es todos o hacer el filtro, sino si hace el filtro 
        if (valor == 'Todos') {
            App.sPreciarioConcepto.clearFilter();
        }
        else {
            App.sPreciarioConcepto.filterBy(function (elemento) {

                if (elemento.get('RMovimiento').Usuario.trim() == valor) {
                    return true
                }
                else {
                    return false;
                }
            });
        }
    };


    //Evento que hace el filtro al seleccionar algun elemento
    var cmbSucursalFiltro_Select = function (combobox, registro) {
        //1. Obtener el valor
        var valor = combobox.getValue();

        //2. Validar si es todos o hacer el filtro, sino si hace el filtro 
        if (valor == 'Todos') {
            App.sPreciarioConcepto.clearFilter();
        }
        else {
            App.sPreciarioConcepto.filterBy(function (elemento) {

                if (elemento.get('RMovimiento').Sucursal.trim() == valor) {
                    return true
                }
                else {
                    return false;
                }
            });
        }
    };
    