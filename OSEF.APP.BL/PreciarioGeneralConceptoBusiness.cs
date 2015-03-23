using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class PreciarioGeneralConceptoBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="iPreciarioConcepto"></param>
        public static int Insertar(PreciarioGeneralConcepto iPreciarioConcepto)
        {
            return PreciarioGeneralConceptoDataAccess.Insertar(iPreciarioConcepto);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioGeneralConcepto por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioGeneralConceptoDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener un registro de PreciarioConcepto por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static List<PreciarioGeneralConcepto> ObtenerPreciarioGeneralConceptoPorPreciario(string strPreciario)
        {

            //1. Obtener lista de conceptos
            List<PreciarioGeneralConcepto> lPreciarioConcepto = PreciarioGeneralConceptoDataAccess.ObtenerPreciarioGeneralConceptoPorPreciario(strPreciario);
            //2. Asignar a cada Colonia su correspondiente municipio
            foreach (PreciarioGeneralConcepto sd in lPreciarioConcepto)
            {
                sd.RCategoria = PreciarioGeneralCategoriaBusiness.ObtenerPreciarioGeneralCategoriaPorID(sd.Categoria);

                sd.RSubcategoria = PreciarioGeneralSubCategoriaBusiness.ObtenerPreciarioGeneralSubCategoriaPorID(sd.SubCategoria);

                sd.RSubsubcategoria = PreciarioGeneralSubSubCategoriaBusiness.ObtenerPreciarioGeneralSubSubCategoriaPorID(sd.SubSubCategoria);
            }
            return lPreciarioConcepto;

        }

        #endregion

    }
}
