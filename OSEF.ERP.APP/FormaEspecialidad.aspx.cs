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
    public partial class FormaEspecialidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cookieNuevaEspecialidad = Cookies.GetCookie("cookieNuevaEspecialidad").Value;
            if (!cookieNuevaEspecialidad.Equals("Nuevo"))
            {
                Especialidades espe = EspecialidadesBusiness.ObtenerEspecialidadesPorID(cookieNuevaEspecialidad);
                txtID.SetValue(espe.ID);
                txtNombre.SetValue(espe.Nombre);
                FieldContainer1.Hidden = false;
            }
            else { 
                FieldContainer1.Hidden = true;
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
            Especialidades espe = new Especialidades();
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    case "txtID":
                        espe.ID = sd.Value;
                        break;

                    case "txtNombre":
                        espe.Nombre = sd.Value;
                        break; 
                }
            }
            string strcookieEditarCodigoPPTA = Cookies.GetCookie("cookieNuevaEspecialidad").Value;
            if (strcookieEditarCodigoPPTA.Equals("Nuevo"))
            {
                //3. Insertar en la base de datos
                espe.ID = EspecialidadesBusiness.Insertar(espe);
                //4. Mandar mensaje con el código del codigo ppta
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", espe.ID, ParameterMode.Value));
            }
            else
            {
                EspecialidadesBusiness.Actualizar(espe);
                espe.ID = strcookieEditarCodigoPPTA;
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", espe.ID, ParameterMode.Value));
            }
        }
        #endregion
    }
}