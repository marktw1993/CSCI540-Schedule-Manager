using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.OleDb;
using System.Data.SqlClient;

namespace ScheduleGenerator
{
    public partial class Form1 : Form
    {
        SqlConnection con = new SqlConnection();
        String serverInfo = "Data Source=Mark-pc/mwsqlserver;Initial Catalog=SchedulingDatabase;Integrated Security=True";
        public Form1()
        {
            InitializeComponent();
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {
           // TODO: This line of code loads data into the 'sTUDENTDataSet.login' table. You can move, or remove it, as needed.  
            //this.loginTableAdapter.Fill(this.sTUDENTDataSet.login);  
            SqlConnection con = new SqlConnection(serverInfo);
            //con.Open();
            //con.Close();

            {
            }
        }
        
        private void LoginButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(serverInfo);
            con.Open();
            string userid = UsernameTextBox.Text;
            string password = PasswordMaskedTextBox.Text;
            SqlCommand cmd = new SqlCommand("select Email,Password from Employee where Email='" + userid + "'and Password='" + password + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                MessageBox.Show("Login successful");
            }
            else
            {
                MessageBox.Show("Invalid Login please check username and password");
            }
            con.Close();
        }


        private void ExitButton_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            new UserForm().Show();
            this.Hide();
        }

      /*  private void LoginForm_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'email.Employee' table. You can move, or remove it, as needed.
            this.employeeTableAdapter1.Fill(this.email.Employee);
            // TODO: This line of code loads data into the 'pW.Employee' table. You can move, or remove it, as needed.
            this.employeeTableAdapter.Fill(this.pW.Employee);

        }*/
    }
}
