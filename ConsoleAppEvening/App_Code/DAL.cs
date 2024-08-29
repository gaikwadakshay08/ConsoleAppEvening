using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;


public class DAL
{

    public bool IsProcedureCall = false;
    private List<SqlParameter> paralist = new List<SqlParameter>();


    private SqlConnection GetConnection()
    {
        string ConnectionString = ConfigurationManager.AppSettings["SqlConnectionString"];
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConnectionString;
        return connection;
    }

    public void ClearParameters()
    {
        paralist.Clear();
    }

    public void AddParameter(string ParameterName, string Value)
    {
        paralist.Add(new SqlParameter(ParameterName, Value));
    }

    private SqlCommand GetCommand(string Query)
    {
        SqlCommand cmd = new SqlCommand();
        if (IsProcedureCall)
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(paralist.ToArray());
        }
        else
            cmd.CommandType = CommandType.Text;

        cmd.CommandText = Query;
        cmd.Connection = GetConnection();
        return cmd;
    }

    public DataSet GetTables(string Query)
    {
        SqlDataAdapter da = new SqlDataAdapter(GetCommand(Query));
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }


    public DataTable GetTable(string Query)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = GetCommand(Query);
        cmd.Connection.Open();

        SqlDataReader rdr = cmd.ExecuteReader();

        if (rdr != null && rdr.HasRows)
            dt.Load(rdr);

        cmd.Connection.Close();
        return dt;

    }

    public SqlDataReader GetReader(string Query)
    {
        SqlCommand cmd = GetCommand(Query);
        cmd.Connection.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        
        return rdr;

    }

    public object GetID(string Query)
    {
        SqlCommand cmd = GetCommand(Query);
        cmd.Connection.Open();
        object ReturnValue = cmd.ExecuteScalar();
        cmd.Connection.Close();
        return ReturnValue;

    }

    public int ExecuteQuery(string Query)
    {
        SqlCommand cmd = GetCommand(Query);
        cmd.Connection.Open();
       int ReturnValue = cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        return ReturnValue;

    }
}