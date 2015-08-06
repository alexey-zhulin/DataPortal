using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SlemmaUploader
{
    class QueueHandler
    {
        public string ServerDB;
        public string PortDB;
        public string UserDB;
        public string PasswordDB;
        public string Database;
        public List<QueueStructure> GetIndexingQueue()
        {
            List<QueueStructure> IndexingQueue = new List<QueueStructure>();
            string connectionStr = "Server=" + ServerDB + "; Port=" + PortDB + "; UserId=" + UserDB + "; Password=" + PasswordDB + "; Database=" + Database + ";";
            try
            {
                using (NpgsqlConnection conn = new NpgsqlConnection(connectionStr))
                {
                    conn.Open();
                    string queryText = "select md.source_id SOURCE_ID, md.source_name SOURCE_NAME, generate_xml_for_datasource(md.source_name) XML_DESCRIPTION from metadata.md_datasources md order by md.source_name";
                    using (NpgsqlCommand dbCommand = new NpgsqlCommand(queryText, conn))
                    {
                        using (NpgsqlDataReader reader = dbCommand.ExecuteReader())
                        {
                            if (reader != null)
                            {
                                while (reader.Read())
                                {
                                    IndexingQueue.Add(new QueueStructure
                                                            {
                                                                SOURCE_ID = reader["SOURCE_ID"],
                                                                SOURCE_NAME = reader["SOURCE_NAME"],
                                                                XML_DESCRIPTION = reader["XML_DESCRIPTION"],
                                                            }
                                                        );
                                }
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return IndexingQueue;
        }
    }

    // Класс, описывающий структуру очереди
    public class QueueStructure
    {
        public object SOURCE_ID;
        public object SOURCE_NAME;
        public object XML_DESCRIPTION;
    }
}
