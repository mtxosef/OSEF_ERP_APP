﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class PreciarioConceptoBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="iPreciarioConcepto"></param>
        public static int Insertar(PreciarioConcepto iPreciarioConcepto)
        {
            return PreciarioConceptosDataAccess.Insertar(iPreciarioConcepto);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="uPreciarioConcepto"></param>
        /// <returns></returns>
        public static int Actualizar(PreciarioConcepto uPreciarioConcepto)
        {
            return PreciarioConceptosDataAccess.Actualizar(uPreciarioConcepto);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioConcepto por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioConceptosDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de PreciarioConcepto
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciarioConcepto()
        {
            return PreciarioConceptosDataAccess.ObtenerPreciarioConcepto();
        }

        /// <summary>
        /// Obtener un registro de PreciarioConcepto por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciariConceptoPorPreciario(string strPreciario)
        {

            //1. Obtener lista de conceptos
            List<PreciarioConcepto> lPreciarioConcepto = PreciarioConceptosDataAccess.ObtenerPreciarioConceptoPorPreciario(strPreciario);
            //2. Asignar a cada Colonia su correspondiente municipio
            foreach (PreciarioConcepto sd in lPreciarioConcepto)
                sd.RCategoria = PreciarioCategoriaBuisness.ObtenerPreciarioCategoriaPorID(sd.Categoria);

            foreach (PreciarioConcepto sd in lPreciarioConcepto)
                sd.RSubcategoria = PreciarioSubCategoriaBusiness.ObtenerPreciarioSubCategoriaPorID(sd.SubCategoria);

            foreach (PreciarioConcepto sd in lPreciarioConcepto)
                sd.RSubsubcategoria = PreciarioSubSubCategoriaBusiness.ObtenerPreciarioSubSubCategoriaPorID(sd.SubSubCategoria);

            return lPreciarioConcepto;

        }

        #endregion
    }
}
