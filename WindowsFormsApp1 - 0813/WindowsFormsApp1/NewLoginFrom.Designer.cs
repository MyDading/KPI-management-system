namespace WindowsFormsApp1
{
    partial class NewLoginForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(NewLoginForm));
            this.TextBoxUsername = new CxFlatUI.CxFlatTextBox();
            this.TextBoxPassword = new CxFlatUI.CxFlatTextBox();
            this.ButtonRegister = new CxFlatUI.Controls.CxFlatButton();
            this.ButtonLogin = new CxFlatUI.Controls.CxFlatButton();
            this.LabelUserName = new CCWin.SkinControl.SkinLabel();
            this.LabelPassword = new CCWin.SkinControl.SkinLabel();
            this.ButtonMainFrom = new CxFlatUI.CxFlatSimpleButton();
            this.SuspendLayout();
            // 
            // TextBoxUsername
            // 
            this.TextBoxUsername.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TextBoxUsername.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.TextBoxUsername.Hint = "请输入用户名";
            this.TextBoxUsername.Location = new System.Drawing.Point(319, 155);
            this.TextBoxUsername.Margin = new System.Windows.Forms.Padding(4);
            this.TextBoxUsername.MaxLength = 32767;
            this.TextBoxUsername.Multiline = false;
            this.TextBoxUsername.Name = "TextBoxUsername";
            this.TextBoxUsername.PasswordChar = '\0';
            this.TextBoxUsername.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.TextBoxUsername.SelectedText = "";
            this.TextBoxUsername.SelectionLength = 0;
            this.TextBoxUsername.SelectionStart = 0;
            this.TextBoxUsername.Size = new System.Drawing.Size(333, 38);
            this.TextBoxUsername.TabIndex = 27;
            this.TextBoxUsername.TabStop = false;
            this.TextBoxUsername.Text = "呂運鼎";
            this.TextBoxUsername.UseSystemPasswordChar = false;
            // 
            // TextBoxPassword
            // 
            this.TextBoxPassword.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TextBoxPassword.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.TextBoxPassword.Hint = "请输入密码";
            this.TextBoxPassword.Location = new System.Drawing.Point(319, 216);
            this.TextBoxPassword.Margin = new System.Windows.Forms.Padding(4);
            this.TextBoxPassword.MaxLength = 32767;
            this.TextBoxPassword.Multiline = false;
            this.TextBoxPassword.Name = "TextBoxPassword";
            this.TextBoxPassword.PasswordChar = '*';
            this.TextBoxPassword.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.TextBoxPassword.SelectedText = "";
            this.TextBoxPassword.SelectionLength = 0;
            this.TextBoxPassword.SelectionStart = 0;
            this.TextBoxPassword.Size = new System.Drawing.Size(333, 38);
            this.TextBoxPassword.TabIndex = 28;
            this.TextBoxPassword.TabStop = false;
            this.TextBoxPassword.Text = "18006122";
            this.TextBoxPassword.UseSystemPasswordChar = false;
            // 
            // ButtonRegister
            // 
            this.ButtonRegister.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ButtonRegister.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ButtonRegister.ButtonType = CxFlatUI.ButtonType.Default;
            this.ButtonRegister.Font = new System.Drawing.Font("Segoe UI", 12F);
            this.ButtonRegister.Location = new System.Drawing.Point(499, 290);
            this.ButtonRegister.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonRegister.Name = "ButtonRegister";
            this.ButtonRegister.Size = new System.Drawing.Size(153, 63);
            this.ButtonRegister.TabIndex = 6;
            this.ButtonRegister.Text = "注册";
            this.ButtonRegister.TextColor = System.Drawing.Color.White;
            this.ButtonRegister.Click += new System.EventHandler(this.ButtonRegister_Click);
            // 
            // ButtonLogin
            // 
            this.ButtonLogin.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ButtonLogin.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ButtonLogin.ButtonType = CxFlatUI.ButtonType.Primary;
            this.ButtonLogin.Font = new System.Drawing.Font("Segoe UI", 12F);
            this.ButtonLogin.Location = new System.Drawing.Point(319, 290);
            this.ButtonLogin.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonLogin.Name = "ButtonLogin";
            this.ButtonLogin.Size = new System.Drawing.Size(153, 63);
            this.ButtonLogin.TabIndex = 2;
            this.ButtonLogin.Text = "登陆";
            this.ButtonLogin.TextColor = System.Drawing.Color.White;
            this.ButtonLogin.Click += new System.EventHandler(this.ButtonLogin_Click);
            // 
            // LabelUserName
            // 
            this.LabelUserName.ArtTextStyle = CCWin.SkinControl.ArtTextStyle.None;
            this.LabelUserName.AutoSize = true;
            this.LabelUserName.BackColor = System.Drawing.Color.Transparent;
            this.LabelUserName.BorderColor = System.Drawing.SystemColors.ActiveCaption;
            this.LabelUserName.Font = new System.Drawing.Font("微软雅黑", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.LabelUserName.Location = new System.Drawing.Point(224, 161);
            this.LabelUserName.Name = "LabelUserName";
            this.LabelUserName.Size = new System.Drawing.Size(88, 25);
            this.LabelUserName.TabIndex = 33;
            this.LabelUserName.Text = "用户名：";
            // 
            // LabelPassword
            // 
            this.LabelPassword.ArtTextStyle = CCWin.SkinControl.ArtTextStyle.None;
            this.LabelPassword.AutoSize = true;
            this.LabelPassword.BackColor = System.Drawing.Color.Transparent;
            this.LabelPassword.BorderColor = System.Drawing.SystemColors.ActiveCaption;
            this.LabelPassword.Font = new System.Drawing.Font("微软雅黑", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.LabelPassword.Location = new System.Drawing.Point(243, 221);
            this.LabelPassword.Name = "LabelPassword";
            this.LabelPassword.Size = new System.Drawing.Size(69, 25);
            this.LabelPassword.TabIndex = 34;
            this.LabelPassword.Text = "密码：";
            // 
            // ButtonMainFrom
            // 
            this.ButtonMainFrom.BackColor = System.Drawing.Color.White;
            this.ButtonMainFrom.ButtonType = CxFlatUI.ButtonType.Primary;
            this.ButtonMainFrom.Font = new System.Drawing.Font("Segoe UI", 12F);
            this.ButtonMainFrom.Location = new System.Drawing.Point(869, 507);
            this.ButtonMainFrom.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonMainFrom.Name = "ButtonMainFrom";
            this.ButtonMainFrom.Size = new System.Drawing.Size(68, 25);
            this.ButtonMainFrom.TabIndex = 35;
            this.ButtonMainFrom.Text = "主界面";
            this.ButtonMainFrom.TextColor = System.Drawing.Color.White;
            this.ButtonMainFrom.Click += new System.EventHandler(this.ButtonMainFrom_Click);
            // 
            // NewLoginForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackPalace = ((System.Drawing.Image)(resources.GetObject("$this.BackPalace")));
            this.CanResize = false;
            this.CaptionFont = new System.Drawing.Font("Microsoft YaHei UI", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.ClientSize = new System.Drawing.Size(945, 540);
            this.Controls.Add(this.ButtonMainFrom);
            this.Controls.Add(this.LabelPassword);
            this.Controls.Add(this.LabelUserName);
            this.Controls.Add(this.TextBoxPassword);
            this.Controls.Add(this.TextBoxUsername);
            this.Controls.Add(this.ButtonRegister);
            this.Controls.Add(this.ButtonLogin);
            this.Cursor = System.Windows.Forms.Cursors.Hand;
            this.EffectBack = System.Drawing.SystemColors.GradientActiveCaption;
            this.Name = "NewLoginForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "登陆平台";
            this.Load += new System.EventHandler(this.NewLoginForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private CxFlatUI.CxFlatTextBox TextBoxUsername;
        private CxFlatUI.CxFlatTextBox TextBoxPassword;
        private CxFlatUI.Controls.CxFlatButton ButtonRegister;
        private CxFlatUI.Controls.CxFlatButton ButtonLogin;
        private CCWin.SkinControl.SkinLabel LabelUserName;
        private CCWin.SkinControl.SkinLabel LabelPassword;
        private CxFlatUI.CxFlatSimpleButton ButtonMainFrom;
    }
}