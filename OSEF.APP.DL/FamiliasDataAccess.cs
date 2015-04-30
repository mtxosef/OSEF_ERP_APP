using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    public class FamiliasDataAccess
    {
        #region Consultar
        public static List<Familias> ObtenerFamilias()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerFamilias";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Especialidades
                List<Familias> result = LibraryGenerics<Familias>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Familias> ObtenerFamilias()): " + ex.Message);
            }
        }
        public static Familias ObtenerFamiliasPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerFamiliasPorID";

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
                Familias result = LibraryGenerics<Familias>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Familias ObtenerFamiliasPorID(string " + strID + ")): " + ex.Message);
            }
        }

        #endregion
         
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de xxxxx
        /// </summary>
        /// <param name="iFamilias"></param>
        public static string Insertar(Familias iFamilias)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarFamilias";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = iFamilias.ID;
                sqlpID.Size = 10;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.Char;
                sqlpNombre.Value = iFamilias.Nombre;

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
                throw new Exception("Error capa de datos (public static int Insertar(Especialidades " + iFamilias.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Actualizar

        /// <summary>
        /// Método que modifica un registro a la tabla de xxxxx
        /// </summary>
        /// <param name="iFamilias"></param>
        public static int Actualizar(Familias iFamilias)
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
                sqlpID.Value = iFamilias.ID;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.Char;
                sqlpNombre.Value = iFamilias.Nombre;

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
                throw new Exception("Error capa de datos (public static int Actualizar(Familias " + iFamilias.ID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
