using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace WindowsFormsApp1
{
    public partial class Form2 : Form
    {
        

        MySqlConnection conn = null;        //在类里面定义变量

        public Form2()
        {
            InitializeComponent();      //在构造函数里面初始化
            conn = new MySqlConnection("server=127.0.0.1;user=root;database=users;port=3306;password=sas124578;");       //指明要连接的数据库地址，用户名，数据库名，端口，密码

        }

        

        private void btnConnect_Click(object sender, EventArgs e)
        {
            conn.Open();        //打开对象，conn对象调用Open方法，打开链接
            if (conn.State.ToString() == "Open")
            {
                lblStatusResult.Text = "数据库连接成功！";

                string cmdStr1 = "INSERT INTO userinfo (userName, passWord) VALUES('YAOMING', YAOMING),('JORDAN', JORDAN),('DUNKEN', DUNKEN)";//MySQL语句，插入用户和密码到对应位置

            }
            else
            {
                lblStatusResult.Text = "数据库连接失败！";
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            conn.Close();
            if (conn.State.ToString() == "Closed")
            {
                lblStatusResult.Text = "数据库已关闭！";
            }
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = tbUsername.Text.Trim();       //获取用户名
            string passWord = tbPassword.Text.Trim();       //获取密码
                                                            //
                                                            //string cmdStr = "Select * from test.user where name='"+ userName + "'AND passWord='" + passWord + "'";
            string cmdStr = "Select * from userinfo where username='" + userName + "'AND passWord='" + passWord + "'";//MySQL语句，在用户信息表中查询用户和密码
            MySqlCommand cmd = new MySqlCommand(cmdStr, conn);      //定义查询语句

            MySqlDataReader sreader = cmd.ExecuteReader();      //执行查询操作
            if (sreader.Read())
            {
                MessageBox.Show("登入成功！");
            }
            else
            {
                MessageBox.Show("登入失败！");
            }
            sreader.Close();        //每次执行完毕都得关闭reader
        }

        private void btnRegister_Click(object sender, EventArgs e)
        {
            string userName = tbUsername.Text.Trim();//定义用户名为文本框输入的内容，Trim()可以把字符串前后空格去掉
            string passWord = tbPassword.Text.Trim();

            string cmdStr = "INSERT INTO userinfo VALUES('" + userName + "','" + passWord + "')"; //MySQL语句，插入用户和密码到对应位置

            string cmdStr1 = "INSERT INTO userinfo (userName, passWord) VALUES('YAOMING', YAOMING),('JORDAN', JORDAN),('DUNKEN', DUNKEN)";//MySQL语句，插入用户和密码到指定位置

            MySqlCommand cmd = new MySqlCommand(cmdStr, conn);//定义查询语句
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                MessageBox.Show("注册成功！");
            }
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            /* MySqlConnection m_conn = new MySqlConnection("server=localhost;user id=root;password=sas124578;persist security info=True");
             m_conn.Open();
             //conn.Open();
             //MySqlCommand cmd = new MySqlCommand("CREATE DATABASE login_test", m_conn);
             MySqlCommand cmd = new MySqlCommand("CREATE DATABASE TEST01", m_conn);
            // MySqlCommand cmd = new MySqlCommand("INSERT INTO `users`.`loging_message`(`user_id`, " +
               //  "`user_name`, `user_password`) VALUES('008', 'LX', '008')", m_conn); 
             //cmd.CommandTimeout = 12000;
             //cmd.ExecuteNonQuery();*/
            /********创建一个database*********
           MySqlConnection m_conn = new MySqlConnection("server=localhost;user id=root;password=sas124578;persist security info=True");
           m_conn.Open();
           MySqlCommand cmd = new MySqlCommand("CREATE DATABASE TEST01", m_conn);
           cmd.CommandTimeout = 12000;
           cmd.ExecuteNonQuery();
           *******/
            /********创建一个table*********
            MySqlConnection m_conn = new MySqlConnection("server=localhost;user id=root;password=sas124578;persist security info=True;database=test01");
            m_conn.Open();
            MySqlCommand cmd = new MySqlCommand("CREATE TABLE PERSON(ID INT(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,PERSONCODE VARCHAR(255) DEFAULT NULL,PERSONNAME1 VARCHAR(255) DEFAULT NULL)", m_conn);
            cmd.CommandTimeout = 12000;
            cmd.ExecuteNonQuery();
            *******/
            /********连接mysql，创建一个连接对象，接着开其启对象*********
            MySqlConnection m_conn = new MySqlConnection("server=localhost;user id=root;password=sas124578;persist security info=True;database=test01");//创建mysql的连接对象
            m_conn.Open();//开启连接
            *******/
            /********查询*********
            MySqlConnection m_conn = new MySqlConnection("server=localhost;user id=root;password=sas124578;persist security info=True;database=test01");
            m_conn.Open();
            DataTable dt = new DataTable("ds");
            DataSet ds = new DataSet(); //创建一个数据集来存放查询的返回结果
            MySqlDataAdapter da = new MySqlDataAdapter("SELECT * FROM TEST01.PERSON", m_conn); //创建一个数据适配器来查找数据
            da.SelectCommand.CommandTimeout = 12000;
            da.Fill(ds, "ds"); //将查询到的数据填充到数据集dataset中，
            dt = ds.Tables[0];
             *******/
            /********插入*********
            MySqlConnection m_conn = new MySqlConnection("server=localhost;user id=root;password=sas124578;persist security info=True;database=test01");
            m_conn.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO test01.person(personcode,personname1) values('123456','测试老王')", m_conn);
            cmd.CommandTimeout = 12000;
            int iRecordAffected = cmd.ExecuteNonQuery();//返回插入了几条数据
            *******/
            /********更新*********
            MySqlConnection m_conn = new MySqlConnection("server=localhost;user id=root;password=sas124578;persist security info=True;database=test01");
            m_conn.Open();
            MySqlCommand cmd = new MySqlCommand("update test01.person set personname1='测试王二麻子' where personcode='123456'", m_conn);
            cmd.CommandTimeout = 12000;
            int iRecordAffected = cmd.ExecuteNonQuery();//返回更新了几条数据
            *******/
            /********删除*********
            MySqlConnection m_conn = new MySqlConnection("server=localhost;user id=root;password=sas124578;persist security info=True;database=test01");
            m_conn.Open();
            MySqlCommand cmd = new MySqlCommand("delete from test01.person where personname1='测试王二麻子' and personcode='123456'", m_conn);
            cmd.CommandTimeout = 12000;
            int iRecordAffected = cmd.ExecuteNonQuery();//返回删除了几条数据
            *******/
            //用来为以后程序编写做的参考代码
        }


        private void Button2_Click(object sender, EventArgs e)
        {
            MySqlConnection m_conn = new MySqlConnection("server=localhost;user id=root;password=sas124578;persist security info=True;database=login_test");//新建链接对象，链接MySQL数据库
            m_conn.Open();//打开链接
            MySqlCommand cmd = new MySqlCommand("CREATE TABLE PERSON(ID INT(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,PERSONCODE VARCHAR(255) DEFAULT NULL,PERSONNAME1 VARCHAR(255) DEFAULT NULL)", m_conn);//定义MySQL语句，创建PERSON表

        }

        //创建委托对象(使用系统带的Action委托)
        public Action<string> act;
        private void Button4_Click_1(object sender, EventArgs e)
        {
            //1. 获取数据
            //从TextBox中获取用户输入信息
            string userName = this.tbUsername.Text;
            string userPassword = this.tbPassword.Text;

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
                string strcon = "server=localhost;database=set;uid=root;pwd=sas124578;";
                MySqlConnection con = new MySqlConnection(strcon);
                try
                {
                    //2. 打开数据库
                    con.Open();
                    //3. sql语句
                    string sqlSel = "select count(*) from set.login where user_name = '" + userName + "' and user_password = '" + userPassword + "'";
                    MySqlCommand com = new MySqlCommand(sqlSel, con);
                    //4.判断executeScalar方法返回的参数是否大于0，大于0表示查找有数据
                    if (Convert.ToInt32(com.ExecuteScalar()) > 0)
                    {
                        MessageBox.Show("登录成功！");
                        //创建从窗体对象
                        Form1 f1 = new Form1();
                        act += f1.Reciver;  //委托连接方法（用户登录名Form2.tbUsername.Text传给Form1.userlab.Text）
                        //跳转主界面
                        f1.Show();
                        act(tbUsername.Text.Trim());//调用委托传递信息
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

        private void Button5_Click_1(object sender, EventArgs e)
        {
            string name = tbUsername.Text.Trim();
            string password = tbPassword.Text.Trim();
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
                String query = "select * from login where user_name='" + name + "'";//向数据库服务器发送指令
                MySqlCommand cmd = new MySqlCommand(query, con);
                //执行结果赋值到dr，dr为只读
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    MessageBox.Show("改用户已存在，请重新注册！");
                }
                else
                {
                    string insert = "insert ignore into login(user_name,user_password) values ('" + name + "'," + "'" + password + "')";
                    MySqlCommand cmd2 = new MySqlCommand(insert, con);
                    dr.Close();
                    cmd2.ExecuteNonQuery();
                    MessageBox.Show("注册成功！");
                }
            }
            if (radioButton1.Checked == true)//用户表
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

        private void Button3_Click_1(object sender, EventArgs e)
        {
            Form1 f1 = new Form1();//创建打开Form1的对象f1
            f1.Show();//打开From1
        }

        private void Form2_FormClosing(object sender, FormClosingEventArgs e)
        {

        }
    }
}
