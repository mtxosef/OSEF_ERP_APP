var indice = 0;
var store;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarPreciario', 'Nuevo');
   
    window.parent.App.wEmergente.load('../Obra/FormaPreciario.aspx');
    window.parent.App.wEmergente.setHeight(550);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Preciario');
    window.parent.App.wEmergente.show();

};


//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarPreciario', App.gpPreciarios.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('../Obra/FormaPreciario.aspx');
    window.parent.App.wEmergente.setHeight(550);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Preciario ' + Ext.util.Cookies.get('cookieEditarPreciario'));
    window.parent.App.wEmergente.show();
   

};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sPreciarios.reload();
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpPreciarios.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpPreciarios.getStore().find('ID', identificador);
    var descripcion = App.sPreciarios.getAt(indice).get('Descripcion');
    App.direct.EliminarPreciario(identificador);
    App.gpPreciarios.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 350,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripcion: ' + descripcion + '</p>',
        title: 'Eliminar registro'
    });
    App.gpPreciarios.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
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
        alert("Extensión inválida, sólo archivos con extensión:\n\n" + validFilesTypes.join(", "));
    }
    return isValidFile;
};


//Cambio en los datos del tablero
var sPreciarios_DataChanged = function () {
    if (App.sPreciarios.getCount() > 1 || App.sPreciarios.getCount() == 0) {
        App.sbPreciarios.setText(App.sPreciarios.getCount() + ' ' + 'PRECIARIOS');
    }
    else {
        App.sbPreciarios.setText(App.sPreciarios.getCount() + ' ' + 'PRECIARIOS');
    }

   
};

//Acciones al hacer clic en un registro
var gpPreciarios_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};


//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sPreciarios.clearFilter();
    App.sPreciarios.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpPreciarios.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};


//Evento que se lanza al seleccionar algun valor de la sucursal
var cmbSucursal_Select = function (combobox, registro) {
    App.txtfSucursalNombre.setValue(registro[0].data.Nombre);
   
};

//Evento que se lanza al poner algun caracter en el control de la Sucursal
var cmbSucursal_Change = function (combobox, valorNuevo, viejoValor) {
    App.sSucursales.clearFilter();
    if (App.cmbSucursal.getValue() != null) {
        App.sSucursales.filter([{ filterFn: function (item) {
            if (item.get('ID').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1) { return true; }
            else { return false; }
        }
        }]);
    }
    else {
        App.txtfSucursalNombre.setValue('');
    }
  
};

var sSucursales_Load = function () {
};




//Evento lanzado al cargar el store de avance encabezado
var sPreciario_Load = function () {
    App.direct.sPreciario_Load();
    store = window.parent.App.pCentro.getBody().App.sPreciarios;
};

//Evento lanzado al agregar un registro al store
var sPreciario_Add = function (avance, registro) {
    if (Ext.util.Cookies.get('cookieEditarPreciario') != 'Nuevo') {


        App.txtfID.setValue(registro[0].get('ID'));
        App.txtfDescripcion.setValue(registro[0].get('Descripcion'));
        App.cmbSucursal.setValue(registro[0].get('Sucursal'));
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.txfArchivoActual.setValue(registro[0].get('Archivo'));
        App.cmbEstatus.setValue(registro[0].get('Estatus'));
        App.dfFechaEmision.setValue(registro[0].get('FechaAlta'));


        //Deshabilita botones cuando se edita un movimiento al cargar el store
        App.cmbEstatus.setDisabled(false);
        App.nfHoja.setDisabled(true);
        App.btnCargar.setDisabled(true);
        App.fufArchivoExcel.setDisabled(true);

    }
};


//Renderizar objeos con descripciones de categorias

//Asignar la descripción de la categoria a esta columna
var cCategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var Categoria = registro.get('RCategoria');
        
        return Categoria.Descripcion;
    }
};

//Asignar la descripción de la subcategoria a esta columna
var cSubcategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        console.log(registro.get('RSubcategoria'));
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