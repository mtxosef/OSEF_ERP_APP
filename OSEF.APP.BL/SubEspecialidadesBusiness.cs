using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class SubEspecialidadesBusiness
    {
        #region Consultar
        public static List<SubEspecialidades> ObtenerSubEspecialidades()
        {
            return SubEspecialidadesDataAccess.ObtenerSubEspecialidades();
        }
        public static List<SubEspecialidades> ObtenerSubEspecialidadesPorFamilia(string ID)
        {
            return SubEspecialidadesDataAccess.ObtenerSubEspecialidadesPorFamilia(ID);
        }
        public static SubEspecialidades ObtenerSubEspecialidadesPorID(string ID)
        {
            return SubEspecialidadesDataAccess.ObtenerSubEspecialidadesPorID(ID);
        }
        #endregion
         
        #region Insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de SubEspecialidades
        /// </summary>
        /// <param name="iSubEspecialidades"></param>
        public static string Insertar(SubEspecialidades iSubEspecialidades)
        {
            return SubEspecialidadesDataAccess.Insertar(iSubEspecialidades);
        }
        #endregion

        #region Modificar
        /// <summary>
        /// Método que actualiza alguna subespecialidad por su ID
        /// </summary>
        /// <param name="ID"></param>
        public static int Actualizar(SubEspecialidades fam)
        {
            return SubEspecialidadesDataAccess.Actualizar(fam);
        }

        #endregion
    }
}
