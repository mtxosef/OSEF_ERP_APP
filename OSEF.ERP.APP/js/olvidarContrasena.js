var txtfEnviarCorreo_SpecialKey_Success = function (response, result) {
    if (result.extraParamsResponse.existe) {
        App.cErrorOlvidasteContrasena.hide();
        if (result.extraParamsResponse.correcto) {
            App.fpOlvidarContrasena.hide();
            App.cCorreoEnviado.show();
        }
        else {
            App.lblError.setValue(result.extraParamsResponse.mensaje);
            App.cErrorOlvidasteContrasena.show();
        }
    }
    else {
        App.lblError.setValue('Error, nombre de usuario o dirección incorrecta');
        App.cErrorOlvidasteContrasena.show();
    }
};