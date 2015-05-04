using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaCodigoPTTA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            onLoadData();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sCodigoPPTA_Load()
        {

            string strcookieEditarCodigoPPTA = Cookies.GetCookie("cookieEditarCodigoPPTA").Value;
            onLoadData();
            if (!strcookieEditarCodigoPPTA.Equals("Nuevo"))
            {
                CodigoFalla oCodigoPPTA = CodigoFallasBusiness.ObtenerCodigoFallaPorID(strcookieEditarCodigoPPTA);
                sCodigoPPTA.Add(new
                {
                    ID = oCodigoPPTA.ID,
                    Especialidad = oCodigoPPTA.Especialidad,
                    Familia = oCodigoPPTA.Familia,
                    SubEspecialidad = oCodigoPPTA.Subespecialidad,
                    REspecialidad = oCodigoPPTA.REspecialidad,
                    RFamilia = oCodigoPPTA.RFamilias,
                    RSubespecialidad = oCodigoPPTA.RSubespecialidad,
                    CodigoMainSaver = oCodigoPPTA.CodigoMainSaver,
                    Descripcion = oCodigoPPTA.Descripcion,
                    Dias = oCodigoPPTA.Dias,
                    Prioridad = oCodigoPPTA.Prioridad,
                    TiempoEstimado = oCodigoPPTA.TiempoEstimado 
                }); 
            }
        }
        #region Guardar

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRegistro = e.ExtraParams["registro"];

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            CodigoFalla cf = new CodigoFalla();
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    case "txtID":
                        cf.ID = sd.Value;
                        break;

                    case "cmbEspecialidad":
                        cf.Especialidad = sd.Value;
                        break;

                    case "cmbFamilia":
                        cf.Familia = sd.Value;
                        break;

                    case "cmbSubEspecialidad":
                        cf.Subespecialidad = sd.Value;
                        break;

                    case "txtCodigoMainSaver":
                        cf.CodigoMainSaver = sd.Value;
                        break;

                    case "txtDescripcion":
                        cf.Descripcion = sd.Value;
                        break;

                    case "txtDias":
                        cf.Dias = sd.Value;
                        break;

                    case "txtPrioridad":
                        cf.Prioridad = sd.Value;
                        break;

                    case "txtTiempoEstimado":
                        cf.TiempoEstimado = sd.Value;
                        break;
                }
            }
            string strcookieEditarCodigoPPTA = Cookies.GetCookie("cookieEditarCodigoPPTA").Value;
            if (strcookieEditarCodigoPPTA.Equals("Nuevo"))
            {
                //3. Insertar en la base de datos
                cf.ID = CodigoFallasBusiness.Insertar(cf);
                //4. Mandar mensaje con el código del codigo ppta
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cf.ID, ParameterMode.Value));
            }
            else
            {
                CodigoFallasBusiness.Actualizar(cf);
                cf.ID = strcookieEditarCodigoPPTA;
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cf.ID, ParameterMode.Value));
            }
        }

        #endregion

        #region Consultar
        public void onLoadData() {
            sEspecialidad.DataSource = EspecialidadesBusiness.ObtenerEspecialidades();
            sEspecialidad.DataBind();  
        }


        /// <summary>
        /// Evento que se lanza al seleccionar una Especialidad
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEspecialidad_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado
            string strEspecialidad = e.ExtraParams["vEspecialidad"];
            sFamilias.DataSource = FamiliasBusiness.ObtenerFamiliasPorEspecialidad(strEspecialidad);
            sFamilias.DataBind();
        }
        /// <summary>
        /// Evento que se lanza al seleccionar una Familia
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbFamilia_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado 
            string strFamilia = e.ExtraParams["vFamilia"];
            sSubEspecialidad.DataSource = SubEspecialidadesBusiness.ObtenerSubEspecialidadesPorFamilia(strFamilia);
            sSubEspecialidad.DataBind();
        }
        #endregion
    }
}