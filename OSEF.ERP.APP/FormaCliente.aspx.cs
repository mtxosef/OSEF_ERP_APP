﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.Configuration;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class FormaCliente : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Validar si son peticiones Ajax
            if (!X.IsAjaxRequest)
            {
                //2. Llenar el ComboBox de Profesiones
                sProfesiones.DataSource = ProfesionBusiness.ObtenerProfesiones();
                sProfesiones.DataBind();
                //3. Llenar el ComboBox de Estados
                sEstados.DataSource = EstadoBusiness.ObtenerEstados();
                sEstados.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un estado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un municipio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbMunicipio_Select(object sender, DirectEventArgs e)
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
            //1. Listar los municipio de acuerdo al Estado
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al carar el store de Colonias
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarColonia(string strMunicipio)
        {
            //1. Listar las colonias de acuerdo al Municipio
            sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColonias.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un estado
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
        /// Evento que se lanza al seleccionar un Municipio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEmpresaMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strMunicipio = e.ExtraParams["valor"];
            sEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de EmpresaMunicipios
        /// </summary>
        [DirectMethod]
        public void AsignarEmpresaMunicipio(string strEstado)
        {
            //1. Listar los municipios de acuerdo al Municipio
            sEmpresaMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sEmpresaMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de EmpresaColonias
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarEmpresaColonia(string strMunicipio)
        {
            //1. Listar las colonias de acuerdo al Municipio
            sEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento de clic al botón de Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string edad = e.ExtraParams["edad"];
            byte bEdad = 0;

            //2. Transformar la Edad a tomar solo los años
            bEdad = Convert.ToByte(e.ExtraParams["edad"].Substring(0, e.ExtraParams["edad"].IndexOf(' ')));

            //3. Obtener los parametros de la Forma
            string strRegistro = e.ExtraParams["registro"];
            string strUsuario = e.ExtraParams["usuario"];
            string strcookieEditarCliente = Cookies.GetCookie("cookieEditarCliente").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Cliente oCliente = new Cliente();
            oCliente.Edad = bEdad;
            oCliente.TipoSocio = "";
            oCliente.NumeroSocio = "";

            //3. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //4. Datos del cliente
                    case "txtfNombre":
                        oCliente.Nombre = sd.Value;
                        break;
                    case "txtfAPaterno":
                        oCliente.APaterno = sd.Value;
                        break;
                    case "txtfAMaterno":
                        oCliente.AMaterno = sd.Value;
                        break;
                    case "txtfRFC":
                        oCliente.RFC = sd.Value;
                        break;
                    case "txtfCURP":
                        oCliente.CURP = sd.Value;
                        break;
                    case "dfFechaNacimiento":
                        oCliente.FechaNacimiento = Convert.ToDateTime(sd.Value);
                        break;
                    case "cmbSexo":
                        oCliente.Sexo = sd.Value;
                        break;
                    case "cmbEstadoCivil":
                        oCliente.EstadoCivil = sd.Value;
                        break;
                    case "cmbProfesion":
                        oCliente.Profesion = sd.Value;
                        break;
                    case "txtfCorreo":
                        oCliente.Correo = sd.Value;
                        break;
                    case "txtfTelefono":
                        oCliente.Telefono = sd.Value;
                        break;
                    case "txtfTelefonoMovil":
                        oCliente.TelefonoMovil = sd.Value;
                        break;
                    case "txtfCalle":
                        oCliente.Calle = sd.Value;
                        break;
                    case "txtfNoExterior":
                        oCliente.NoExterior = sd.Value;
                        break;
                    case "txtfNoInterior":
                        oCliente.NoInterior = sd.Value;
                        break;
                    case "cmbColonia":
                        oCliente.Colonia = sd.Value;
                        break;
                    case "txtfCodigoPostal":
                        oCliente.CodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "txtfEntreCalles":
                        oCliente.EntreCalles = sd.Value;
                        break;
                    case "cmbEstado":
                        oCliente.Estado = sd.Value;
                        break;
                    case "cmbMunicipio":
                        oCliente.Municipio = sd.Value;
                        break;
                    case "txtfEmpresa":
                        if (sd.Value.Equals(""))
                            oCliente.Empresa = null;
                        else
                            oCliente.Empresa = sd.Value;
                        break;
                    case "txtfEmpresaCalle":
                        oCliente.EmpresaCalle = sd.Value;
                        break;
                    case "txtfEmpresaNoExterior":
                        oCliente.EmpresaNoExterior = sd.Value;
                        break;
                    case "txtfEmpresaNoInterior":
                        oCliente.EmpresaNoInterior = sd.Value;
                        break;
                    case "cmbEmpresaColonia":
                        oCliente.EmpresaColonia = sd.Value;
                        break;
                    case "txtfEmpresaCodigoPostal":
                        if (sd.Value.Equals(""))
                            oCliente.EmpresaCodigoPostal = null;
                        else
                            oCliente.EmpresaCodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "txtfEmpresaEntreCalles":
                        oCliente.EmpresaEntreCalles = sd.Value;
                        break;
                    case "cmbEmpresaEstado":
                        oCliente.EmpresaEstado = sd.Value;
                        break;
                    case "cmbEmpresaMunicipio":
                        oCliente.EmpresaMunicipio = sd.Value;
                        break;
                    case "txtfEmpresaTelefono":
                        oCliente.EmpresaTelefono = sd.Value;
                        break;
                    case "nfEmpresaTelefonoExt":
                        if (sd.Value == null)
                            oCliente.EmpresaTelefonoExt = null;
                        else
                            oCliente.EmpresaTelefonoExt = Convert.ToInt16(sd.Value);
                        break;
                    case "txtfPuesto":
                        oCliente.Puesto = sd.Value;
                        break;
                    case "cmbEstatus":
                        oCliente.Estatus = sd.Value;
                        break;
                }
            }

            //5. Complementar datos
            if (strcookieEditarCliente.Equals("Nuevo"))
            {
                Usuario oUsuario = (Usuario)Session["Usuario"];
                oCliente.FechaAlta = DateTime.Now;
                oCliente.Estatus = "ALTA";
                oCliente.Usuario = oUsuario.ID;
                oCliente.ID = ClienteBusiness.Insertar(oCliente);
            }
            else
            {
                oCliente.ID = strcookieEditarCliente;
                ClienteBusiness.Actualizar(oCliente);
            }

            //6. Mandar parametro (ID del Cliente)
            e.ExtraParamsResponse.Add(new Ext.Net.Parameter("registro", oCliente.ID, ParameterMode.Value));
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sCliente_Load()
        {
            //1. Obtener Cookie del Cliente
            string strcookieEditarCliente = Cookies.GetCookie("cookieEditarCliente").Value;

            //2. Asignar el objeto del Cliente y llenar el Store sCliente
            Cliente oCliente = ClienteBusiness.ObtenerClientePorID(strcookieEditarCliente);
            sCliente.Add(new
            {
                ID = oCliente.ID,
                Nombre = oCliente.Nombre,
                APaterno = oCliente.APaterno,
                AMaterno = oCliente.AMaterno,
                RFC = oCliente.RFC,
                CURP = oCliente.CURP,
                FechaNacimiento = oCliente.FechaNacimiento,
                Edad = oCliente.Edad,
                Sexo = oCliente.Sexo,
                EstadoCivil = oCliente.EstadoCivil,
                Profesion = oCliente.Profesion,
                Correo = oCliente.Correo,
                Telefono = oCliente.Telefono,
                TelefonoMovil = oCliente.TelefonoMovil,
                Calle = oCliente.Calle,
                NoExterior = oCliente.NoExterior,
                NoInterior = oCliente.NoInterior,
                Colonia = oCliente.Colonia,
                CodigoPostal = oCliente.CodigoPostal,
                EntreCalles = oCliente.EntreCalles,
                Estado = oCliente.Estado,
                Municipio = oCliente.Municipio,
                Empresa = oCliente.Empresa,
                EmpresaCalle = oCliente.EmpresaCalle,
                EmpresaNoExterior = oCliente.EmpresaNoExterior,
                EmpresaNoInterior = oCliente.EmpresaNoInterior,
                EmpresaColonia = oCliente.EmpresaColonia,
                EmpresaCodigoPostal = oCliente.EmpresaCodigoPostal,
                EmpresaEntreCalles = oCliente.EmpresaEntreCalles,
                EmpresaEstado = oCliente.EmpresaEstado,
                EmpresaMunicipio = oCliente.EmpresaMunicipio,
                EmpresaTelefono = oCliente.EmpresaTelefono,
                EmpresaTelefonoExt = oCliente.EmpresaTelefonoExt,
                Puesto = oCliente.Puesto,
                TipoSocio = oCliente.TipoSocio,
                NumeroSocio = oCliente.NumeroSocio,
                Usuario = oCliente.Usuario,
                FechaAlta = oCliente.FechaAlta,
                Estatus = oCliente.Estatus
            });
        }
    }
}