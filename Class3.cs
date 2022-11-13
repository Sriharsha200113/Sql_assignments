using System.Data.SqlClient;

namespace Day5_Q4
{
    internal class Class3
    {
        static void Main(string[] args)
        {
            try
            {
                string ConnectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                SqlConnection sqlCon = new SqlConnection(ConnectionString);
                sqlCon.Open();

                Console.WriteLine("Enter the Name:");
                string name = Console.ReadLine();



                SqlCommand cmd = new SqlCommand("p2", sqlCon);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("@d_s_name", System.Data.SqlDbType.VarChar).Value = name;

                SqlDataReader reader = cmd.ExecuteReader();

                Console.WriteLine();


                while (reader.Read())
                {

                    Console.Write("\n" + reader[0] + "  ");
                    Console.Write(reader[1] + "  ");
                    Console.WriteLine();

                }
                reader.Close();

                Console.WriteLine("Code Running Successfully successfully");

                sqlCon.Close();


            }
            catch (SqlException exp)
            {
                Console.WriteLine(exp.Message);
                Console.WriteLine("SQL Based Error!!");
            }
            catch (Exception ep)
            {
                Console.WriteLine(ep.Message);
                Console.WriteLine("C-Sharp Based Error!!");
            }
        }

    }

}