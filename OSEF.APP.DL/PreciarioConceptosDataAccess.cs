﻿using System;
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
    public class PreciarioConceptosDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="iPreciarioConcepto"></param>
        public static int Insertar(PreciarioConcepto iPreciarioConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarPreciarioConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Direction = ParameterDirection.Output;

                //2. Declarar los parametros
                SqlParameter sqlpClave = new SqlParameter();
                sqlpClave.ParameterName = "@Clave";
                sqlpClave.SqlDbType = SqlDbType.Char;
                sqlpClave.Size = 7;
                sqlpClave.Value = iPreciarioConcepto.Clave;

                SqlParameter sqlpPreciario = new SqlParameter();
                sqlpPreciario.ParameterName = "@Preciario";
                sqlpPreciario.SqlDbType = SqlDbType.VarChar;
                sqlpPreciario.Value = iPreciarioConcepto.Preciario;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = iPreciarioConcepto.Descripcion;

                SqlParameter sqlpCategoria = new SqlParameter();
                sqlpCategoria.ParameterName = "@Categoria";
                sqlpCategoria.SqlDbType = SqlDbType.Char;
                sqlpCategoria.Size = 10;
                sqlpCategoria.Value = iPreciarioConcepto.Categoria;

                SqlParameter sqlpSubCategoria = new SqlParameter();
                sqlpSubCategoria.ParameterName = "@SubCategoria";
                sqlpSubCategoria.SqlDbType = SqlDbType.Char;
                sqlpSubCategoria.Size = 10;
                sqlpSubCategoria.Value = iPreciarioConcepto.SubCategoria;

                SqlParameter sqlpSubSubCategoria = new SqlParameter();
                sqlpSubSubCategoria.ParameterName = "@SubSubCategoria";
                sqlpSubSubCategoria.SqlDbType = SqlDbType.Char;
                sqlpSubSubCategoria.Size = 10;
                sqlpSubSubCategoria.Value = iPreciarioConcepto.SubSubCategoria;

                SqlParameter sqlpUnidad = new SqlParameter();
                sqlpUnidad.ParameterName = "@Unidad";
                sqlpUnidad.SqlDbType = SqlDbType.VarChar;
                sqlpUnidad.Value = iPreciarioConcepto.Unidad;

                SqlParameter sqlpCosto = new SqlParameter();
                sqlpCosto.ParameterName = "@Costo";
                sqlpCosto.SqlDbType = SqlDbType.Decimal;
                sqlpCosto.Value = iPreciarioConcepto.Costo;

                SqlParameter sqlpCantidad = new SqlParameter();
                sqlpCantidad.ParameterName = "@Cantidad";
                sqlpCantidad.SqlDbType = SqlDbType.Decimal;
                sqlpCantidad.Value = iPreciarioConcepto.Cantidad;

                SqlParameter sqlpImporte = new SqlParameter();
                sqlpImporte.ParameterName = "@Importe";
                sqlpImporte.SqlDbType = SqlDbType.Decimal;
                sqlpImporte.Value = iPreciarioConcepto.Importe;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iPreciarioConcepto.Estatus;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iPreciarioConcepto.FechaAlta;


                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpClave);
                sqlcComando.Parameters.Add(sqlpPreciario);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpCategoria);
                sqlcComando.Parameters.Add(sqlpSubCategoria);
                sqlcComando.Parameters.Add(sqlpSubSubCategoria);
                sqlcComando.Parameters.Add(sqlpUnidad);
                sqlcComando.Parameters.Add(sqlpCosto);
                sqlcComando.Parameters.Add(sqlpCantidad);
                sqlcComando.Parameters.Add(sqlpImporte);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(PreciarioConcepto " + iPreciarioConcepto.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="uPreciarioConcepto"></param>
        public static int Actualizar(PreciarioConcepto uPreciarioConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarPreciarioConcepto";


                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Value = uPreciarioConcepto.ID;

                SqlParameter sqlpPreciario = new SqlParameter();
                sqlpPreciario.ParameterName = "@Preciario";
                sqlpPreciario.SqlDbType = SqlDbType.VarChar;
                sqlpPreciario.Value = uPreciarioConcepto.Descripcion;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = uPreciarioConcepto.Descripcion;

                SqlParameter sqlpCategoria = new SqlParameter();
                sqlpCategoria.ParameterName = "@Categoria";
                sqlpCategoria.SqlDbType = SqlDbType.VarChar;
                sqlpCategoria.Value = uPreciarioConcepto.Categoria;

                SqlParameter sqlpSubCategoria = new SqlParameter();
                sqlpSubCategoria.ParameterName = "@SubCategoria";
                sqlpSubCategoria.SqlDbType = SqlDbType.VarChar;
                sqlpSubCategoria.Value = uPreciarioConcepto.SubCategoria;

                SqlParameter sqlpSubSubCategoria = new SqlParameter();
                sqlpSubSubCategoria.ParameterName = "@SubSubCategoria";
                sqlpSubSubCategoria.SqlDbType = SqlDbType.VarChar;
                sqlpSubSubCategoria.Value = uPreciarioConcepto.SubSubCategoria;

                SqlParameter sqlpUnidad = new SqlParameter();
                sqlpUnidad.ParameterName = "@Unidad";
                sqlpUnidad.SqlDbType = SqlDbType.VarChar;
                sqlpUnidad.Value = uPreciarioConcepto.Unidad;

                SqlParameter sqlpCosto = new SqlParameter();
                sqlpCosto.ParameterName = "@Costo";
                sqlpCosto.SqlDbType = SqlDbType.Decimal;
                sqlpCosto.Value = uPreciarioConcepto.Costo;

                SqlParameter sqlpCantidad = new SqlParameter();
                sqlpCantidad.ParameterName = "@Cantidad";
                sqlpCantidad.SqlDbType = SqlDbType.Decimal;
                sqlpCantidad.Value = uPreciarioConcepto.Cantidad;

                SqlParameter sqlpImporte = new SqlParameter();
                sqlpImporte.ParameterName = "@Importe";
                sqlpImporte.SqlDbType = SqlDbType.Decimal;
                sqlpImporte.Value = uPreciarioConcepto.Importe;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uPreciarioConcepto.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpPreciario);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpCategoria);
                sqlcComando.Parameters.Add(sqlpSubCategoria);
                sqlcComando.Parameters.Add(sqlpSubSubCategoria);
                sqlcComando.Parameters.Add(sqlpUnidad);
                sqlcComando.Parameters.Add(sqlpCosto);
                sqlcComando.Parameters.Add(sqlpCantidad);
                sqlcComando.Parameters.Add(sqlpImporte);
                sqlcComando.Parameters.Add(sqlpEstatus);

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
                throw new Exception("Error capa de datos (public static int Actualizar(PreciarioConcepto " + uPreciarioConcepto.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioConcepto por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarPreciarioConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpPreciario = new SqlParameter();
                sqlpPreciario.ParameterName = "@Preciario";
                sqlpPreciario.SqlDbType = SqlDbType.VarChar;
                sqlpPreciario.Value = dID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpPreciario);

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
                throw new Exception("Error capa de datos (public static int Borrar(PreciarioConcepto " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de PreciarioConcepto
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciarioConcepto()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioConcepto";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<PreciarioConcepto> result = LibraryGenerics<PreciarioConcepto>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<PreciarioConcepto> ObtenerPreciarioConcepto()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de PreciarioSubSubCategoria por su Preciario
        /// </summary>
        /// <param name="strPreciario"></param>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciarioConceptoPorPreciario(string strPreciario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioConceptoPorPreciario";

                //2. Declarar los parametros
                SqlParameter sqlpPreciario = new SqlParameter();
                sqlpPreciario.ParameterName = "@Preciario";
                sqlpPreciario.SqlDbType = SqlDbType.VarChar;
                sqlpPreciario.Value = strPreciario;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpPreciario);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista 
                List<PreciarioConcepto> result = LibraryGenerics<PreciarioConcepto>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static PreciarioConcepto ObtenerPreciarioConceptoPorPreciario(string " + strPreciario + ")): " + ex.Message);
            }
        }


        #endregion
    }
}
