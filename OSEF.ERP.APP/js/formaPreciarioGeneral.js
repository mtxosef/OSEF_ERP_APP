﻿

//Evento que se lanza al poner algun texto en la descripcion
var txtfDescripcion_Change = function (txtDescripcion, Evento) {
    //Validar si se habilita Guardar
    HabilitarGuardar();
};

//Revisa la extencion del archivo de excel forzosamente
var CheckExtension = function (FileUploadField1, file) {
    //Se declara un arreglo con las extenciones que serán permitidas
    var validFilesTypes = ["xls", "xlsx"];
    //se pasa el parametro que contiene el archivo
    var filePath = file;
    //Se extrae la cadena a apartir del punto
    var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
    //Se declara la bandera falsa
    var isValidFile = false;
    //se recorre el arreglo que contiene las extenciones validas y se compara
    for (var i = 0; i < validFilesTypes.length; i++) {
        //Si la extenvion es igual a la valida la variable es igual a true
        if (ext == validFilesTypes[i]) {
            isValidFile = true;
            break;
        }
    }
    //si no es valida no la deja pasar y manda el mensaje ademas de poner en blanco el control
    if (!isValidFile) {
        file.value = null;
        FileUploadField1.reset();

        Ext.Msg.show({
            id: 'msgPreciarios',
            title: 'Advertencia Preciarios',
            msg: "Extensión inválida, sólo archivos con extensión:\n\n" + validFilesTypes.join(", "),
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });

    }
    HabilitarGuardar();
    return isValidFile;
};


//Evento que borra el preciario, sí se equivocó de archivo
var BorrarDetallePreciario = function () {
    App.sCarga.removeAll();
};

//Evento que se lanza despues de cargar un archivo de Excel
var btnImportar_Click_Success = function (response, result) {
    //Valida si se habilita el boton de guardar


    HabilitarGuardar();
    if (result.extraParamsResponse.accion == 'error') {
        Ext.Msg.show({
            id: 'msgPreciarioConcepto',
            title: 'Advertencia Preciarios',
            msg: "El formato no coincide con el indicado en las columnas <br><br>" + result.extraParamsResponse.data + "<br><br>Por favor verifica tu archivo.",

            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
}

//Funciones que validan que este seleccionado un tipo preciario al meno
var rObra_Change = function (radio) {



    App.rObra.setValue(radio.value);


    HabilitarGuardar();
};

var rMnto_Change = function (radio) {
  
    App.rMnto.setValue(radio.value);    
    HabilitarGuardar();
};

/*-------------------------Validacion de guardar-----------------*/
//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {
    //Valida que el control de subir archivo contenga algo, si no, se le asigna un caracter, para que entre a la validacion de habilitarGuarda();
    var FileUploadValue = "s";
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') != 'Nuevo' && App.fufArchivoExcel.getValue() == "") {
        FileUploadValue = "1";
    }
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') == 'Nuevo') {

        FileUploadValue = App.fufArchivoExcel.getValue();
    }

    //Valida que todos los controles del encabezado obligatorios estén llenos
    if (FileUploadValue != "" && App.txtfDescripcion.getValue() != "" && App.sCarga.getCount() != 0) {
        if (App.rObra.getValue() == true || App.rMnto.getValue() == true) 
        {
        App.imgbtnGuardar.setDisabled(false);
        }
        
    }
    else {
        App.imgbtnGuardar.setDisabled(true);
    }
}


//Evento lanzado al cargar el store de avance encabezado
var sPreciario_Load_Success = function () {
    var d = new Date();
    App.dfFechaEmision.setValue(d);

    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') != 'Nuevo') {
        App.sCarga.insert(App.sCarga.getCount(), { Clave: 'ADC-001' });
        //    App.gpPreciario.getView().focusRow(App.sCarga.getCount()-1);
        //    App.gpPreciario.editingPlugin.startEdit(App.gpPreciario.store.getAt(App.sCarga.getCount()-1), App.gpPreciario.columns[2]);
    }
};
//Renglones nuevos
var getRowClass = function (record) {
    if (record.phantom) {
        return "new-row";
    }

    if (record.dirty) {
        return "dirty-row";
    }
};

//Formato numerico a Precio
var rendererCosto = function (value) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(value, "$000,000,000.00");
};
//Formato Cantidades
var rendererCantidad = function (valor, metaData, registro) {
  
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';


    return F.number(registro.get('Cantidad'), "000,000,000.00");

};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
//    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sPreciariosGenerales.reload();
    App.sbFormaPreciario.setText('ACTIVO');
};

