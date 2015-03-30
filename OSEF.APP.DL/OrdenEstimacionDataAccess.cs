﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de OrdenEstimacion
    /// </summary>
    public class OrdenEstimacionDataAccess
    {
        #region insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de OrdenEstimacion
        /// </summary>
        /// <param name="iVolumetria"></param>
        public static int Insertar(OrdenEstimacion iOrdenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarOrdenEstimacion";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = iOrdenEstimacion.Mov;

                SqlParameter sqlpMovID = new SqlParameter();
                sqlpMovID.ParameterName = "@MovID";
                sqlpMovID.SqlDbType = SqlDbType.VarChar;
                if (iOrdenEstimacion.MovID == null)
                    sqlpMovID.Value = DBNull.Value;
                else
                    sqlpMovID.Value = iOrdenEstimacion.MovID;

                SqlParameter sqlpSucursal = new SqlParameter();
                sqlpSucursal.ParameterName = "@Sucursal";
                sqlpSucursal.SqlDbType = SqlDbType.Char;
                sqlpSucursal.Size = 10;
                sqlpSucursal.Value = iOrdenEstimacion.Sucursal;

                SqlParameter sqlpFechaEmision = new SqlParameter();
                sqlpFechaEmision.ParameterName = "@FechaEmision";
                sqlpFechaEmision.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaEmision.Value = iOrdenEstimacion.FechaEmision;

                SqlParameter sqlpObservaciones = new SqlParameter();
                sqlpObservaciones.ParameterName = "@Observaciones";
                sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
                sqlpObservaciones.Value = iOrdenEstimacion.Observaciones;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iOrdenEstimacion.Estatus;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iOrdenEstimacion.Usuario;

                SqlParameter sqlpOrigen = new SqlParameter();
                sqlpOrigen.ParameterName = "@Origen";
                sqlpOrigen.SqlDbType = SqlDbType.VarChar;

                if (iOrdenEstimacion.Origen == null)
                    sqlpOrigen.Value = DBNull.Value;
                else
                    sqlpOrigen.Value = iOrdenEstimacion.Origen;

                SqlParameter sqlpOrigenID = new SqlParameter();
                sqlpOrigenID.ParameterName = "@OrigenID";
                sqlpOrigenID.SqlDbType = SqlDbType.VarChar;

                if (iOrdenEstimacion.OrigenId == null)
                    sqlpOrigenID.Value = DBNull.Value;
                else
                    sqlpOrigenID.Value = iOrdenEstimacion.OrigenId;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpMov);
                sqlcComando.Parameters.Add(sqlpMovID);
                sqlcComando.Parameters.Add(sqlpSucursal);
                sqlcComando.Parameters.Add(sqlpFechaEmision);
                sqlcComando.Parameters.Add(sqlpObservaciones);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpUsuario);
                sqlcComando.Parameters.Add(sqlpOrigen);
                sqlcComando.Parameters.Add(sqlpOrigenID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return Convert.ToInt32(sqlcComando.Parameters["@ID"].Value);
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(OrdenEstimacion " + iOrdenEstimacion.Mov + ")): " + ex.Message);
            }
        }

        #endregion

        #region modificar
        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de OrdenEstimacion
        /// </summary>
        /// <param name="uVolumetria"></param>
        public static int Actualizar(OrdenEstimacion uOrdenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarOrdenEstimacion";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = uOrdenEstimacion.Id;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = uOrdenEstimacion.Mov;

                SqlParameter sqlpMovID = new SqlParameter();
                sqlpMovID.ParameterName = "@MovID";
                sqlpMovID.SqlDbType = SqlDbType.VarChar;
                if (uOrdenEstimacion.MovID == null)
                    sqlpMovID.Value = DBNull.Value;
                else
                    sqlpMovID.Value = uOrdenEstimacion.MovID;

                SqlParameter sqlpSucursal = new SqlParameter();
                sqlpSucursal.ParameterName = "@Sucursal";
                sqlpSucursal.SqlDbType = SqlDbType.VarChar;
                sqlpSucursal.Value = uOrdenEstimacion.Sucursal;

                SqlParameter sqlpObservaciones = new SqlParameter();
                sqlpObservaciones.ParameterName = "@Observaciones";
                sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
                sqlpObservaciones.Value = uOrdenEstimacion.Observaciones;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uOrdenEstimacion.Estatus;

                SqlParameter sqlpOrigen = new SqlParameter();
                sqlpOrigen.ParameterName = "@Origen";
                sqlpOrigen.SqlDbType = SqlDbType.VarChar;

                if (uOrdenEstimacion.Origen == null)
                    sqlpOrigen.Value = DBNull.Value;
                else
                    sqlpOrigen.Value = uOrdenEstimacion.Origen;


                SqlParameter sqlpOrigenID = new SqlParameter();
                sqlpOrigenID.ParameterName = "@OrigenID";
                sqlpOrigenID.SqlDbType = SqlDbType.VarChar;

                if (uOrdenEstimacion.OrigenId == null)
                    sqlpOrigenID.Value = DBNull.Value;
                else
                    sqlpOrigenID.Value = uOrdenEstimacion.OrigenId;
              


                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpMov);
                sqlcComando.Parameters.Add(sqlpMovID);
                sqlcComando.Parameters.Add(sqlpSucursal);
                sqlcComando.Parameters.Add(sqlpObservaciones);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpOrigen);
                sqlcComando.Parameters.Add(sqlpOrigenID);
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
                throw new Exception("Error capa de datos (public static int Actualizar(OrdenEstimacion " + uOrdenEstimacion.Id + ")): " + ex.Message);
            }
        }
        #endregion

        #region borrar

        /// <summary>
        /// Método que borrar alguna OrdenEstimacion por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(int dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarOrdenEstimacion";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = dID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción DELETE que no regresa filas
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Borrar(OrdenEstimacion " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region consultar

        /// <summary>
        /// Obtener todos los registros de OrdenesEstimaciones
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerOrdenesEstimaciones()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerOrdenesEstimaciones";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<OrdenEstimacion> result = LibraryGenerics<OrdenEstimacion>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<OrdenEstimacion> ObtenerOrdenesEstimaciones()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de OrdenEstimacion por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static OrdenEstimacion ObtenerOrdenEstimacionaPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerOrdenEstimacionPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                OrdenEstimacion result = LibraryGenerics<OrdenEstimacion>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static OrdenEstimacion ObtenerOrdenEstimacionaPorID(int " + iID + ")): " + ex.Message);
            }
        }
        #endregion

        #region Acciones

        /// <summary>
        /// Método que Afecta un registro de OrdenEstimacion
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarOrdenPorID(OrdenEstimacion aOrdenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AfectarOrdenPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = aOrdenEstimacion.Id;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

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
                throw new Exception("Error capa de datos (public static int AfectarOrdenPorID(OrdenEstimacion " + aOrdenEstimacion + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que Afecta un registro de OrdenEstimacion
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarEstimacionPorID(OrdenEstimacion aOrdenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AfectarEstimacionPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = aOrdenEstimacion.Id;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

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
                throw new Exception("Error capa de datos (public static int AfectarEstimacionPorID(OrdenEstimacion " + aOrdenEstimacion + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Método que avanza un movimiento de OrdenEstimacion
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int AvanzarReportePorID(int iID, string strMov)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AvanzarMesaReportePorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iID;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = strMov;

                SqlParameter sqlpIDNuevo = new SqlParameter();
                sqlpIDNuevo.ParameterName = "@IDNuevo";
                sqlpIDNuevo.SqlDbType = SqlDbType.Int;
                sqlpIDNuevo.Direction = ParameterDirection.Output;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpMov);
                sqlcComando.Parameters.Add(sqlpIDNuevo);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SCALAR que regresa un valor
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return Convert.ToInt32(sqlcComando.Parameters["@IDNuevo"].Value);
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int AvanzarReportePorID(int " + iID + ", string " + strMov + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que cancela un movimiento de OrdenEstimacion
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int CancelarOrdenEstimacionPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_CancelarOrdenEstimacionPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iID;


                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SCALAR que regresa un valor
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return Convert.ToInt32(sqlcComando.Parameters["@ID"].Value);
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int CancelarOrdenEstimacionPorID(int " + iID + ")): " + ex.Message);
            }
        }

        #endregion

    }
}