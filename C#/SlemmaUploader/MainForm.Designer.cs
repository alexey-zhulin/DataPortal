namespace SlemmaUploader
{
    partial class MainForm
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.buttonUpload = new System.Windows.Forms.Button();
            this.imageListForm = new System.Windows.Forms.ImageList(this.components);
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.buttonClose = new System.Windows.Forms.Button();
            this.tabControlMain = new System.Windows.Forms.TabControl();
            this.tabPageParams = new System.Windows.Forms.TabPage();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.textBoxAppIdSlemma = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.textBoxSecretSlemma = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.textBoxTokenSlemma = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.textBoxURLProxy = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.checkBoxDontUseProxy = new System.Windows.Forms.CheckBox();
            this.buttonTestPorxy = new System.Windows.Forms.Button();
            this.textBoxPasswordProxy = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxUserProxy = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.textBoxDatabase = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.textBoxPortDB = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.textBoxServerDB = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.buttonTestDB = new System.Windows.Forms.Button();
            this.textBoxPasswordDB = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.textBoxUserDB = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.tabPageData = new System.Windows.Forms.TabPage();
            this.UnselectAll_button = new System.Windows.Forms.Button();
            this.InvertSelection_button = new System.Windows.Forms.Button();
            this.SelectAll_button = new System.Windows.Forms.Button();
            this.QueuelistView = new System.Windows.Forms.ListView();
            this.buttonRefresData = new System.Windows.Forms.Button();
            this.tabPageSlemmaObjects = new System.Windows.Forms.TabPage();
            this.tabControlMain.SuspendLayout();
            this.tabPageParams.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.tabPageData.SuspendLayout();
            this.SuspendLayout();
            // 
            // buttonUpload
            // 
            this.buttonUpload.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.buttonUpload.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonUpload.ImageIndex = 4;
            this.buttonUpload.ImageList = this.imageListForm;
            this.buttonUpload.Location = new System.Drawing.Point(12, 454);
            this.buttonUpload.Name = "buttonUpload";
            this.buttonUpload.Size = new System.Drawing.Size(75, 23);
            this.buttonUpload.TabIndex = 16;
            this.buttonUpload.Text = "Upload";
            this.buttonUpload.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.buttonUpload.UseVisualStyleBackColor = true;
            this.buttonUpload.Click += new System.EventHandler(this.buttonUpload_Click);
            // 
            // imageListForm
            // 
            this.imageListForm.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageListForm.ImageStream")));
            this.imageListForm.TransparentColor = System.Drawing.Color.Transparent;
            this.imageListForm.Images.SetKeyName(0, "file-open.gif");
            this.imageListForm.Images.SetKeyName(1, "invertselection.png");
            this.imageListForm.Images.SetKeyName(2, "selectall.png");
            this.imageListForm.Images.SetKeyName(3, "unselectall.png");
            this.imageListForm.Images.SetKeyName(4, "Button-Upload-icon.png");
            this.imageListForm.Images.SetKeyName(5, "refresh.png");
            // 
            // statusStrip1
            // 
            this.statusStrip1.Location = new System.Drawing.Point(0, 480);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(653, 22);
            this.statusStrip1.TabIndex = 2;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // buttonClose
            // 
            this.buttonClose.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.buttonClose.Location = new System.Drawing.Point(93, 454);
            this.buttonClose.Name = "buttonClose";
            this.buttonClose.Size = new System.Drawing.Size(75, 23);
            this.buttonClose.TabIndex = 17;
            this.buttonClose.Text = "Close";
            this.buttonClose.UseVisualStyleBackColor = true;
            this.buttonClose.Click += new System.EventHandler(this.buttonClose_Click);
            // 
            // tabControlMain
            // 
            this.tabControlMain.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tabControlMain.Controls.Add(this.tabPageParams);
            this.tabControlMain.Controls.Add(this.tabPageData);
            this.tabControlMain.Controls.Add(this.tabPageSlemmaObjects);
            this.tabControlMain.Location = new System.Drawing.Point(0, 0);
            this.tabControlMain.Name = "tabControlMain";
            this.tabControlMain.SelectedIndex = 0;
            this.tabControlMain.Size = new System.Drawing.Size(653, 443);
            this.tabControlMain.TabIndex = 18;
            this.tabControlMain.SelectedIndexChanged += new System.EventHandler(this.tabControl1_SelectedIndexChanged);
            // 
            // tabPageParams
            // 
            this.tabPageParams.Controls.Add(this.groupBox3);
            this.tabPageParams.Controls.Add(this.groupBox2);
            this.tabPageParams.Controls.Add(this.groupBox1);
            this.tabPageParams.Location = new System.Drawing.Point(4, 22);
            this.tabPageParams.Name = "tabPageParams";
            this.tabPageParams.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageParams.Size = new System.Drawing.Size(645, 417);
            this.tabPageParams.TabIndex = 0;
            this.tabPageParams.Text = "Connection params";
            this.tabPageParams.UseVisualStyleBackColor = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox3.Controls.Add(this.button1);
            this.groupBox3.Controls.Add(this.textBoxAppIdSlemma);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Controls.Add(this.textBoxSecretSlemma);
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Controls.Add(this.textBoxTokenSlemma);
            this.groupBox3.Controls.Add(this.label6);
            this.groupBox3.Location = new System.Drawing.Point(8, 288);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(629, 163);
            this.groupBox3.TabIndex = 8;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Slemma connection params";
            // 
            // button1
            // 
            this.button1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.button1.Location = new System.Drawing.Point(530, 97);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(93, 23);
            this.button1.TabIndex = 15;
            this.button1.Text = "Save";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // textBoxAppIdSlemma
            // 
            this.textBoxAppIdSlemma.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxAppIdSlemma.Location = new System.Drawing.Point(70, 19);
            this.textBoxAppIdSlemma.Name = "textBoxAppIdSlemma";
            this.textBoxAppIdSlemma.Size = new System.Drawing.Size(553, 20);
            this.textBoxAppIdSlemma.TabIndex = 11;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 22);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(37, 13);
            this.label4.TabIndex = 17;
            this.label4.Text = "AppID";
            // 
            // textBoxSecretSlemma
            // 
            this.textBoxSecretSlemma.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxSecretSlemma.Location = new System.Drawing.Point(70, 71);
            this.textBoxSecretSlemma.Name = "textBoxSecretSlemma";
            this.textBoxSecretSlemma.Size = new System.Drawing.Size(553, 20);
            this.textBoxSecretSlemma.TabIndex = 13;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 74);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(38, 13);
            this.label5.TabIndex = 15;
            this.label5.Text = "Secret";
            // 
            // textBoxTokenSlemma
            // 
            this.textBoxTokenSlemma.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxTokenSlemma.Location = new System.Drawing.Point(70, 46);
            this.textBoxTokenSlemma.Name = "textBoxTokenSlemma";
            this.textBoxTokenSlemma.Size = new System.Drawing.Size(553, 20);
            this.textBoxTokenSlemma.TabIndex = 12;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(6, 49);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(38, 13);
            this.label6.TabIndex = 13;
            this.label6.Text = "Token";
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.textBoxURLProxy);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.checkBoxDontUseProxy);
            this.groupBox2.Controls.Add(this.buttonTestPorxy);
            this.groupBox2.Controls.Add(this.textBoxPasswordProxy);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.textBoxUserProxy);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Location = new System.Drawing.Point(8, 147);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(629, 135);
            this.groupBox2.TabIndex = 7;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Proxy connection params";
            // 
            // textBoxURLProxy
            // 
            this.textBoxURLProxy.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxURLProxy.Location = new System.Drawing.Point(70, 22);
            this.textBoxURLProxy.Name = "textBoxURLProxy";
            this.textBoxURLProxy.Size = new System.Drawing.Size(553, 20);
            this.textBoxURLProxy.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 25);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(58, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Proxy URL";
            // 
            // checkBoxDontUseProxy
            // 
            this.checkBoxDontUseProxy.AutoSize = true;
            this.checkBoxDontUseProxy.Location = new System.Drawing.Point(70, 104);
            this.checkBoxDontUseProxy.Name = "checkBoxDontUseProxy";
            this.checkBoxDontUseProxy.Size = new System.Drawing.Size(106, 17);
            this.checkBoxDontUseProxy.TabIndex = 9;
            this.checkBoxDontUseProxy.Text = "Do not use proxy";
            this.checkBoxDontUseProxy.UseVisualStyleBackColor = true;
            this.checkBoxDontUseProxy.CheckedChanged += new System.EventHandler(this.checkBoxDontUseProxy_CheckedChanged);
            // 
            // buttonTestPorxy
            // 
            this.buttonTestPorxy.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonTestPorxy.Location = new System.Drawing.Point(530, 100);
            this.buttonTestPorxy.Name = "buttonTestPorxy";
            this.buttonTestPorxy.Size = new System.Drawing.Size(93, 23);
            this.buttonTestPorxy.TabIndex = 10;
            this.buttonTestPorxy.Text = "Test and Save";
            this.buttonTestPorxy.UseVisualStyleBackColor = true;
            this.buttonTestPorxy.Click += new System.EventHandler(this.buttonTestPorxy_Click);
            // 
            // textBoxPasswordProxy
            // 
            this.textBoxPasswordProxy.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxPasswordProxy.Location = new System.Drawing.Point(70, 74);
            this.textBoxPasswordProxy.Name = "textBoxPasswordProxy";
            this.textBoxPasswordProxy.PasswordChar = '*';
            this.textBoxPasswordProxy.Size = new System.Drawing.Size(553, 20);
            this.textBoxPasswordProxy.TabIndex = 8;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 77);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "Password";
            // 
            // textBoxUserProxy
            // 
            this.textBoxUserProxy.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxUserProxy.Location = new System.Drawing.Point(70, 49);
            this.textBoxUserProxy.Name = "textBoxUserProxy";
            this.textBoxUserProxy.Size = new System.Drawing.Size(553, 20);
            this.textBoxUserProxy.TabIndex = 7;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 52);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "User name";
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.textBoxDatabase);
            this.groupBox1.Controls.Add(this.label12);
            this.groupBox1.Controls.Add(this.textBoxPortDB);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.textBoxServerDB);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.buttonTestDB);
            this.groupBox1.Controls.Add(this.textBoxPasswordDB);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.textBoxUserDB);
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Location = new System.Drawing.Point(8, 6);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(629, 135);
            this.groupBox1.TabIndex = 6;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "DB connection params";
            // 
            // textBoxDatabase
            // 
            this.textBoxDatabase.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxDatabase.Location = new System.Drawing.Point(466, 22);
            this.textBoxDatabase.Name = "textBoxDatabase";
            this.textBoxDatabase.Size = new System.Drawing.Size(157, 20);
            this.textBoxDatabase.TabIndex = 3;
            // 
            // label12
            // 
            this.label12.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(412, 25);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(53, 13);
            this.label12.TabIndex = 22;
            this.label12.Text = "Database";
            // 
            // textBoxPortDB
            // 
            this.textBoxPortDB.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxPortDB.Location = new System.Drawing.Point(306, 22);
            this.textBoxPortDB.Name = "textBoxPortDB";
            this.textBoxPortDB.Size = new System.Drawing.Size(100, 20);
            this.textBoxPortDB.TabIndex = 2;
            // 
            // label11
            // 
            this.label11.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(274, 25);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(26, 13);
            this.label11.TabIndex = 20;
            this.label11.Text = "Port";
            // 
            // textBoxServerDB
            // 
            this.textBoxServerDB.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxServerDB.Location = new System.Drawing.Point(70, 22);
            this.textBoxServerDB.Name = "textBoxServerDB";
            this.textBoxServerDB.Size = new System.Drawing.Size(198, 20);
            this.textBoxServerDB.TabIndex = 1;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(6, 25);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(38, 13);
            this.label8.TabIndex = 18;
            this.label8.Text = "Server";
            // 
            // buttonTestDB
            // 
            this.buttonTestDB.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonTestDB.Location = new System.Drawing.Point(530, 100);
            this.buttonTestDB.Name = "buttonTestDB";
            this.buttonTestDB.Size = new System.Drawing.Size(93, 23);
            this.buttonTestDB.TabIndex = 5;
            this.buttonTestDB.Text = "Test and Save";
            this.buttonTestDB.UseVisualStyleBackColor = true;
            this.buttonTestDB.Click += new System.EventHandler(this.buttonTestDB_Click);
            // 
            // textBoxPasswordDB
            // 
            this.textBoxPasswordDB.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxPasswordDB.Location = new System.Drawing.Point(70, 74);
            this.textBoxPasswordDB.Name = "textBoxPasswordDB";
            this.textBoxPasswordDB.PasswordChar = '*';
            this.textBoxPasswordDB.Size = new System.Drawing.Size(553, 20);
            this.textBoxPasswordDB.TabIndex = 4;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(6, 77);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(53, 13);
            this.label9.TabIndex = 15;
            this.label9.Text = "Password";
            // 
            // textBoxUserDB
            // 
            this.textBoxUserDB.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxUserDB.Location = new System.Drawing.Point(70, 49);
            this.textBoxUserDB.Name = "textBoxUserDB";
            this.textBoxUserDB.Size = new System.Drawing.Size(553, 20);
            this.textBoxUserDB.TabIndex = 3;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(6, 52);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(58, 13);
            this.label10.TabIndex = 13;
            this.label10.Text = "User name";
            // 
            // tabPageData
            // 
            this.tabPageData.Controls.Add(this.UnselectAll_button);
            this.tabPageData.Controls.Add(this.InvertSelection_button);
            this.tabPageData.Controls.Add(this.SelectAll_button);
            this.tabPageData.Controls.Add(this.QueuelistView);
            this.tabPageData.Location = new System.Drawing.Point(4, 22);
            this.tabPageData.Name = "tabPageData";
            this.tabPageData.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageData.Size = new System.Drawing.Size(645, 417);
            this.tabPageData.TabIndex = 1;
            this.tabPageData.Text = "Data to upload";
            this.tabPageData.UseVisualStyleBackColor = true;
            // 
            // UnselectAll_button
            // 
            this.UnselectAll_button.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.UnselectAll_button.ImageIndex = 3;
            this.UnselectAll_button.ImageList = this.imageListForm;
            this.UnselectAll_button.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.UnselectAll_button.Location = new System.Drawing.Point(602, 64);
            this.UnselectAll_button.Name = "UnselectAll_button";
            this.UnselectAll_button.Size = new System.Drawing.Size(35, 23);
            this.UnselectAll_button.TabIndex = 61;
            this.UnselectAll_button.UseVisualStyleBackColor = true;
            this.UnselectAll_button.Click += new System.EventHandler(this.UnselectAll_button_Click);
            // 
            // InvertSelection_button
            // 
            this.InvertSelection_button.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.InvertSelection_button.ImageIndex = 1;
            this.InvertSelection_button.ImageList = this.imageListForm;
            this.InvertSelection_button.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.InvertSelection_button.Location = new System.Drawing.Point(602, 35);
            this.InvertSelection_button.Name = "InvertSelection_button";
            this.InvertSelection_button.Size = new System.Drawing.Size(35, 23);
            this.InvertSelection_button.TabIndex = 60;
            this.InvertSelection_button.UseVisualStyleBackColor = true;
            this.InvertSelection_button.Click += new System.EventHandler(this.InvertSelection_button_Click);
            // 
            // SelectAll_button
            // 
            this.SelectAll_button.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.SelectAll_button.ImageIndex = 2;
            this.SelectAll_button.ImageList = this.imageListForm;
            this.SelectAll_button.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.SelectAll_button.Location = new System.Drawing.Point(602, 6);
            this.SelectAll_button.Name = "SelectAll_button";
            this.SelectAll_button.Size = new System.Drawing.Size(35, 23);
            this.SelectAll_button.TabIndex = 59;
            this.SelectAll_button.UseVisualStyleBackColor = true;
            this.SelectAll_button.Click += new System.EventHandler(this.SelectAll_button_Click);
            // 
            // QueuelistView
            // 
            this.QueuelistView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.QueuelistView.CheckBoxes = true;
            this.QueuelistView.Location = new System.Drawing.Point(8, 6);
            this.QueuelistView.Name = "QueuelistView";
            this.QueuelistView.Size = new System.Drawing.Size(588, 405);
            this.QueuelistView.TabIndex = 58;
            this.QueuelistView.UseCompatibleStateImageBehavior = false;
            this.QueuelistView.View = System.Windows.Forms.View.List;
            // 
            // buttonRefresData
            // 
            this.buttonRefresData.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonRefresData.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.buttonRefresData.ImageIndex = 5;
            this.buttonRefresData.ImageList = this.imageListForm;
            this.buttonRefresData.Location = new System.Drawing.Point(574, 454);
            this.buttonRefresData.Name = "buttonRefresData";
            this.buttonRefresData.Size = new System.Drawing.Size(75, 23);
            this.buttonRefresData.TabIndex = 19;
            this.buttonRefresData.Text = "Get data";
            this.buttonRefresData.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.buttonRefresData.UseVisualStyleBackColor = true;
            this.buttonRefresData.Click += new System.EventHandler(this.buttonRefresData_Click);
            // 
            // tabPageSlemmaObjects
            // 
            this.tabPageSlemmaObjects.Location = new System.Drawing.Point(4, 22);
            this.tabPageSlemmaObjects.Name = "tabPageSlemmaObjects";
            this.tabPageSlemmaObjects.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageSlemmaObjects.Size = new System.Drawing.Size(645, 417);
            this.tabPageSlemmaObjects.TabIndex = 2;
            this.tabPageSlemmaObjects.Text = "Slemma objects";
            this.tabPageSlemmaObjects.UseVisualStyleBackColor = true;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(653, 502);
            this.Controls.Add(this.buttonRefresData);
            this.Controls.Add(this.tabControlMain);
            this.Controls.Add(this.buttonClose);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.buttonUpload);
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Data uploader";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.tabControlMain.ResumeLayout(false);
            this.tabPageParams.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.tabPageData.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonUpload;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.Button buttonClose;
        private System.Windows.Forms.TabControl tabControlMain;
        private System.Windows.Forms.TabPage tabPageParams;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox textBoxAppIdSlemma;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBoxSecretSlemma;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox textBoxTokenSlemma;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox textBoxURLProxy;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.CheckBox checkBoxDontUseProxy;
        private System.Windows.Forms.Button buttonTestPorxy;
        private System.Windows.Forms.TextBox textBoxPasswordProxy;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxUserProxy;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox textBoxPortDB;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox textBoxServerDB;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button buttonTestDB;
        private System.Windows.Forms.TextBox textBoxPasswordDB;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox textBoxUserDB;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TabPage tabPageData;
        private System.Windows.Forms.Button UnselectAll_button;
        private System.Windows.Forms.ImageList imageListForm;
        private System.Windows.Forms.Button InvertSelection_button;
        private System.Windows.Forms.Button SelectAll_button;
        private System.Windows.Forms.ListView QueuelistView;
        private System.Windows.Forms.Button buttonRefresData;
        private System.Windows.Forms.TextBox textBoxDatabase;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TabPage tabPageSlemmaObjects;
    }
}

