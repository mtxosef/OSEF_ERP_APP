using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using OSEF.APP.EL;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    public class EspecialidadesDataAccess
    {
        #region Consultar

        public static List<Especialidades> ObtenerEspecialidades()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerEspecialidades";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Especialidades
                List<Especialidades> result = LibraryGenerics<Especialidades>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Especialidades> ObtenerEspecialidades()): " + ex.Message);
            }
        }


        public static Especialidades ObtenerEspecialidadesPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerEspecialidadesPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Especialidades
                Especialidades result = LibraryGenerics<Especialidades>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Especialidades ObtenerEspecialidadesPorID(string " + strID + ")): " + ex.Message);
            }
        }

        #endregion
         
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de xxxxx
        /// </summary>
        /// <param name="iEspecialidades"></param>
        public static string Insertar(Especialidades iEspecialidades)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarEspecialidades";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = iEspecialidades.ID;
                sqlpID.Size = 10;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.Char;
                sqlpNombre.Value = iEspecialidades.Nombre;
               
                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre); 

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return sqlcComando.Parameters["@ID"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(Especialidades " + iEspecialidades.ID + ")): " + ex.Message);
            }
        }

        #endregion
         
        #region Actualizar

        /// <summary>
        /// Método que modifica un registro a la tabla de xxxxx
        /// </summary>
        /// <param name="iEspecialidades"></param>
        public static int Actualizar(Especialidades iEspecialidades)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarEspecialidades";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = iEspecialidades.ID;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.Char;
                sqlpNombre.Value = iEspecialidades.Nombre;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre); 

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción UPDATE que no regresa filas
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Actualizar(Especialidades " + iEspecialidades.ID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
