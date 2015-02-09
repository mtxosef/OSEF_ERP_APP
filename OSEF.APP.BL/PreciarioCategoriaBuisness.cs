﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class PreciarioCategoriaBuisness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioCategoria
        /// </summary>
        /// <param name="iPreciarioCategoria"></param>
        public static string Insertar(PreciarioCategoria iPreciarioCategoria)
        {
            return PreciarioCategoriaDataAccess.Insertar(iPreciarioCategoria);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de PreciariosCategoria
        /// </summary>
        /// <param name="uPreciarioCategoria"></param>
        /// <returns></returns>
        public static int Actualizar(PreciarioCategoria uPreciarioCategoria)
        {
            return PreciarioCategoriaDataAccess.Actualizar(uPreciarioCategoria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioCategoria por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioCategoriaDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de PreciarioCategoria
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioCategoria> ObtenerPreciariosCategoria()
        {
            return PreciarioCategoriaDataAccess.ObtenerPreciarioCategoria();
        }

        /// <summary>
        /// Obtener un registro de PreciarioCategoria por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioCategoria ObtenerPreciarioCategoriaPorID(string strID)
        {
            return PreciarioCategoriaDataAccess.ObtenerPreciarioCategroiaPorID(strID);
        }

        #endregion
    }
}
