using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class FormaSolicitudPrestamo : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Validar que no sea una petición Ajax
            if (!X.IsAjaxRequest)
            {
                //2. Cargar el ComboBox de Clientes
                sCliente.DataSource = ClienteBusiness.ObtenerClientes();
                sCliente.DataBind();

                //3. Cargar el ComboBox de Estados
                sEstados.DataSource = EstadoBusiness.ObtenerEstados();
                sEstados.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al cambiar un Estado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstado_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cambiar un municipio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbMunicipio_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strMunicipio = e.ExtraParams["valor"];
            sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColonias.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Municipios
        /// </summary>
        [DirectMethod]
        public void AsignarMunicipio(string strEstado)
        {
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Colonias
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarColonia(string strMunicipio)
        {
            sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColonias.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado para Domicilio Anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstadoAnterior_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sMunicipiosAnterior.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipiosAnterior.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el Domicilio Anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbMunicipioAnterior_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sColoniasAnterior.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColoniasAnterior.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEmpresaEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sEmpresaMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sEmpresaMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el domicilio de la Empresa
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEmpresaMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Empresa Municipios
        /// </summary>
        [DirectMethod]
        public void AsignarEmpresaMunicipio(string strEstado)
        {
            sEmpresaMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sEmpresaMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Empresa Colonia
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarEmpresaColonia(string strMunicipio)
        {
            sEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado para el domicilio del Conyuge
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbConyugeEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sConyugeMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sConyugeMunicipio.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el domicilio del Conyuge
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbConyugeMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sConyugeColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sConyugeColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado para el domicilio de la Empresa del Conyuge
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbConyugeEmpresaEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strEstado = e.ExtraParams["valor"];
            sConyugeEmpresaMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sConyugeEmpresaMunicipio.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el domicilio de la Empresa del Conyuge
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbConyugeEmpresaMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sConyugeEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sConyugeEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado para el domicilio del Aval
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbAvalEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strEstado = e.ExtraParams["valor"];
            sAvalMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sAvalMunicipio.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el domicilio del Aval
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbAvalMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sAvalColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sAvalColonia.DataBind();
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma
            string strRegistro = e.ExtraParams["registro"];
            string strUsuario = e.ExtraParams["usuario"];
            string strcookieEditarSolicitudPrestamo = Cookies.GetCookie("cookieEditarSolicitudPrestamo").Value;

            //2. Deserealizar datos
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Usuario oUsuario = JSON.Deserialize<List<Usuario>>(strUsuario).FirstOrDefault();

            //3. Declarar objetos a utilizar
            SolicitudPrestamo oSolicitudPrestamo = new SolicitudPrestamo();
            Cliente oCliente = new Cliente();

            //4. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //5. Datos del cliente y la solicitud de prestamo
                    case "cmbCliente":
                        oSolicitudPrestamo.Cliente = sd.Value;
                        oCliente.ID = sd.Value;
                        break;
                    case "txtfRFC":
                        oCliente.RFC = sd.Value;
                        break;
                    case "cmbEstadoCivil":
                        oCliente.EstadoCivil = sd.Value;
                        break;
                    case "txtfTelefono":
                        oCliente.Telefono = sd.Value;
                        break;
                    case "txtfTelefonoMovil":
                        oCliente.TelefonoMovil = sd.Value;
                        break;
                    case "txtfCorreo":
                        oCliente.Correo = sd.Value;
                        break;
                    case "txtfNacionalidad":
                        oSolicitudPrestamo.Nacionalidad = sd.Value;
                        break;
                    case "nfNumeroDependientes":
                        oSolicitudPrestamo.NumeroDependientes = Convert.ToByte(sd.Value);
                        break;
                    case "txtfEdades":
                        oSolicitudPrestamo.Edades = sd.Value;
                        break;
                    case "App.rgRegistroMatrimonial_Group":
                        switch (sd.Value)
                        {
                            case "App.rBienesSeparados":
                                oSolicitudPrestamo.RegistroMatrimonial = "BIENES SEPARADOS";
                                break;
                            case "App.rBienesMancomunados":
                                oSolicitudPrestamo.RegistroMatrimonial = "BIENES MANCOMUNADOS";
                                break;
                        }
                        break;
                    case "App.rgTipoCasa_Group":
                        switch (sd.Value)
                        {
                            case "App.rPropia":
                                oSolicitudPrestamo.TipoCasa = "PROPIA";
                                break;
                            case "App.rRentada":
                                oSolicitudPrestamo.TipoCasa = "RENTADA";
                                break;
                            case "App.rFamilia":
                                oSolicitudPrestamo.TipoCasa = "FAMILIA";
                                break;
                            case "App.rHipoteca":
                                oSolicitudPrestamo.TipoCasa = "HIPOTECA";
                                break;
                        }
                        break;
                    case "nAniosDomicilio":
                        oSolicitudPrestamo.AniosDomicilio = Convert.ToByte(sd.Value);
                        break;
                    case "cmbEstatus":
                        oSolicitudPrestamo.Estatus = sd.Value;
                        break;
                    case "txtfCalle":
                        oCliente.Calle = sd.Value;
                        break;
                    case "txtfEntreCalles":
                        oCliente.EntreCalles = sd.Value;
                        break;
                    case "txtfNoExterior":
                        oCliente.NoExterior = sd.Value;
                        break;
                    case "txtfNoInterior":
                        oCliente.NoInterior = sd.Value;
                        break;
                    case "txtfCodigoPostal":
                        oCliente.CodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbEstado":
                        oCliente.Estado = sd.Value;
                        break;
                    case "cmbMunicipio":
                        oCliente.Municipio = sd.Value;
                        break;
                    case "cmbColonia":
                        oCliente.Colonia = sd.Value;
                        break;
                    case "txtfCalleAnterior":
                        oSolicitudPrestamo.CalleAnterior = sd.Value;
                        break;
                    case "txtfEntreCallesAnterior":
                        oSolicitudPrestamo.EntreCallesAnterior = sd.Value;
                        break;
                    case "txtfNoExteriorAnterior":
                        oSolicitudPrestamo.NoExteriorAnterior = sd.Value;
                        break;
                    case "txtfNoInteriorAnterior":
                        oSolicitudPrestamo.NoInteriorAnterior = sd.Value;
                        break;
                    case "txtfCodigoPostalAnterior":
                        oSolicitudPrestamo.CodigoPostalAnterior = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbEstadoAnterior":
                        oSolicitudPrestamo.EstadoAnterior = sd.Value;
                        break;
                    case "cmbMunicipioAnterior":
                        oSolicitudPrestamo.MunicipioAnterior = sd.Value;
                        break;
                    case "cmbColoniaAnterior":
                        oSolicitudPrestamo.ColoniaAnterior = sd.Value;
                        break;
                    case "txtfEmpresa":
                        oCliente.Empresa = sd.Value;
                        break;
                    case "txtfEmpresaCalle":
                        oCliente.EmpresaCalle = sd.Value;
                        break;
                    case "txtfEmpresaEntreCalles":
                        oCliente.EmpresaEntreCalles = sd.Value;
                        break;
                    case "txtfEmpresaNoExterior":
                        oCliente.EmpresaNoExterior = sd.Value;
                        break;
                    case "txtfEmpresaNoInterior":
                        oCliente.EmpresaNoInterior = sd.Value;
                        break;
                    case "txtfEmpresaCodigoPostal":
                        oCliente.EmpresaCodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbEmpresaEstado":
                        oCliente.EmpresaEstado = sd.Value;
                        break;
                    case "cmbEmpresaMunicipio":
                        oCliente.EmpresaMunicipio = sd.Value;
                        break;
                    case "cmbEmpresaColonia":
                        oCliente.EmpresaColonia = sd.Value;
                        break;
                    case "txtfEmpresaTelefono":
                        oCliente.EmpresaTelefono = sd.Value;
                        break;
                    case "nfEmpresaTelefonoExt":
                        oCliente.EmpresaTelefonoExt = Convert.ToInt16(sd.Value);
                        break;
                    case "nfAntiguedad":
                        oSolicitudPrestamo.Antiguedad = Convert.ToByte(sd.Value);
                        break;
                    case "nfIngresos":
                        oSolicitudPrestamo.Ingresos = Convert.ToInt16(sd.Value);
                        break;
                    case "nfOtrosIngresos":
                        oSolicitudPrestamo.OtrosIngresos = Convert.ToInt16(sd.Value);
                        break;
                    case "txtfOtrosIngresos":
                        oSolicitudPrestamo.Concepto = sd.Value;
                        break;
                    case "txtfEmpresaAnterior":
                        oSolicitudPrestamo.EmpresaAnterior = sd.Value;
                        break;
                    case "txtfPuesto":
                        oCliente.Puesto = sd.Value;
                        break;
                    case "txtfJefeNombre":
                        oSolicitudPrestamo.JefeNombre = sd.Value;
                        break;
                    case "txtfJefeAPaterno":
                        oSolicitudPrestamo.JefeAPaterno = sd.Value;
                        break;
                    case "txtfJefeAMaterno":
                        oSolicitudPrestamo.JefeAMaterno = sd.Value;
                        break;
                    case "txtfConyugeNombre":
                        oSolicitudPrestamo.ConyugeNombre = sd.Value;
                        break;
                    case "txtfConyugeAPaterno":
                        oSolicitudPrestamo.ConyugeAPaterno = sd.Value;
                        break;
                    case "txtfConyugeAMaterno":
                        oSolicitudPrestamo.ConyugeAMaterno = sd.Value;
                        break;
                    case "dfConyugeFechaNacimiento":
                        oSolicitudPrestamo.ConyugeFechaNacimiento = Convert.ToDateTime(sd.Value);
                        break;
                    case "txtfConyugeRFC":
                        oSolicitudPrestamo.ConyugeRFC = sd.Value;
                        break;
                    case "txtfConyugeTelefono":
                        oSolicitudPrestamo.ConyugeTelefono = sd.Value;
                        break;
                    case "txtfConyugeTelefonoMovil":
                        oSolicitudPrestamo.ConyugeTelefonoMovil = sd.Value;
                        break;
                    case "txtfConyugeCalle":
                        oSolicitudPrestamo.ConyugeCalle = sd.Value;
                        break;
                    case "txtfConyugeEntreCalles":
                        oSolicitudPrestamo.ConyugeEntreCalles = sd.Value;
                        break;
                    case "txtfConyugeNoExterior":
                        oSolicitudPrestamo.ConyugeNoExterior = sd.Value;
                        break;
                    case "txtfConyugeNoInterior":
                        oSolicitudPrestamo.ConyugeNoInterior = sd.Value;
                        break;
                    case "cmbConyugeEstado":
                        oSolicitudPrestamo.ConyugeEstado = sd.Value;
                        break;
                    case "cmbConyugeMunicipio":
                        oSolicitudPrestamo.ConyugeMunicipio = sd.Value;
                        break;
                    case "cmbConyugeColonia":
                        oSolicitudPrestamo.ConyugeColonia = sd.Value;
                        break;
                    case "txtfConyugeCodigoPostal":
                        oSolicitudPrestamo.ConyugeCodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "nfConyugeAntiguedad":
                        oSolicitudPrestamo.ConyugeAntiguedad = Convert.ToByte(sd.Value);
                        break;
                    case "nfConyugeIngresos":
                        oSolicitudPrestamo.ConyugeIngresos = Convert.ToInt16(sd.Value);
                        break;
                    case "nfConyugeOtrosIngresos":
                        oSolicitudPrestamo.ConyugeOtrosIngresos = Convert.ToInt16(sd.Value);
                        break;
                    case "txtfConyugeEmpresaConceptoOtrosIngresos":
                        oSolicitudPrestamo.ConyugeConcepto = sd.Value;
                        break;
                    case "txtfConyugeEmpresa":
                        oSolicitudPrestamo.ConyugeEmpresa = sd.Value;
                        break;
                    case "txtfConyugePuesto":
                        oSolicitudPrestamo.ConyugePuesto = sd.Value;
                        break;
                    case "txtfConyugeEmpresaJefeNombre":
                        oSolicitudPrestamo.ConyugeEmpresaJefeNombre = sd.Value;
                        break;
                    case "txtfConyugeEmpresaJefeAPAterno":
                        oSolicitudPrestamo.ConyugeEmpresaJefeAPaterno = sd.Value;
                        break;
                    case "txtfConyugeEmpresaJefeAMAterno":
                        oSolicitudPrestamo.ConyugeEmpresaJefeAMaterno = sd.Value;
                        break;
                    case "txtfConyugeEmpresaCalle":
                        oSolicitudPrestamo.ConyugeEmpresaCalle = sd.Value;
                        break;
                    case "txtfConyugeEmpresaEntreCalles":
                        oSolicitudPrestamo.ConyugeEmpresaEntreCalles = sd.Value;
                        break;
                    case "txtfConyugeEmpresaNoExterior":
                        oSolicitudPrestamo.ConyugeEmpresaNoExterior = sd.Value;
                        break;
                    case "txtfConyugeEmpresaNoInterior":
                        oSolicitudPrestamo.ConyugeEmpresaNoInterior = sd.Value;
                        break;
                    case "txtfConyugeEmpresaCodigoPostal":
                        oSolicitudPrestamo.ConyugeEmpresaCodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbConyugeEmpresaColonia":
                        oSolicitudPrestamo.ConyugeEmpresaColonia = sd.Value;
                        break;
                    case "cmbConyugeEmpresaEstado":
                        oSolicitudPrestamo.ConyugeEmpresaEstado = sd.Value;
                        break;
                    case "cmbConyugeEmpresaMunicipio":
                        oSolicitudPrestamo.ConyugeEmpresaMunicipio = sd.Value;
                        break;
                    //*****Datos de Aval*****//
                    case "txtfAvalNombre":
                        oSolicitudPrestamo.AvalNombre = sd.Value;
                        break;
                    case "txtfAvalApellidoPaterno":
                        oSolicitudPrestamo.AvalAPaterno = sd.Value;
                        break;
                    case "txtfAvalApellidoMaterno":
                        oSolicitudPrestamo.AvalAMaterno = sd.Value;
                        break;
                    case "App.rgSocioCooperativa_Group":
                        switch (sd.Value)
                        {
                            case "App.rSocioSi":
                                oSolicitudPrestamo.AvalSocio = true;
                                break;
                            case "App.rSocioNo":
                                oSolicitudPrestamo.AvalSocio = false;
                                break;
                        }
                        break;
                    case "cmbAvalEstadoCivil":
                        oSolicitudPrestamo.AvalEstadoCivil = sd.Value;
                        break;
                    case "App.rgAvalRegistroMatrimonial_Group":
                        switch (sd.Value)
                        {
                            case "App.rAvalBienesSeparados":
                                oSolicitudPrestamo.AvalRegistroMatrimonial = "BIENES SEPARADOS";
                                break;
                            case "App.rAvalBienesMancomunados":
                                oSolicitudPrestamo.AvalRegistroMatrimonial = "BIENES MANCOMUNADOS";
                                break;
                        }
                        break;
                    case "txtfAvalTelefono":
                        oSolicitudPrestamo.AvalTelefono = sd.Value;
                        break;
                    case "txtfAvalTelefonoMovil":
                        oSolicitudPrestamo.AvalTelefonoMovil = sd.Value;
                        break;
                    case "txtfAvalCalle":
                        oSolicitudPrestamo.AvalCalle = sd.Value;
                        break;
                    case "txtfAvalEntreCalles":
                        oSolicitudPrestamo.AvalEntreCalles = sd.Value;
                        break;
                    case "txtfAvalNoExterior":
                        oSolicitudPrestamo.AvalNoExterior = sd.Value;
                        break;
                    case "txtfAvalNoInterior":
                        oSolicitudPrestamo.AvalNoInterior = sd.Value;
                        break;
                    case "txtfAvalCodigoPostal":
                        oSolicitudPrestamo.AvalCodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbAvalColonia":
                        oSolicitudPrestamo.AvalColonia = sd.Value;
                        break;
                    case "cmbAvalEstado":
                        oSolicitudPrestamo.AvalEstado = sd.Value;
                        break;
                    case "cmbAvalMunicipio":
                        oSolicitudPrestamo.AvalMunicipio = sd.Value;
                        break;
                    case "App.rgAvalTipoCasa_Group":
                        switch (sd.Value)
                        {
                            case "App.rAvalPropia":
                                oSolicitudPrestamo.AvalTipoCasa = "PROPIA";
                                break;
                            case "App.rAvalRentada":
                                oSolicitudPrestamo.AvalTipoCasa = "RENTADA";
                                break;
                            case "App.rAvalFamilia":
                                oSolicitudPrestamo.AvalTipoCasa = "FAMILIA";
                                break;
                            case "App.rAvalHipoteca":
                                oSolicitudPrestamo.AvalTipoCasa = "HIPOTECA";
                                break;
                        }
                        break;
                    case "nfAntiguedadDocmicilioAval":
                        oSolicitudPrestamo.AvalAntiguedad = Convert.ToByte(sd.Value);
                        break;
                    //*****Ocupación de Aval*****//
                    case "txtfAvalEmpresa":
                        oSolicitudPrestamo.AvalEmpresa = sd.Value;
                        break;
                    case "txtfAvalEmpresaPuesto":
                        oSolicitudPrestamo.AvalEmpresaPuesto = sd.Value;
                        break;
                    case "txtfAvalEmpresaJefeNombre":
                        oSolicitudPrestamo.AvalEmpresaJefeNombre = sd.Value;
                        break;
                    case "txtfAvalEmpresaJefeAPaterno":
                        oSolicitudPrestamo.AvalEmpresaJefeAPaterno = sd.Value;
                        break;
                    case "txtfAvalEmpresaJefeAMaterno":
                        oSolicitudPrestamo.AvalEmpresaJefeAMaterno = sd.Value;
                        break;
                    case "nfAvalEmpresaAntiguedad":
                        oSolicitudPrestamo.AvalEmpresaAntiguedad = Convert.ToByte(sd.Value);
                        break;
                    case "nfAvalEmpresaIngresos":
                        oSolicitudPrestamo.AvalEmpresaIngresos = Convert.ToInt32(sd.Value);
                        break;
                    case "nfAvalEmpresaOtrosIngresos":
                        oSolicitudPrestamo.AvalEmpresaOtrosIngresos = Convert.ToInt32(sd.Value);
                        break;
                    case "txtfAvalEmpresaConcepto":
                        oSolicitudPrestamo.AvalEmpresaConcepto = sd.Value;
                        break;
                    case "App.rgAvalEmpresaPropietario_Group":
                        switch (sd.Value)
                        {
                            case "App.rAvalEmpresaPropietarioSi":
                                oSolicitudPrestamo.AvalEmpresaPropietario = true;
                                break;
                            case "App.rAvalEmpresaPropietarioNo":
                                oSolicitudPrestamo.AvalEmpresaPropietario = false;
                                break;
                        }
                        break;
                    case "App.rgAvalEmpresaTipo_Group":
                        switch (sd.Value)
                        {
                            case "App.rAvalEmpresaTipoEmpleado":
                                oSolicitudPrestamo.AvalEmpresaTipo = "EMPLEADO";
                                break;
                            case "App.rAvalEmpresaTipoGiroComercial":
                                oSolicitudPrestamo.AvalEmpresaTipo = "GIRO COMERCIAL";
                                break;
                        }
                        break;
                    case "txtfAvalEmpresaTelefono":
                        oSolicitudPrestamo.AvalEmpresaTelefono = sd.Value;
                        break;
                    case "nfAvalEmpresaTelefonoExt":
                        oSolicitudPrestamo.AvalEmpresaTelefonoExt = Convert.ToInt16(sd.Value);
                        break;
                    case "txtfAvalEmpresaAnterior":
                        oSolicitudPrestamo.AvalEmpresaAnterior = sd.Value;
                        break;
                    case "nfCantidad":
                        oSolicitudPrestamo.Cantidad = Convert.ToInt32(sd.Value);
                        break;
                    case "nfPlazo":
                        oSolicitudPrestamo.Plazo = Convert.ToInt16(sd.Value);
                        break;
                    case "cmbFormaPago":
                        oSolicitudPrestamo.FormaPago = sd.Value;
                        break;
                    case "cmbDestinoPrestamo":
                        oSolicitudPrestamo.DetinoPrestamo = sd.Value;
                        break;
                    case "cmbTipo":
                        oSolicitudPrestamo.Tipo = sd.Value;
                        break;
                }
            }

            //6. Complementar datos
            if (strcookieEditarSolicitudPrestamo.Equals("Nuevo"))
            {
                oSolicitudPrestamo.Estatus = "ALTA";
                oSolicitudPrestamo.UsuarioAlta = oUsuario.ID;
                oSolicitudPrestamo.FechaAlta = DateTime.Now;
                oSolicitudPrestamo.FechaModificacion = DateTime.Now;
                oSolicitudPrestamo.UsuarioModificacion = oUsuario.ID;
                oSolicitudPrestamo.ID = SolicitudPrestamoBusiness.Insertar(oSolicitudPrestamo);
            }
        }
    }
}