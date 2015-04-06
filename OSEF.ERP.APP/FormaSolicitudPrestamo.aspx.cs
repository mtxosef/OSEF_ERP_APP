using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;

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
            //sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            //sMunicipios.DataBind();
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
            //sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            //sColonias.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Municipios
        /// </summary>
        [DirectMethod]
        public void AsignarMunicipio(string strEstado)
        {
            //sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            //sMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Colonias
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarColonia(string strMunicipio)
        {
            //sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            //sColonias.DataBind();
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
            //sMunicipiosAnterior.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            //sMunicipiosAnterior.DataBind();
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
            //sColoniasAnterior.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            //sColoniasAnterior.DataBind();
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
            //sEmpresaMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            //sEmpresaMunicipios.DataBind();
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
            //sEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            //sEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Empresa Municipios
        /// </summary>
        [DirectMethod]
        public void AsignarEmpresaMunicipio(string strEstado)
        {
            //sEmpresaMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            //sEmpresaMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Empresa Colonia
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarEmpresaColonia(string strMunicipio)
        {
            //sEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            //sEmpresaColonia.DataBind();
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
            //sConyugeMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            //sConyugeMunicipio.DataBind();
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
            //sConyugeColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            //sConyugeColonia.DataBind();
        }
    }
}