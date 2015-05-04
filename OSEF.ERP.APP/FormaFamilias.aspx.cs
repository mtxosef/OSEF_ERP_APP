﻿using System;
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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cookieNuevaFamilia = Cookies.GetCookie("cookieNuevaFamilia").Value;
            if (!cookieNuevaFamilia.Equals("Nuevo"))
            {
                Familias espe = FamiliasBusiness.ObtenerFamiliasPorID(cookieNuevaFamilia);
                txtID.SetValue(espe.ID);
                txtNombre.SetValue(espe.Nombre); 
                cmbEspecialidad.SelectedItem.Text = EspecialidadesBusiness.ObtenerEspecialidadesPorID(espe.REspecialidad.ID).Nombre;
                FieldContainer1.Hidden = false;
            }
            else {
                FieldContainer1.Hidden = true;
            }
            sEspecialidad.DataSource = EspecialidadesBusiness.ObtenerEspecialidades();
            sEspecialidad.DataBind();
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
            Familias f = new Familias();
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    case "txtID":
                        f.ID = sd.Value;
                        break;

                    case "txtNombre":
                        f.Nombre = sd.Value;
                        break;
                    case "cmbEspecialidad":
                        f.Especialidad = sd.Value;
                        break;

                }
            }
            string cookieNuevaFamilia = Cookies.GetCookie("cookieNuevaFamilia").Value;
            if (cookieNuevaFamilia.Equals("Nuevo"))
            {
                //3. Insertar en la base de datos
                f.ID = FamiliasBusiness.Insertar(f);
                //4. Mandar mensaje con el código del codigo ppta
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", f.ID, ParameterMode.Value));
            }
            else
            {
                FamiliasBusiness.Actualizar(f);
                f.ID = cookieNuevaFamilia;
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", f.ID, ParameterMode.Value));
            }
        }
        #endregion

    }
}