//Evento lanzado al agregar un registro al store
var sPreciario_Add = function (avance, registro) {
    //Lo que pasa cuando se selecciona un registro y es diferente de nuevo
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') != 'Nuevo') {


        App.txtfID.setValue(registro[0].get('ID'));
        App.txtfDescripcion.setValue(registro[0].get('Descripcion'));
        App.txfArchivoActual.setValue(registro[0].get('Archivo'));
        App.cmbEstatus.setValue(registro[0].get('Estatus'));
        App.dfFechaEmision.setValue(registro[0].get('FechaAlta'));
        App.rObra.setValue(registro[0].get('TipoObra'));
        App.rMnto.setValue(registro[0].get('TipoMantenimiento'));

        //Deshabilita botones cuando se edita un movimiento al cargar el store
        App.cmbEstatus.setDisabled(false);
        App.cmbEstatus.setDisabled(true);
        App.nfHoja.setDisabled(true);
        App.btnCargar.setDisabled(true);
        App.rObra.setDisabled(true);
        App.rMnto.setDisabled(true);
        App.imgbtnBorrarCarga.setDisabled(true);
        App.fufArchivoExcel.setDisabled(true);
        App.sbFormaPreciario.setText(registro[0].get('Estatus'));

     
       

    }
};

//Renderizar objetos con descripciones de categorias
//Asignar la descripción de la categoria a esta columna
//var cCategoria_Renderer = function (valor, columna, registro) {
//    console.log(registro);
//    if (valor.length != 0) {
//        var Categoria = registro.get('RCategoria');
//       
//        return Categoria.Descripcion;
//        
//    }
//};

//Evento que muestra el valor de la columna Concepto por su descripción y no por su ID
var cCategoria_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sCategoria.findRecord('ID', valor);
        return registro.get('Descripcion');
    }
};

//Asignar la descripción de la subcategoria a esta columna
var cSubcategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var Subcategoria = registro.get('RSubcategoria');
        return Subcategoria.Descripcion;
    }
};

//Asignar la descripción de la subsubcategoria a esta columna
var cSubsubcategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var Subsubcategoria = registro.get('RSubsubcategoria');
        return Subsubcategoria.Descripcion;
    }
};


//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
    //Eliminar registro
    App.sCarga.removeAt(fila);

    //    if (Ext.util.Cookies.get('cookieEditarVolumetria') != 'Nuevo') {
    //        Ext.util.Cookies.set('cookieIDBorrarFotosVolumetria', App.sVolumetria.getAt(0).get('ID'));
    //        Ext.util.Cookies.set('cookieConceptoFotosVolumetria', registro.get('ConceptoID'));

    //        App.direct.obtenerImagenesPorConcepto();
    //    }



};



//Evento que valida si ya esta concluido para bloquear el detalle y si es borrador no hace nada si ya esta concluido o cancelado
var validaConcluidos = function (a, d, f) {
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') == 'Nuevo') {
        return false;
    }
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') != 'Nuevo') {
        return true;
    }
    else {
        return true
    }
};

//Evento que se lanza antes de pintar la columna de comandos
var ccAcciones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    if (grid.getStore().getCount() - 1 == rowIndex) {
        toolbar.items.get(0).hide();
    }
}

//Evento que se lanza despues de editar una columna en PreciarioConceptoVolumetria
var cePreciarioConcepto_Edit = function (cellediting, columna) {

    //Verificar si abajo de esta columna existe otra
    if (App.sCarga.getAt(columna.rowIdx + 1) == undefined) {
        //Verificar si toda la fila contiene datos
        var registro = App.sCarga.getAt(columna.rowIdx);
        if (registro.get('Descripcion').length != 0 && registro.get('Cantidad') != 0 && registro.get('Unidad').length != 0 && registro.get('Precio') != 0 && registro.get('Categoria').length != 0 && registro.get('SubCategoria').length != 0 && registro.get('SubSubCategoria').length != 0) {
            
            
            //Insertar un nuevo registro
            App.sCarga.insert(App.sCarga.getCount(), { Clave:'ADC-002' });
            //Actualiza el renglon anterior pintando el botón de borrar
            App.gpPreciario.getView().refreshNode(App.sCarga.getCount() - 2);
            //Validar si se habilita el boton de afectar
           // HabilitarGuardar();
        }
    }
};