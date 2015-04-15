//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarSolicitudPrestamo', 'Nuevo');
    window.parent.App.wEmergente.load('FormaSolicitudPrestamo.aspx');
    window.parent.App.wEmergente.setHeight(576);
    window.parent.App.wEmergente.setWidth(825);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo prestamo');
    window.parent.App.wEmergente.show();
};

//Concatenar la columna de Nombre Completo
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};

//Evento que se lanza al seleccionar un elemento del ComboBox de Clientes
var cmbCliente_Select = function (combobox, registro) {
    AsignarDatosSocio(registro[0]);
    App.txtfNacionalidad.focus(false, true);
};

//Evento que se lanza al cambiar un valor en ComboBox de Clientes
var cmbCliente_Change = function (combobox, valorNuevo, valorAnterior) {
    if (valorNuevo == null) {
        LimpiarDatosSocio();
    }
    else {
        AsignarDatosSocio(App.sCliente.getAt(0));
    }
};

//Evento que se lanza al cambiar un valor en el ComboBox de EstadoCivil
var cmbEstadoCivil_Change = function (combobox, valorNuevo, valorAnterior, opciones) {
    if (valorNuevo !== 'CASADO') {
        App.tbSolicitudPrestamo.closeTab(App.pDatosConyugue);
    }
    else {
        App.tbSolicitudPrestamo.addTab(App.pDatosConyugue, 3);
        App.tbSolicitudPrestamo.setActiveTab(0);
    }
};

//Evento que se lanza al quita el foco del campo de Años en el domicilio actual
var nAniosDomicilio_Change = function (numberfield, valorNuevo, valorAnterior, opciones) {
    if (valorNuevo >= 3) {
        App.fsDomicilioAnterior.hide();
    }
    else {
        App.fsDomicilioAnterior.show();
    }
};

//Asignar los datos del Socio
function AsignarDatosSocio(registro) {
    //Asignar datos de socio
    App.txtfNombreCompleto.setValue(registro.data.NombreCompleto);
    App.txtfRFC.setValue(registro.data.RFC);
    App.cmbEstadoCivil.select(registro.data.EstadoCivil);
    App.txtfTelefono.setValue(registro.data.Telefono);
    App.txtfTelefonoMovil.setValue(registro.data.TelefonoMovil);
    App.txtfCorreo.setValue(registro.data.Correo);

    //Datos de domicilio
    App.txtfCalle.setValue(registro.data.Calle);
    App.txtfEntreCalles.setValue(registro.data.EntreCalles);
    App.txtfNoExterior.setValue(registro.data.NoExterior);
    App.txtfNoInterior.setValue(registro.data.NoInterior);
    App.txtfCodigoPostal.setValue(registro.data.CodigoPostal);
    App.cmbEstado.select(registro.data.Estado);

    //Asignar los Municipios
    App.direct.AsignarMunicipio(registro.data.Estado, {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbMunicipio.select(registro.data.Municipio);
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Asignar la Colonia
    App.direct.AsignarColonia(registro.data.Municipio, {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbColonia.select(registro.data.Colonia);
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Datos de Empresa
    App.txtfEmpresa.setValue(registro.data.Empresa);
    App.txtfEmpresaCalle.setValue(registro.data.EmpresaCalle);
    App.txtfEmpresaEntreCalles.setValue(registro.data.EmpresaEntreCalles);
    App.txtfEmpresaNoExterior.setValue(registro.data.EmpresaNoExterior);
    App.txtfEmpresaNoInterior.setValue(registro.data.EmpresaNoInterior);
    App.txtfEmpresaCodigoPostal.setValue(registro.data.EmpresaCodigoPostal);
    App.cmbEmpresaEstado.select(registro.data.EmpresaEstado);

    App.txtfEmpresaTelefono.setValue(registro.data.EmpresaTelefono);
    App.nfEmpresaTelefonoExt.setValue(registro.data.EmpresaTelefonoExt);

    //Datos Empresa Socio
    App.txtfPuesto.setValue(registro.data.Puesto);

    //Asignar los Municipios
    App.direct.AsignarEmpresaMunicipio(registro.data.EmpresaEstado, {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbEmpresaMunicipio.select(registro.data.EmpresaMunicipio);
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Asignar los Municipios
    App.direct.AsignarEmpresaColonia(registro.data.EmpresaMunicipio, {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbEmpresaColonia.select(registro.data.EmpresaColonia);
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });
};

//Limpiar los datos del Socio seleccionado
function LimpiarDatosSocio() {
    App.txtfNombreCompleto.setValue('');
    App.txtfRFC.setValue('');
    App.cmbEstadoCivil.setValue('');
    App.txtfTelefono.setValue('');
    App.txtfTelefonoMovil.setValue('');
    App.txtfCorreo.setValue('');
    App.txtfCalle.setValue('');
    App.txtfEntreCalles.setValue('');
    App.txtfNoExterior.setValue('');
    App.txtfNoInterior.setValue('');
    App.txtfCodigoPostal.setValue('');
    App.cmbEstado.select(null);
    App.cmbMunicipio.select(null);
};

//Método para calcular la edad en base a la fecha de nacimiento
var CalcularFechaNacimiento = function (datefield, fecha) {
    fecha = App.dfConyugeFechaNacimiento.getValue();

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
        App.txtfConyugeEdad.setValue(edad + ' años');
        return true;
    }
    if (hoy.getMonth() + 1 - mes > 0) {
        App.txtfConyugeEdad.setValue((edad + 1) + ' años');
        return true;
    }

    //8. Entonces es que eran iguales. miro los dias 
    //Si resto los dias y me da menor que 0 entonces no ha cumplido años. Si da mayor o igual si ha cumplido 
    if (hoy.getUTCDate() - dia >= 0) {
        App.txtfConyugeEdad.setValue((edad + 1) + ' años');
        return true;
    }

    App.txtfConyugeEdad.setValue(edad + ' años');
};