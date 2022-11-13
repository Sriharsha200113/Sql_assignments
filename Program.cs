using System.Data.SqlClient;
namespace Day5_Q1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {
                string ConnectionString = "Data Source=INLPF3KS5XJ;Initial Catalog=passport;trusted_connection=true"; 
                SqlConnection sqlCon = new SqlConnection(ConnectionString);
                sqlCon.Open();

                int i = 0;

                while (i < 10)
                {

                    SqlCommand cmd = new SqlCommand("passport", sqlCon);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    Console.WriteLine("Enter details of record " + (i + 1));

                    Console.WriteLine("Enter  Passport Number:");
                    long passport_no = Convert.ToInt64(Console.ReadLine());

                    Console.WriteLine("Enter  Candidate Name:");
                    string candidate_name = Console.ReadLine();

                    Console.WriteLine("Enter  Passport Expiry Date:");
                    string expiry_date = Console.ReadLine();

                    Console.WriteLine("Enter the Years of validity:");
                    int val_years = Convert.ToInt32(Console.ReadLine());

                    Console.WriteLine("Enter the Applied Through Channel:");
                    string channel_app = Console.ReadLine();

                    cmd.Parameters.Add("@p_no", System.Data.SqlDbType.BigInt).Value = passport_no;
                    cmd.Parameters.Add("@c_name", System.Data.SqlDbType.VarChar).Value = candidate_name;
                    cmd.Parameters.Add("@exp_date", System.Data.SqlDbType.Date).Value = expiry_date;
                    cmd.Parameters.Add("@years_val", System.Data.SqlDbType.Int).Value = val_years;
                    cmd.Parameters.Add("@channel", System.Data.SqlDbType.VarChar).Value = channel_app;

                    cmd.ExecuteNonQuery();
                    Console.WriteLine("Data inserted Successfully!!");
                    i++;
                }
                sqlCon.Close();
            }


            catch (SqlException Sqe)
            {
                Console.WriteLine(Sqe.Message);
                Console.WriteLine("Sql Related problem");
            }
            catch (Exception exp)
            {
                Console.WriteLine(exp.Message);
                Console.WriteLine("C-Sharp code related problem");
            }
        }
    }
}