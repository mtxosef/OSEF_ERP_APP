//Concatenar la columna de Nombre Completo
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};

//Evento que se lanza al seleccionar un elemento del ComboBox de Clientes
var cmbCliente_Select = function (combobox, registro) {
    AsignarDatosSocio(registro[0]);
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