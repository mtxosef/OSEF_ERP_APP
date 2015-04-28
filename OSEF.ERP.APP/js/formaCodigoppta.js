var imgbtnGuardar_change = function () {
    var regex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{1,99}$/
    var desregex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{1,499}$/
//    if (regex.test(App.txtNombre.getValue()) && desregex.test(App.txtDescripcion.getValue())) {

        App.imgbtnGuardar.setDisabled(false);
//    }

//    else if (App.txtDescripcion.getValue() == '') {


//    }
//    else {
        App.imgbtnGuardar.setDisabled(true);
        App.sbPPTA.setText('No se permiten caracteres especiales');
//    }
    }