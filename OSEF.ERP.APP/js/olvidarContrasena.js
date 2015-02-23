//Método que se lanza despues de mandar la información de reestablecer contraseña
var txtfEnviarCorreo_SpecialKey_Success = function (response, result) {


    if (result.extraParamsResponse.existe) {
        App.cErrorOlvidasteContrasena.hide();
        if (result.extraParamsResponse.correcto) {
            App.fpOlvidarContrasena.hide();
            App.cCorreoEnviado.show();
        }
        else {
            App.lblError.setText(result.extraParamsResponse.mensaje);
            App.cErrorOlvidasteContrasena.show();
        }
    }
    else {
        App.lblError.setText('Error, nombre de usuario o dirección incorrecta');
        App.cErrorOlvidasteContrasena.show();
    }
};