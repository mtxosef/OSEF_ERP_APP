using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaBuscaPreciarioConcepto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //1. Primer solicitud
            if (!X.IsAjaxRequest)
            {

                string preciario = Session["imprimir"].ToString();
                ////2. Cargar Conceptos
                sCategoria.DataSource = PreciarioCategoriaBuisness.ObtenerPreciarioCategoriasPorPreciario(preciario);
                sCategoria.DataBind();



            }
        }


        /// <summary>
        /// Evento que se lanza al escoger una categoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbCategoria_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el estado seleccionado y obtener los Municipios
            string strCategoria = e.ExtraParams["categoria"];
            sSubCategoria.DataSource = PreciarioSubCategoriaBusiness.ObtenerPreciarioSubCategoriaPorCategoria(strCategoria);
            sSubCategoria.DataBind();
        }


        /// <summary>
        /// Evento que se lanza al seleccionar una subcategoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbSubCategoria_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado 
            string strSubCategoria = e.ExtraParams["subcategoria"];
            sSubSubCategorias.DataSource = PreciarioSubSubCategoriaBusiness.ObtenerPreciarioSubSubCategoriaPorSubCategoria(strSubCategoria);
            sSubSubCategorias.DataBind();
        }


        /// <summary>
        /// Evento que se lanza al seleccionar una subbsubcategoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbSubSubCategoria_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado 
            string strCategoria = e.ExtraParams["categoria"];
            string strSubCategoria = e.ExtraParams["subcategoria"];
            string strSubSubCategoria = e.ExtraParams["subsubcategoria"];

            sConceptosFiltrados.DataSource = PreciarioConceptoBusiness.ObtenerPreciarioConceptoFiltro(strCategoria, strSubCategoria, strSubSubCategoria);
            sConceptosFiltrados.DataBind();
        }
    }
}