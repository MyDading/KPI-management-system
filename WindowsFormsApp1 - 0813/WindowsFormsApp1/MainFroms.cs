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
using Excel = Microsoft.Office.Interop.Excel;

namespace WindowsFormsApp1
{
    public partial class MainFroms : CCSkinMain
    {
        
   
        public MainFroms()
        {
            InitializeComponent();
            //设置标题栏无按钮
            //this.ControlBox = false;
            //

            //多行文本框
            cxFlatTextBox2.Text =
                "A" + Environment.NewLine
                + "B" + Environment.NewLine
                + "C" + Environment.NewLine
                + "D" + Environment.NewLine
                + "E" + Environment.NewLine
                + "F" + Environment.NewLine
                + "G" + Environment.NewLine
                + "H" + Environment.NewLine
                + "I" + Environment.NewLine
                + "J" + Environment.NewLine
                + "K" + Environment.NewLine;

            this.AutoScroll = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //cxFlatRoundProgressBar1.ValueNumber += 10;
            if (timer1.Enabled)
                timer1.Stop();
            else
                timer1.Start();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {

        }

        private void cxFlatContextMenuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            cxFlatButton2.Text = e.ClickedItem.Text;
        }

        private void cxFlatDatePicker1_onDateChanged(DateTime newDateTime)
        {
            label1.Text = cxFlatDatePicker1.Date.ToLongDateString();
        }

        public void Reciver(string conter) //接受登录用户名的方法，数据从Form2的tbUsername（用户名TextBox控件）中取得
        {
            this.userlab.Text = conter;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
            //this.Reciver("");
            //string 登录用户 = userlab.Text.Trim();
            // TODO: 这行代码将数据加载到表“setDataSet.kpi_info”中。您可以根据需要移动或删除它。
            this.kpi_infoTableAdapter.Fill(this.setDataSet.kpi_info);
            // TODO: 这行代码将数据加载到表“setDataSet.kpi”中。您可以根据需要移动或删除它。
            this.kpiTableAdapter.Fill(this.setDataSet.kpi);
            
        }

        private void CxFlatRoundButton1_Click(object sender, EventArgs e)
        {
            /*数据库连接
            //1.创建数据连接,这里注意你登录数据库的数据库名称，用户名和密码
            string strcon = "server=localhost;database=set;uid=root;pwd=sas124578;";
            MySqlConnection con = new MySqlConnection(strcon);

            //2. 打开数据库
            con.Open();
            //3. sql语句
            string sqlSel = "server=localhost;database=set;uid=root;pwd=sas124578;";
            MySqlCommand com = new MySqlCommand(sqlSel, con);
            //MySqlConnection conn = new MySqlConnection(connectionstring);
            MySqlCommand cmd = new MySqlCommand("Your sql query");
            MySqlDataReader dr = cmd.ExecuteReader();

            dataGridView1.DataSource = dr;
            //dataGridView1.DataBindings control ;
            */
            string str = "server=localhost;database=set;uid=root;pwd=sas124578;";//本地数据连接
            //string str = "server=192.168.3.3;database=set;uid=root;pwd=sas124578;";//FQ电脑数据库
            MySqlConnection con = new MySqlConnection(str);//实例化链接
            con.Open();//开启连接
            string strcmd = "select * from kpi_msg";
            MySqlCommand cmd = new MySqlCommand(strcmd, con);
            MySqlDataAdapter ada = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);//查询结果填充数据集
            dataGridView1.DataSource = ds.Tables[0];
            con.Close();//关闭连接


        }

