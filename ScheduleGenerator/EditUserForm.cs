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
    public partial class EditUserForm : Form
    {
        public EditUserForm()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            //This text will be the user's first name.
        }

        private void label2_Click(object sender, EventArgs e)
        {
            //This text will be the user's last name.

        }

        private void label3_Click(object sender, EventArgs e)
        {
            //This text will be the user's password.
        }

        private void ChangeFirstNameButton_Click(object sender, EventArgs e)
        {
            //Update users first name.
        }

        private void ChangeLastNameButton_Click(object sender, EventArgs e)
        {
            //Update the users last name.
        }

        private void SetEmailButton_Click(object sender, EventArgs e)
        {
            //Update the users email
        }

        private void SetPasswordButton_Click(object sender, EventArgs e)
        {
            //Update the users email
        }

        private void EditUserForm_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'schedulingDatabaseDataSet1.Employee' table. You can move, or remove it, as needed.
            this.employeeTableAdapter.Fill(this.schedulingDatabaseDataSet1.Employee);

        }
    }
}
