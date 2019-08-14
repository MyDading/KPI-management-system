using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CCWin.SkinControl;
using CCWin;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace WindowsFormsApp1
{
    public partial class UserInfoFroms : CCSkinMain
    {
        public UserInfoFroms()
        {
            InitializeComponent();
        }

        private void 用户信息_Load(object sender, EventArgs e)
        {

        }

        private void CxFlatButton2_Click(object sender, EventArgs e)
        {
            OpenFileDialog fileDialog = new OpenFileDialog();
            fileDialog.Title = "上传图片文件";
            fileDialog.Filter = "图片文件(*.jpg)|*.jpg|图片文件(*.gif)|*.gif|图片文件(*.bmp)|*.bmp|所有文件(*.*)|*.*";
            if (fileDialog.ShowDialog() == DialogResult.OK)
            {
                this.pictureBox1.Image = System.Drawing.Image.FromFile(fileDialog.FileName);
            }
        }

        private void CxFlatButtonCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