        private void FillToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.kpi_infoTableAdapter.Fill(this.setDataSet.kpi_info);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void SkinButton11_Click(object sender, EventArgs e)
        {
            string str = "server=localhost;database=set;uid=root;pwd=sas124578;";
            //string str = "server=192.168.3.3;database=set;uid=root;pwd=sas124578;";//FQ电脑数据库
            MySqlConnection con = new MySqlConnection(str);//实例化链接
            con.Open();//开启连接
            string strcmd = "select * from kpi";
            MySqlCommand cmd = new MySqlCommand(strcmd, con);
            MySqlDataAdapter ada = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);//查询结果填充数据集
            dataGridView1.DataSource = ds.Tables[0];
            con.Close();//关闭连接
        }

        private void CxFlatRoundButton17_Click(object sender, EventArgs e)
        {
            //定义要存入数据库中的字符
            string kpi细项 = label58.Text.Trim();
            string 审核方式 = label57.Text.Trim();
            string 评核计算方式 = label56.Text.Trim();
            string 目标值 = label55.Text.Trim();
            string 比重 = label52.Text.Trim();
            string 项目 = cxFlatTextBox34.Text.Trim();
            string 系统编号 = cxFlatTextBox33.Text.Trim();
            string 细项 = cxFlatTextBox29.Text.Trim();
            string 目标数 = cxFlatTextBox32.Text.Trim();
            string 达成数 = cxFlatTextBox31.Text.Trim();
            string 项次 = cxFlatTextBox30.Text.Trim();
            string 工号 = Jobidlabel.Text.Trim();
            string 用户名 = userlab.Text.Trim();
            //连接mysql数据库
            MySqlConnectionStringBuilder sb = new MySqlConnectionStringBuilder();//创建链接数据库对象SB,下面定义了连接信息
            sb.Server = "127.0.0.1";//服务IP地址
            sb.Port = 3306;//端口
            sb.Database = "set";//数据库名
            sb.UserID = "root";//用户名
            sb.Password = "sas124578";//密码
            // sb.CharacterSet = "gb2312";
            MySqlConnection con = new MySqlConnection(sb.ConnectionString);//实例化连接
            con.Open();//打开连接
            // if (1 == 1)//管理员表
            //  {
            //   String query = "select * from kpi_msg where user_name='" + name + "'";//向数据库服务器发送指令
            //   MySqlCommand cmd = new MySqlCommand(query, con);
            //执行结果赋值到dr，dr为只读
            //    MySqlDataReader dr = cmd.ExecuteReader();
            //     if (dr.Read())
            //     {
            //         MessageBox.Show("改用户已存在，请重新注册！");
            //    }
            //    else
            //     {

                    string insert = "insert ignore into kpi_msg(kpi,kpi辅项,kpi细项,审核方式,评核计算方式,目标值,比重,达成数,目标数,项次,项目,系统编号,细项,工号,姓名) values " +
                    "( '专案质量', '进度管理','" + kpi细项 + "'," + "'" + 审核方式 + "'," + "'" + 评核计算方式 + "'," + "'" + 目标值 + "'," + "'" + 比重 + "'," + "'" + 达成数 + "'," + "'" + 目标数 + "'," + "'" + 项次 + "'," + "'" + 项目 + "'," + "'" + 系统编号 + "'," + "'" + 细项 + "'," + "'" + 工号 + "'," + "'" + 用户名 + "')";
                    MySqlCommand cmd2 = new MySqlCommand(insert, con);
                    //dr.Close();
                    cmd2.ExecuteNonQuery();
                    MessageBox.Show("保存成功！");
          //      }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void CxFlatRoundButton16_Click(object sender, EventArgs e)
        {
            
        }

        private void Timer1_Tick_1(object sender, EventArgs e)
        {
            this.Kpi信息刷新_Click(null, null);
            this.Kpi信息刷新1_Click(null, null);
            timer1.Enabled = false;
        }

        private void Kpi信息刷新_Click(object sender, EventArgs e)
        {
            string 登录用户 = userlab.Text.Trim();
            ///*******加载对应用户的KPI信息到页面中********///
            MySqlConnection conn = new MySqlConnection("server=localhost;database=set;uid=root;pwd=sas124578;");
            //conn.ConnectionString = "";
            conn.Open();
            MySqlCommand cmd = conn.CreateCommand();

            //cmd.CommandText = "SELECT * from kpi_msg WHERE 姓名='呂運鼎'";//查找对应姓名的数据
            //cmd.CommandText = "SELECT * from kpi_msg WHERE 姓名='" + 登录用户 + "' LIMIT 3,1";   //数据库数据建好后启用该句，查询对应登录用户信息中的第四行开始的第一条数据
            cmd.CommandText = "SELECT * FROM kpi_msg WHERE kpi_msg.`KPI辅项` = '进度管理' AND kpi_msg.`姓名` ='" + 登录用户 + "' LIMIT 0, 1";//查询对应登录用户的进度管理的第一条信息
            MySqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            try
            {
                string temp_role = reader.GetString(3);
                label58.Text = temp_role;

                string temp_role1 = reader.GetString(4);
                label57.Text = temp_role1;

                string temp_role2 = reader.GetString(5);
                label56.Text = temp_role2;

                string temp_role3 = reader.GetString(6);
                label55.Text = temp_role3;

                string temp_role4 = reader.GetString(7);
                label52.Text = temp_role4;

                string temp_role5 = reader.GetString(17);
                Jobidlabel.Text = temp_role5;
            }

            catch
            {
                MessageBox.Show("用户数据刷新失败！");
            }
        /*
            cmd.CommandText = "SELECT * FROM kpi_msg WHERE kpi_msg.`KPI辅项` = '準確度' AND kpi_msg.`姓名` ='" + 登录用户 + "' LIMIT 0, 1";
            MySqlDataReader reader1 = cmd.ExecuteReader();
            reader1.Read();
            string temp_role6 = reader1.GetString(3);
            label69.Text = temp_role6;
            /*
            try
            {
                string temp_role6 = reader.GetString(3);
                label69.Text = temp_role6;
            }
            catch
            {
                MessageBox.Show("用户数据刷新失败！");
            }
            */
            conn.Close();
            ///*******功能结束********///
        }

        private void CxFlatRoundButton11_Click(object sender, EventArgs e)
        {
            //定义要存入数据库中的字符
            string kpi细项 = label69.Text.Trim();
            string 审核方式 = label68.Text.Trim();
            string 评核计算方式 = label67.Text.Trim();
            string 目标值 = label66.Text.Trim();
            string 比重 = label63.Text.Trim();
            string 项目 = cxFlatTextBox38.Text.Trim();
            string 系统编号 = cxFlatTextBox37.Text.Trim();
            string 细项 = cxFlatTextBox27.Text.Trim();
            string 目标数 = cxFlatTextBox36.Text.Trim();
            string 达成数 = cxFlatTextBox35.Text.Trim();
            string 项次 = cxFlatTextBox28.Text.Trim();
            string 工号 = Jobidlabel.Text.Trim();
            string 用户名 = userlab.Text.Trim();
            //连接mysql数据库
            MySqlConnectionStringBuilder sb = new MySqlConnectionStringBuilder();//创建链接数据库对象SB,下面定义了连接信息
            sb.Server = "127.0.0.1";//服务IP地址
            sb.Port = 3306;//端口
            sb.Database = "set";//数据库名
            sb.UserID = "root";//用户名
            sb.Password = "sas124578";//密码
            // sb.CharacterSet = "gb2312";
            MySqlConnection con = new MySqlConnection(sb.ConnectionString);//实例化连接
            con.Open();//打开连接
                       // if (1 == 1)//管理员表
                       //  {
                       //   String query = "select * from kpi_msg where user_name='" + name + "'";//向数据库服务器发送指令
                       //   MySqlCommand cmd = new MySqlCommand(query, con);
                       //执行结果赋值到dr，dr为只读
                       //    MySqlDataReader dr = cmd.ExecuteReader();
                       //     if (dr.Read())
                       //     {
                       //         MessageBox.Show("改用户已存在，请重新注册！");
                       //    }
                       //    else
                       //     {

            string insert = "insert ignore into kpi_msg(kpi,kpi辅项,kpi细项,审核方式,评核计算方式,目标值,比重,达成数,目标数,项次,项目,系统编号,细项,工号,姓名) values " +
            "( '专案质量', '准确度','" + kpi细项 + "'," + "'" + 审核方式 + "'," + "'" + 评核计算方式 + "'," + "'" + 目标值 + "'," + "'" + 比重 + "'," + "'" + 达成数 + "'," + "'" + 目标数 + "'," + "'" + 项次 + "'," + "'" + 项目 + "'," + "'" + 系统编号 + "'," + "'" + 细项 + "'," + "'" + 工号 + "'," + "'" + 用户名 + "')";
            MySqlCommand cmd2 = new MySqlCommand(insert, con);
            //dr.Close();
            cmd2.ExecuteNonQuery();
            MessageBox.Show("保存成功！");
            //      }
        }

        private void Kpi信息刷新1_Click(object sender, EventArgs e)
        {
            string 登录用户 = userlab.Text.Trim();
            ///*******加载对应用户的KPI信息到页面中********///
            MySqlConnection conn = new MySqlConnection("server=localhost;database=set;uid=root;pwd=sas124578;");
            //conn.ConnectionString = "";
            conn.Open();
            MySqlCommand cmd = conn.CreateCommand();

            //cmd.CommandText = "SELECT * from kpi_msg WHERE 姓名='呂運鼎'";//查找对应姓名的数据
            //cmd.CommandText = "SELECT * from kpi_msg WHERE 姓名='" + 登录用户 + "' LIMIT 3,1";   //数据库数据建好后启用该句，查询对应登录用户信息中的第四行开始的第一条数据
            cmd.CommandText = "SELECT * FROM kpi_msg WHERE kpi_msg.`KPI辅项` = '準確度' AND kpi_msg.`姓名` ='" + 登录用户 + "' LIMIT 0, 1";//查询对应登录用户的进度管理的第一条信息
            MySqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            try
            {
                string temp_role = reader.GetString(3);//获取一行数据的第4列的字段
                label69.Text = temp_role;

                string temp_role1 = reader.GetString(4);
                label68.Text = temp_role1;

                string temp_role2 = reader.GetString(5);
                label67.Text = temp_role2;

                string temp_role3 = reader.GetString(6);
                label66.Text = temp_role3;

                string temp_role4 = reader.GetString(7);
                label63.Text = temp_role4;

            }

            catch
            {
                MessageBox.Show("准确度数据刷新失败！");
            }
            conn.Close();
        }

        private void 数据导出EToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void CxFlatRoundButton25_Click(object sender, EventArgs e)
        {
            string str = "server=localhost;database=set;uid=root;pwd=sas124578;";
            MySqlConnection con = new MySqlConnection(str);//实例化链接
            con.Open();//开启连接
            string strcmd = "select * from kpi_msg";
            MySqlCommand cmd = new MySqlCommand(strcmd, con);
            MySqlDataAdapter ada = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);//查询结果填充数据集
            dataGridView3.DataSource = ds.Tables[0];
            con.Close();//关闭连接
        }

        private void CxFlatRoundButton26_Click(object sender, EventArgs e)
        {
            string fileName = "";
            string saveFileName = "";
            SaveFileDialog saveDialog = new SaveFileDialog();
            saveDialog.DefaultExt = "xls";
            saveDialog.Filter = "Excel文件|*.xls";
            saveDialog.FileName = fileName;
            saveDialog.ShowDialog();
            saveFileName = saveDialog.FileName;

            if (saveFileName.IndexOf(":") < 0) return; //被点了取消

            Microsoft.Office.Interop.Excel.Application xlApp = new Microsoft.Office.Interop.Excel.Application();

            if (xlApp == null)
            {
                MessageBox.Show("无法创建Excel对象，您的电脑可能未安装Excel");
                return;
            }

            Microsoft.Office.Interop.Excel.Workbooks workbooks = xlApp.Workbooks;
            Microsoft.Office.Interop.Excel.Workbook workbook = workbooks.Add(Microsoft.Office.Interop.Excel.XlWBATemplate.xlWBATWorksheet);
            Microsoft.Office.Interop.Excel.Worksheet worksheet = (Microsoft.Office.Interop.Excel.Worksheet)workbook.Worksheets[1];//取得sheet1 
            //写入标题             
            for (int i = 0; i < dataGridView3.ColumnCount; i++)
            { worksheet.Cells[1, i + 1] = dataGridView3.Columns[i].HeaderText; }
            //写入数值

            for (int r = 0; r < dataGridView3.Rows.Count; r++)
            {
                for (int i = 0; i < dataGridView3.ColumnCount; i++)

                {
                    worksheet.Cells[r + 2, i + 1] = dataGridView3.Rows[r].Cells[i].Value;
                }
                System.Windows.Forms.Application.DoEvents();
            }

            worksheet.Columns.EntireColumn.AutoFit();//列宽自适应

            MessageBox.Show(fileName + "资料保存成功", "提示", MessageBoxButtons.OK);
            if (saveFileName != "")
            {
                try
                {
                    workbook.Saved = true;
                    workbook.SaveCopyAs(saveFileName);  //fileSaved = true;                 
                }
                catch (Exception ex)
                {//fileSaved = false;                      
                    MessageBox.Show("导出文件时出错,文件可能正被打开！\n" + ex.Message);
                }
            }
            xlApp.Quit();
            GC.Collect();//强行销毁           
        }

        private void 账号管理ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            UserInfoFroms userFroms = new UserInfoFroms();//创建打开UserInfoFroms的对象userFroms
            userFroms.Show();//打开UserInfoFroms
        }
    }
    
}
