﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que controla todas la acciones de PreciarioGeneralCategoria
    /// </summary>
    public class PreciarioGeneralCategoriaBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioGeneralCategoria
        /// </summary>
        /// <param name="iPreciarioCategoria"></param>
        public static string Insertar(PreciarioGeneralCategoria iPreciarioCategoria)
        {
            return PreciarioGeneralCategoriaDataAccess.Insertar(iPreciarioCategoria);
        }

        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioGeneralCategoria por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioGeneralCategoriaDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener un registro de PreciarioGeneralCategoria por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneralCategoria ObtenerPreciarioGeneralCategoriaPorID(string strID)
        {
            return PreciarioGeneralCategoriaDataAccess.ObtenerPreciarioGeneralCategoriaPorID(strID);
        }

        #endregion

    }
}
