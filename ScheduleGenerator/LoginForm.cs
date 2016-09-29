using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ScheduleGenerator
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Data;
    using System.Drawing;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows.Forms;
    using System.Data.SqlClient;

    public partial class LoginForm : Form
    {

        public LoginForm()
        {
            InitializeComponent();
           
            //
            /*
           String url = "jdbc:mysql://localhost:3306/";
           String dbName = "moviestore";
           String driver = "com.mysql.jdbc.Driver";
           String userName = "root"; 
           String password = "#########"; 
            */

           try 
           {
               //
               SqlConnection conn = new SqlConnection("server=localhost" +
                                       "Trusted_Connection=yes;" +
                                       "database=testDB; " +
                                       "connection timeout=30");

               conn.Open();
           } 
           catch (Exception e) 
           {
                //e.printStackTrace();
           }

        }

        private void LoginButton_Click(object sender, EventArgs e)
        {
            //Check username and password. If wrong reset and keep checking.
            String Username = UsernameTextBox.ToString();
            String Password = PasswordMaskedTextBox.ToString();

            //Call sql getPassword(Username, Password)
            //Check if password is correct
            //If admin is true for user.      
            if(true)
            {
                new AdministratorForm().Show();
                this.Hide();
            }
            else
            {
                new UserForm().Show();
                this.Hide();
            }
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
    }
}
