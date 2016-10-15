using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ScheduleGenerator
{
    public partial class AddUserForm : Form
    {
        String serverInfo = "Data Source=MARK-PC\\MWSQLSERVER;Initial Catalog=SchedulingDatabase;Integrated Security=True";
        public AddUserForm()
        {
            InitializeComponent();
        }

        private void AddUserButton_Click(object sender, EventArgs e)
        {
            //Call
            String FirstName = AddFirstNameTextBox.ToString();
            String LastName = AddLastNameTextBox.ToString();
            String Email = AddEmailTextBox.ToString();
            String Password = AddPasswordTextBox.ToString();
            

            SqlConnection con = new SqlConnection(serverInfo);
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Employee(First name, Last name, Email, Password, Admin) values('" +FirstName+ "', '" +LastName+"', '"+Email+"', '"+Password+"','True');", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            MessageBox.Show("User was added!");
            this.Hide();
        }

        private void AddUserForm_Load(object sender, EventArgs e)
        {// TODO: This line of code loads data into the 'admin.Employee' table. You can move, or remove it, as needed.
            this.employeeTableAdapter4.Fill(this.admin.Employee);
            /*
                        // TODO: This line of code loads data into the 'password.Employee' table. You can move, or remove it, as needed.
                        this.employeeTableAdapter3.Fill(this.password.Employee);
                        // TODO: This line of code loads data into the 'email.Employee' table. You can move, or remove it, as needed.
                        this.employeeTableAdapter2.Fill(this.email.Employee);
                        // TODO: This line of code loads data into the 'lastName.Employee' table. You can move, or remove it, as needed.
                        this.employeeTableAdapter1.Fill(this.lastName.Employee);
                        // TODO: This line of code loads data into the 'firstName.Employee' table. You can move, or remove it, as needed.
                        this.employeeTableAdapter.Fill(this.firstName.Employee);
                       */
        }
    }
}
