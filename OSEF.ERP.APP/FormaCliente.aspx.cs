using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.Configuration;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaSocio : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                sProfesiones.DataSource = ProfesionBusiness.ObtenerProfesiones();
                sProfesiones.DataBind();
                sEstados.DataSource = EstadoBusiness.ObtenerEstados();
                sEstados.DataBind();
                Cookies.Set("osefTheme", ConfigurationManager.AppSettings["osefTheme"].ToString(), DateTime.Now.AddDays(30), "/", null, false);
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
        /// Evento de clic al botón de Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRegistro = e.ExtraParams["registro"];
            byte bEdad = Convert.ToByte(e.ExtraParams["edad"].Substring(0, e.ExtraParams["edad"].IndexOf(' ')));
            string strUsuario = e.ExtraParams["usuario"];
            string strcookieEditarCliente = Cookies.GetCookie("cookieEditarCliente").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Cliente oCliente = new Cliente();
            oCliente.Edad = bEdad;
            oCliente.TipoSocio = "";
            oCliente.NumeroSocio = "";

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos del cliente
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
                    case "txtfColonia":
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
                    case "txtfEmpresaColonia":
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
                            oCliente.EmpresaTelefonoExt = Convert.ToInt32(sd.Value);
                        break;
                    case "txtfPuesto":
                        oCliente.Puesto = sd.Value;
                        break;
                    case "cmbEstatus":
                        oCliente.Estatus = sd.Value;
                        break;
                }
            }

            //Complementar datos
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

            //Mandar parametro (ID del Cliente)
            e.ExtraParamsResponse.Add(new Ext.Net.Parameter("registro", oCliente.ID, ParameterMode.Value));
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sCliente_Load()
        {
            string strcookieEditarCliente = Cookies.GetCookie("cookieEditarCliente").Value;
            if (!strcookieEditarCliente.Equals("Nuevo"))
            {
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
        /// Evento que se lanza al cargar el store de EmpresaMunicipios
        /// </summary>
        [DirectMethod]
        public void AsignarEmpresaMunicipio(string strEstado)
        {
            sEmpresaMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sEmpresaMunicipios.DataBind();
        }
    }
}