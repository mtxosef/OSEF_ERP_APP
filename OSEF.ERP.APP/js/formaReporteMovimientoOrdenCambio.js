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