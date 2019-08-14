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
    public partial class NewLoginForm : CCSkinMain
    {
        MySqlConnection conn = null;        //在类里面定义变量
        public NewLoginForm()
        {
            InitializeComponent();      //在构造函数里面初始化
            conn = new MySqlConnection("server=127.0.0.1;user=root;database=users;port=3306;password=sas124578;");       //指明要连接的数据库地址，用户名，数据库名，端口，密码
            //conn = new MySqlConnection("server=192.168.3.3;user=root;database=users;port=3306;password=sas124578;");
        }

        //创建委托对象(使用系统带的Action委托)
        public Action<string> act;
        private void ButtonLogin_Click(object sender, EventArgs e)
        {
            //1. 获取数据
            //从TextBox中获取用户输入信息
            string userName = this.TextBoxUsername.Text;
            string userPassword = this.TextBoxPassword.Text;

            //2. 验证数据
            // 验证用户输入是否为空，若为空，提示用户信息
            if (userName.Equals("") || userPassword.Equals(""))
            {
                MessageBox.Show("用户名或密码不能为空！");
            }
            // 若不为空，验证用户名和密码是否与数据库匹配
            else
            {
                //用户名和密码验证正确，提示成功，并执行跳转界面。
                /*数据库连接*/
                //1.创建数据连接,这里注意你登录数据库的数据库名称，用户名和密码
                string strcon = "server=localhost;database=set;uid=root;pwd=sas124578;";//本地数据库连接
                //string strcon = "server=192.168.3.3;database=set;uid=root;pwd=sas124578;";//连接FQ电脑的数据库
                MySqlConnection con = new MySqlConnection(strcon);
                try
                {
                    //2. 打开数据库
                    con.Open();
                    //3. sql语句
                    //string sqlSel = "select count(*) from set.login where user_name = '" + userName + "' and user_password = '" + userPassword + "'";//在Login表中匹配账号密码
                    string sqlSel = "select count(*) from set.user_info where name = '" + userName + "' and password = '" + userPassword + "'";//在user_info表中匹配账号密码
                    MySqlCommand com = new MySqlCommand(sqlSel, con);
                    //4.判断executeScalar方法返回的参数是否大于0，大于0表示查找有数据
                    if (Convert.ToInt32(com.ExecuteScalar()) > 0)
                    {
                        MessageBox.Show("登录成功！");
                        //创建从窗体对象
                        MainFroms f1 = new MainFroms();
                        act += f1.Reciver;  //委托连接方法（用户登录名Form2.tbUsername.Text传给Form1.userlab.Text）
                        //跳转主界面
                        f1.Show();
                        act(TextBoxUsername.Text.Trim());//调用委托传递信息
                        this.Hide();//隐藏本窗体


                    }

                    //用户名和密码验证错误，提示错误。
                    else
                    {
                        MessageBox.Show("用户名或密码错误！");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString() + "打开数据库失败");
                }
            }

            //3. 处理数据
        }

        private void ButtonRegister_Click(object sender, EventArgs e)
        {
            string name = TextBoxUsername.Text.Trim();
            string password = TextBoxPassword.Text.Trim();
            //连接mysql数据库
            MySqlConnectionStringBuilder sb = new MySqlConnectionStringBuilder();
            sb.Server = "127.0.0.1";
            sb.Port = 3306;
            sb.Database = "set";
            sb.UserID = "root";
            sb.Password = "sas124578";
            // sb.CharacterSet = "gb2312";
            MySqlConnection con = new MySqlConnection(sb.ConnectionString);//实例化连接
            con.Open();
            // if (radioButton2.Checked == true)//管理员表
            if (1 == 1)
            {
                //String query = "select * from login where user_name='" + name + "'";//向数据库服务器发送指令,与Login表匹配数据
                String query = "select * from user_info where name='" + name + "'";//向数据库服务器发送指令，与kpi_info表匹配数据
                MySqlCommand cmd = new MySqlCommand(query, con);
                //执行结果赋值到dr，dr为只读
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    MessageBox.Show("该用户已存在，请重新注册！");
                }
                else
                {
                    //string insert = "insert ignore into login(user_name,user_password) values ('" + name + "'," + "'" + password + "')";//在Login表中添加账号密码信息
                    string insert = "insert ignore into user_info(name,password) values ('" + name + "'," + "'" + password + "')";//在user_info表中添加账号密码信息
                    MySqlCommand cmd2 = new MySqlCommand(insert, con);
                    dr.Close();
                    cmd2.ExecuteNonQuery();
                    MessageBox.Show("注册成功！");
                }
            }
           // if (radioButton1.Checked == true)//用户表
                if (1 == 1)//用户表
                {
                String query = "select * from login where user_name='" + name + "'";//向数据库服务器发送指令，定义MySQL查询语句
                MySqlCommand cmd = new MySqlCommand(query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    MessageBox.Show("改用户已存在，请重新注册！");
                }
                else
                {
                    string insert = "insert ignore into login(user_name,user_password) values ('" + name + "'," + "'" + password + "')";//定义MySQL插入语句，插入用户名和密码
                    MySqlCommand cmd2 = new MySqlCommand(insert, con);
                    dr.Close();
                    cmd2.ExecuteNonQuery();
                    MessageBox.Show("注册成功！");
                }
            }
            con.Close();
        }

        private void ButtonMainFrom_Click(object sender, EventArgs e)
        {
            MainFroms f1 = new MainFroms();//创建打开Form1的对象f1
            f1.Show();//打开From1
        }

        private void NewLoginForm_Load(object sender, EventArgs e)
        {

        }
    }
}
