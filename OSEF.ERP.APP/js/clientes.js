//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarCliente', 'Nuevo');
    window.parent.App.wEmergente.load('FormaCliente.aspx');
    window.parent.App.wEmergente.setHeight(455);
    window.parent.App.wEmergente.setWidth(830);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo cliente');
    window.parent.App.wEmergente.show();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarCliente', App.gpClientes.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaCliente.aspx');
    window.parent.App.wEmergente.setHeight(455);
    window.parent.App.wEmergente.setWidth(830);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar cliente ' + Ext.util.Cookies.get('cookieEditarCliente'));
    window.parent.App.wEmergente.show();
};

//Acciones al hacer clic en un registro
var gpClientes_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Cambio en los datos del tablero
var sClientes_DataChanged = function () {
    if (App.sClientes.getCount() > 1 || App.sClientes.getCount() == 0) {
        App.sbClientes.setText(App.sClientes.getCount() + ' ' + 'SOCIOS');
    }
    else {
        App.sbClientes.setText(App.sClientes.getCount() + ' ' + 'SOCIO');
    }

    //Resize column Description when records are 11
    if (App.sClientes.getCount() > 10) {
        App.gpClientes.columns[1].setWidth(263);
    }
    else {
        App.gpClientes.columns[1].setWidth(280);
    }
};

//Concatenar la columna de Nombre Completo
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};

//Antes de crear el ComboBox
var ComboBox_BeforeRender = function (combobox, opciones) {
    if (Ext.util.Cookies.get('osefTheme') == 'caja') {
        combobox.cls = 'cajaCombobox cajaComboboxFocus';
    }
    else {
        combobox.cls = 'bancomerCombobox bancomerComboboxFocus';
    }
};

//Despues de crear el Combobox de Estatus
var cmbEstatus_AfterRender = function (combobox, opciones) {
    if (Ext.util.Cookies.get('cookieEditarCliente') === 'Nuevo') {
        App.cmbEstatus.select('ALTA');
    }
};

//Antes de crear el la lista del ComboBox
var ListConfig_BeforeRender = function (boundlist, opciones) {
    if (Ext.util.Cookies.get('osefTheme') == 'caja') {
        boundlist.cls = 'cajaComboboxLista';
   
    }
    else {
        boundlist.cls = 'bancomerComboboxLista';
    }
};

//Método para calcular la edad en base a la fecha de nacimiento
var CalcularFechaNacimiento = function (datefield, fecha) {
    fecha = App.dfFechaNacimiento.getValue();

    //1. Calculo la fecha de hoy
    hoy = new Date();

    //2. Calculo la fecha que recibo y la descompongo en un array 
    var array_fecha = (fecha.getDate() + "/" + (fecha.getMonth() + 1) + "/" + fecha.getFullYear()).split("/");

    //3. Si el array no tiene tres partes, la fecha es incorrecta 
    if (array_fecha.length != 3)
        return false;

    //4. Compruebo que ano, mes, dia son correctos 
    var ano;
    ano = parseInt(array_fecha[2]);
    if (isNaN(ano))
        return false;

    var mes;
    mes = parseInt(array_fecha[1]);
    if (isNaN(mes))
        return false;

    var dia;
    dia = parseInt(array_fecha[0]);
    if (isNaN(dia))
        return false;

    //5. Si el año de la fecha que recibo solo tiene 2 cifras hay que cambiarlo a 4 
    if (ano <= 99)
        ano += 1900;

    //6. Resto los años de las dos fechas 
    var edad = hoy.getFullYear() - ano - 1; //-1 porque no se si ha cumplido años ya este año

    //7. Si resto los meses y me da menor que 0 entonces no ha cumplido años. Si da mayor si ha cumplido 
    if (hoy.getMonth() + 1 - mes < 0) { //+ 1 porque los meses empiezan en 0
        App.txtfEdad.setValue(edad + ' años');
        return true;
    }
    if (hoy.getMonth() + 1 - mes > 0) {
        App.txtfEdad.setValue((edad + 1) + ' años');
        return true;
    }

    //8. Entonces es que eran iguales. miro los dias 
    //Si resto los dias y me da menor que 0 entonces no ha cumplido años. Si da mayor o igual si ha cumplido 
    if (hoy.getUTCDate() - dia >= 0) {
        App.txtfEdad.setValue((edad + 1) + ' años');
        return true;
    }

    App.txtfEdad.setValue(edad + ' años');
};

