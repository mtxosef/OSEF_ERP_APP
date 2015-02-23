var banderaValidate = false;

var imgbtnGuardar_Click_Success = function (response, result) {

};

var imgbtnCancelar_Click = function () {
    window.parent.App.wEmergente.hide();
};

//Validar el TextField de Contraseña
var txtfContrasena_Validator = function (valor) {
    if (App.txtfConfirmarContrasena.getPassword() == '') {
        return true;
    }
    else if (this.getPassword() == App.txtfConfirmarContrasena.getPassword()) {
        if (banderaValidate == false) {
            banderaValidate = true;
            App.txtfConfirmarContrasena.validate();
            banderaValidate = false;
        }
        return true;
    }
    else {
        return 'Las contraseñas no coinciden';
    }
};

//Validar el TextField de Confirmar Contraseña
var txtfConfirmarContrasena_Validator = function (valor) {
    if (App.txtfContrasena.getPassword() == '') {
        return true;
    }
    else if (this.getPassword() == App.txtfContrasena.getPassword()) {
        if (banderaValidate == false) {
            banderaValidate = true;
            App.txtfContrasena.validate();
            banderaValidate = false;
        }
        return true;
    }
    else {
        return 'Las contraseñas no coinciden';
    }
};

//Dar formato a los datos que se mandarán desde el formulario
var sendData = function () {
    var data = App.fpCambiarContrasena.getForm().getValues(false, false, false, true);

    data.txtfContrasenaActual = data.txtfContrasenaActual[1];
    data.txtfContrasena = data.txtfContrasena[1];
    data.txtfConfirmarContrasena = data.txtfConfirmarContrasena[1];
    return data;
};