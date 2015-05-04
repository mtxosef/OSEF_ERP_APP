using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class FamiliasBusiness
    {
        #region Consultar
        public static List<Familias> ObtenerFamilias()
        {
            return FamiliasDataAccess.ObtenerFamilias();
        }
        public static List<Familias> ObtenerFamiliasPorEspecialidad(string ID)
        {
            return FamiliasDataAccess.ObtenerFamiliasPorEspecialidad(ID);
        }
        public static Familias ObtenerFamiliasPorID(string ID)
        {
            return FamiliasDataAccess.ObtenerFamiliasPorID(ID);
        }

        #endregion

        #region Insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Especialidades
        /// </summary>
        /// <param name="iEspecialidades"></param>
        public static string Insertar(Familias iFamilias)
        {
            return FamiliasDataAccess.Insertar(iFamilias);
        }
        #endregion 
         
        #region Modificar
        /// <summary>
        /// Método que actualiza alguna especialidad por su ID
        /// </summary>
        /// <param name="ID"></param>
        public static int Actualizar(Familias fam)
        {
            return FamiliasDataAccess.Actualizar(fam);
        }

        #endregion
    }
}