//Método que se lanza despues de guardar un registro
var imgbtnGuardar_Click_Success = function (response, result) {
    if (Ext.util.Cookies.get('cookieEditarCliente') === 'Nuevo') {
        Ext.Msg.show({
            id: 'msgNuevo',
            title: 'Registro nuevo',
            msg: '<p align="center">Socio registrado con ID: ' + result.extraParamsResponse.registro + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { window.parent.App.wEmergente.hide(); window.parent.App.pCentro.getBody().App.sClientes.reload(); },
            icon: Ext.MessageBox.INFO
        });
    }
    else {
        Ext.Msg.show({
            id: 'msgActualizar',
            title: 'Actualizar registro',
            msg: '<p align="center">Información actualizada ID: ' + result.extraParamsResponse.registro + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { window.parent.App.wEmergente.hide(); window.parent.App.pCentro.getBody().App.sClientes.reload(); },
            icon: Ext.MessageBox.INFO
        });
    }
};

//Evento lanzado al cargar el store de la sucursal
var sCliente_Load = function () {
    App.direct.sCliente_Load();
    store = window.parent.App.pCentro.getBody().App.sClientes;
};

var fcEstadoCivilRender = function () {



    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {

        App.fcCliente5.hide();
        App.cmbEstadoCivil.allowBlank = true;
        App.cmbProfesion.allowBlank = true;
    }
    else {

    }
}

//Evento lanzado al agregar un registro al store
var sCliente_Add = function (store, registro) {
    console.log(registro[0]);





    //Primera parte
    App.txtfID.setValue(registro[0].get('ID'));
    App.txtfNombre.setValue(registro[0].get('Nombre'));
    App.txtfAPaterno.setValue(registro[0].get('APaterno'));
    App.txtfAMaterno.setValue(registro[0].get('AMaterno'));
    App.txtfRFC.setValue(registro[0].get('RFC'));
    App.txtfCURP.setValue(registro[0].get('CURP'));
    App.dfFechaNacimiento.setValue(registro[0].get('FechaNacimiento'));
    App.txtfEdad.setValue(registro[0].get('Edad') + ' años');
    App.cmbSexo.select(registro[0].get('Sexo'));
    App.cmbEstadoCivil.select(registro[0].get('EstadoCivil'));
    App.cmbProfesion.select(registro[0].get('Profesion'));
    App.txtfTelefono.setValue(registro[0].get('Telefono'));
    App.txtfTelefonoMovil.setValue(registro[0].get('TelefonoMovil'));
    App.txtfCorreo.setValue(registro[0].get('Correo'));
    App.cmbEstatus.select(registro[0].get('Estatus'));
    App.dfFechaAlta.setValue(registro[0].get('FechaAlta'));
    App.txtfUsuario.setValue(registro[0].get('Usuario'));

    //Segunda parte
    App.txtfCalle.setValue(registro[0].get('Calle'));
    App.txtfEntreCalles.setValue(registro[0].get('EntreCalles'));
    App.txtfNoExterior.setValue(registro[0].get('NoExterior'));
    App.txtfNoInterior.setValue(registro[0].get('NoInterior'));
    App.txtfCodigoPostal.setValue(registro[0].get('CodigoPostal'));
    App.txtfColonia.setValue(registro[0].get('Colonia'));
    App.cmbEstado.select(registro[0].get('Estado'));

    //Tercera parte
    App.txtfEmpresa.setValue(registro[0].get('Empresa'));
    App.txtfPuesto.setValue(registro[0].get('Puesto'));
    App.txtfEmpresaCalle.setValue(registro[0].get('EmpresaCalle'));
    App.txtfEmpresaEntreCalles.setValue(registro[0].get('EmpresaEntreCalles'));
    App.txtfEmpresaNoExterior.setValue(registro[0].get('EmpresaNoExterior'));
    App.txtfEmpresaNoInterior.setValue(registro[0].get('EmpresaNoInterior'));
    App.txtfEmpresaCodigoPostal.setValue(registro[0].get('EmpresaCodigoPostal'));
    App.txtfEmpresaColonia.setValue(registro[0].get('EmpresaColonia'));
    App.cmbEmpresaEstado.select(registro[0].get('EmpresaEstado'));
    //App.cmbEmpresaMunicipio.select(registro[0].get('EmpresaMunicipio'));
    App.txtfEmpresaTelefono.setValue(registro[0].get('EmpresaTelefono'));
    App.nfEmpresaTelefonoExt.setValue(registro[0].get('EmpresaTelefonoExt'));

    //Habiliatar controles
    App.cmbEstatus.setDisabled(false);

    //Asignar los Municipio
    App.direct.AsignarMunicipio(App.sCliente.getAt(0).get('Estado'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbMunicipio.select(registro[0].get('Municipio'));
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Asignar el EmpresaMunicipio
    App.direct.AsignarEmpresaMunicipio(App.sCliente.getAt(0).get('EmpresaEstado'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbEmpresaMunicipio.select(registro[0].get('EmpresaMunicipio'));
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });
};