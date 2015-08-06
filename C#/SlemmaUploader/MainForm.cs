using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SlemmaUploader
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void buttonClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void buttonUpload_Click(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;
            // Создадим объект для отправки данных в Слемму
            SlemmaEngine slemmaEngine = new SlemmaEngine()
            {
                AppId = textBoxAppIdSlemma.Text,
                Token = textBoxTokenSlemma.Text,
                Secret = textBoxSecretSlemma.Text,
                Url = "https://slemma.com/api?s=SourceService&m=createFullSchema",
                ProxyUrl = textBoxURLProxy.Text,
                UserProxy = textBoxUserProxy.Text,
                PasswordProxy = textBoxPasswordProxy.Text,
                DontUseProxy = checkBoxDontUseProxy.Checked
            };
            List<QueueStructure> IndexingQueue = new List<QueueStructure>();
            foreach (ListViewItem item in QueuelistView.Items)
            {
                if (item.Checked)
                {
                    if (!((item.Tag as QueueStructure).XML_DESCRIPTION is System.DBNull))
                    {
                        slemmaEngine.Postdata = "[\"" + ((String)(item.Tag as QueueStructure).XML_DESCRIPTION).Replace("\"", "\\\"").Replace("\n", "\\n") + "\", null, null]";
                        string resultPost = slemmaEngine.Post();
                        if (slemmaEngine.Result) item.SubItems[3].Text = "OK";
                        else item.SubItems[3].Text = resultPost;

                    }
                    else item.SubItems[3].Text = "XML_DESCRIPTION is empty";
                }
            }
            Cursor.Current = Cursors.Default;
        }

        private void InitParams()
        {
            // TODO Заменить на загрузку из файла параметров
            /*
            textBoxURLProxy.Text = "proxy.prognoz.ru:8080/";
            textBoxUserProxy.Text = "zhulin";
            textBoxPasswordProxy.Text = "ohz0Io2er";
            textBoxURLSlemma.Text = "https://slemma.com/api?s=SourceService&m=createFullSchema";
            textBoxSecretSlemma.Text = "2bee2ef2-9b09-4dc1-b533-8d01ac886dc8";
            textBoxTokenSlemma.Text = "8c309bff-a6cc-4376-a93c-103e2734ad1c";
            textBoxAppIdSlemma.Text = "37554";
             * */
            textBoxURLProxy.Text = Properties.Settings.Default.URLProxy;
            textBoxUserProxy.Text = Properties.Settings.Default.UserProxy;
            textBoxPasswordProxy.Text = Properties.Settings.Default.PasswordProxy;
            using (var secureString = Properties.Settings.Default.PasswordProxy.DecryptString())
            {
                textBoxPasswordProxy.Text = secureString.ToInsecureString();
            }
            //textBoxURLSlemma.Text = Properties.Settings.Default.URLSlemma;
            textBoxSecretSlemma.Text = Properties.Settings.Default.SecretSlemma;
            textBoxTokenSlemma.Text = Properties.Settings.Default.TokenSlemma;
            textBoxAppIdSlemma.Text = Properties.Settings.Default.AppIdSlemma;
            textBoxServerDB.Text = Properties.Settings.Default.ServerDB;
            textBoxPortDB.Text = Properties.Settings.Default.PortDB;
            textBoxUserDB.Text = Properties.Settings.Default.UserDB;
            using (var secureString = Properties.Settings.Default.PasswordDB.DecryptString())
            {
                textBoxPasswordDB.Text = secureString.ToInsecureString();
            }
            textBoxDatabase.Text = Properties.Settings.Default.Database;

            checkBoxDontUseProxy.Checked = Properties.Settings.Default.DontUseProxy;
            SetPorxyControlsState();

            buttonUpload.Enabled = false;
            buttonRefresData.Visible = false;
        }

        // Процедура инициализации QueuelistView
        private void initQueuelistView()
        {
            QueuelistView.Columns.Clear();
            QueuelistView.Columns.Add("Status", 50, HorizontalAlignment.Center);
            QueuelistView.Columns.Add("Source name", 300, HorizontalAlignment.Left);
            QueuelistView.Columns.Add("XML description", 0, HorizontalAlignment.Left); // hide this column
            QueuelistView.Columns.Add("Last result", 100, HorizontalAlignment.Left);
            QueuelistView.CheckBoxes = true;
            QueuelistView.View = View.Details;
            QueuelistView.GridLines = true;
            QueuelistView.FullRowSelect = true;
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            InitParams();
            initQueuelistView();
        }

        private void SetPorxyControlsState()
        {
            if (checkBoxDontUseProxy.Checked)
            {
                textBoxUserProxy.Enabled = false;
                textBoxPasswordProxy.Enabled = false;
                textBoxURLProxy.Enabled = false;
            }
            else
            {
                textBoxUserProxy.Enabled = true;
                textBoxPasswordProxy.Enabled = true;
                textBoxURLProxy.Enabled = true;
            }
        }

        private void checkBoxDontUseProxy_CheckedChanged(object sender, EventArgs e)
        {
            SetPorxyControlsState();
        }

        private void buttonTestPorxy_Click(object sender, EventArgs e)
        {
            if (checkBoxDontUseProxy.Checked)
            {
                SaveProxyParams();
                return;
            }

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://www.google.com/");
            request.Credentials = new NetworkCredential(textBoxUserProxy.Text, textBoxPasswordProxy.Text);

            WebProxy webProxy = new WebProxy(textBoxURLProxy.Text, true)
            {
                UseDefaultCredentials = false
            };
            webProxy.Credentials = request.Credentials;

            request.Proxy = webProxy;
            try
            {
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            }
            catch (Exception er)
            {
                MessageBox.Show(er.Message, "Proxy authentification", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            SaveProxyParams();
            MessageBox.Show("Proxy authentification succesful", "Proxy authentification", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void SaveProxyParams()
        {
            Properties.Settings.Default.URLProxy = textBoxURLProxy.Text;
            Properties.Settings.Default.UserProxy = textBoxUserProxy.Text;
            using (var secureString = textBoxPasswordProxy.Text.ToSecureString())
            {
                Properties.Settings.Default.PasswordProxy = secureString.EncryptString();
            }
            Properties.Settings.Default.DontUseProxy = checkBoxDontUseProxy.Checked;
            Properties.Settings.Default.Save();
        }

        private void SaveDBParams()
        {
            Properties.Settings.Default.ServerDB = textBoxServerDB.Text;
            Properties.Settings.Default.PortDB = textBoxPortDB.Text;
            Properties.Settings.Default.UserDB = textBoxUserDB.Text;
            using (var secureString = textBoxPasswordDB.Text.ToSecureString())
            {
                Properties.Settings.Default.PasswordDB = secureString.EncryptString();
            }
            Properties.Settings.Default.Database = textBoxDatabase.Text;
            Properties.Settings.Default.Save();
        }

        private void SaveSlemmaParams()
        {
            //Properties.Settings.Default.URLSlemma = textBoxURLSlemma.Text;
            Properties.Settings.Default.SecretSlemma = textBoxSecretSlemma.Text;
            Properties.Settings.Default.TokenSlemma = textBoxTokenSlemma.Text;
            Properties.Settings.Default.AppIdSlemma = textBoxAppIdSlemma.Text;
            Properties.Settings.Default.Save();
        }

        private void buttonTestDB_Click(object sender, EventArgs e)
        {
            SaveDBParams();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SaveSlemmaParams();
        }

        // Процедура отметки списка
        private void HandleList(SelectTypes selectType)
        {
            foreach (ListViewItem item in QueuelistView.Items)
            {
                if (selectType == SelectTypes.SelectAll) { item.Checked = true; }
                if (selectType == SelectTypes.UnselectAll) { item.Checked = false; }
                if (selectType == SelectTypes.InvertSelection) { item.Checked = !item.Checked; }
            }
        }

        private void SelectAll_button_Click(object sender, EventArgs e)
        {
            HandleList(SelectTypes.SelectAll);
        }

        private void InvertSelection_button_Click(object sender, EventArgs e)
        {
            HandleList(SelectTypes.InvertSelection);
        }

        private void UnselectAll_button_Click(object sender, EventArgs e)
        {
            HandleList(SelectTypes.UnselectAll);
        }

        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch ((sender as TabControl).SelectedIndex)
            {
                case 0:
                    buttonRefresData.Visible = false;
                    break;
                case 1:
                    buttonRefresData.Visible = true;
                    break;
                case 2:
                    buttonRefresData.Visible = true;
                    break;
            }
        }
        // Процедура отображения на форме записей для загруки
        private void ShowQueuelist(QueueHandler queueHandler)
        {
            // Список для загруки
            try
            {
                List<QueueStructure> IndexingQueue = queueHandler.GetIndexingQueue();
                // Отобразим ее на форме
                QueuelistView.Items.Clear();
                foreach (QueueStructure queueRecord in IndexingQueue)
                {
                    //index = checkedListBoxQueue.Items.Add(queueRecord, true);
                    var newItem = new ListViewItem();
                    newItem.SubItems.Add(queueRecord.SOURCE_NAME.ToString());
                    newItem.SubItems.Add(queueRecord.XML_DESCRIPTION.ToString());
                    newItem.SubItems.Add(""); //result
                    newItem.Tag = queueRecord;
                    QueuelistView.Items.Add(newItem);
                }
                buttonUpload.Enabled = true;
                // Подгоним ширину колонок 
                // QueuelistView.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message, "DB connection", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void buttonRefresData_Click(object sender, EventArgs e)
        {
            switch (tabControlMain.SelectedIndex)
            {
                case 1:
                    RefreshDatabaseObjects();
                    break;
                case 2:
                    RefreshSlemmaObjects();
                    break;
            }
        }

        private void RefreshSlemmaObjects()
        {
            SlemmaEngine slemmaEngine = new SlemmaEngine()
            {
                AppId = textBoxAppIdSlemma.Text,
                Token = textBoxTokenSlemma.Text,
                Secret = textBoxSecretSlemma.Text,
                Url = "https://slemma.com/api?s=ObjectService&m=getObjects",
                ProxyUrl = textBoxURLProxy.Text,
                UserProxy = textBoxUserProxy.Text,
                PasswordProxy = textBoxPasswordProxy.Text,
                DontUseProxy = checkBoxDontUseProxy.Checked,
                Postdata = "[{\"Objtype\": 2, \"PermissionType\": 1, \"ShowFolders\": true, \"SortDirection\": 1, \"SortField\": 1, \"ParentKey\": null}]"
            };
            string errInfo;
            slemmaEngine.GetSlemmaObjects(out errInfo);
            if (!slemmaEngine.Result)
            {
                MessageBox.Show(errInfo, "Slemma connection", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void RefreshDatabaseObjects()
        {
            Cursor.Current = Cursors.WaitCursor;
            ShowQueuelist(new QueueHandler
            {
                ServerDB = textBoxServerDB.Text,
                PortDB = textBoxPortDB.Text,
                Database = textBoxDatabase.Text,
                UserDB = textBoxUserDB.Text,
                PasswordDB = textBoxPasswordDB.Text,
            }
                        );
            Cursor.Current = Cursors.Default;
        }

        // Функция возвращает список отмеченных на форме записей для индексации
        private List<QueueStructure> GetSelectedQueueList()
        {
            List<QueueStructure> IndexingQueue = new List<QueueStructure>();
            foreach (ListViewItem item in QueuelistView.Items)
            {
                if (item.Checked)
                {
                    // Добавим запись в список на индексацию
                    IndexingQueue.Add(item.Tag as QueueStructure);
                }
            }
            return IndexingQueue;
        }
    }

    enum SelectTypes
    {
        SelectAll,
        UnselectAll,
        InvertSelection
    }
}
