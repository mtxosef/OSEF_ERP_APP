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
<<<<<<< HEAD
                sEspecialidad.DataSource = CodigoFallasBusiness.ObtenerCodigoFallas();
                sEspecialidad.DataBind();
=======
            sEspecialidad.DataSource = EspecialidadesBusiness.ObtenerEspecialidades();
            sEspecialidad.DataBind(); 
>>>>>>> origin/master
        }

        #region Insertar

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
                }
            }
            string strcookieEditarCuadrilla = Cookies.GetCookie("cookieEditarCodigoPPTA").Value;
            if (strcookieEditarCuadrilla.Equals("Nuevo"))
            {
                //3. Insertar en la base de datos
                cf.ID = CodigoFallasBusiness.Insertar(cf);
                //4. Mandar mensaje con el código de la cuadrilla
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cf.ID, ParameterMode.Value));
            }
            else
            {
                CodigoFallasBusiness.Actualizar(cf);
                cf.ID = strcookieEditarCuadrilla;
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cf.ID, ParameterMode.Value));
            }
        }
        #endregion

    }
}