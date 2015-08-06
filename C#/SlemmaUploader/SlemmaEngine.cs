using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SlemmaUploader
{
    class SlemmaEngine
    {
        // Параметры подключения к Proxy
        public string ProxyUrl;
        public string UserProxy;
        public string PasswordProxy;
        public bool DontUseProxy;
        // Параметры подключения к Slemma
        public string AppId;
        public string Token;
        public string Secret;
        public string Url;
        public string Postdata;
        // Результат выполнения запроса
        private bool result;
        public bool Result { get { return result; } }

        public SlemmaEngine()
        {
            result = false;
        }
        
        string CalculateSHA1(string text, Encoding enc)
        {
            byte[] buffer = enc.GetBytes(text);
            SHA1CryptoServiceProvider cryptoTransformSHA1 = new SHA1CryptoServiceProvider();
            return BitConverter.ToString(cryptoTransformSHA1.ComputeHash(buffer)).Replace("-", "").ToLower();
        }

        public string Post()
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
            // Добавим параметры proxy, если в этом есть необходимость
            if (!DontUseProxy)
            {
                request.Credentials = new NetworkCredential(UserProxy, PasswordProxy);
                WebProxy webProxy = new WebProxy(ProxyUrl, true)
                {
                    UseDefaultCredentials = false
                };
                webProxy.Credentials = request.Credentials;
                request.Proxy = webProxy;
            }
            request.Headers.Add("sig", CalculateSHA1(Secret + Token, Encoding.UTF8));
            request.Headers.Add("appid", AppId);
            request.Method = "POST";
            request.ContentType = "application/json;charset=UTF-8";
            byte[] data = Encoding.UTF8.GetBytes(Postdata);
            request.ContentLength = data.Length;
            try
            {
                Stream rqStream = request.GetRequestStream();
                rqStream.Write(data, 0, data.Length);
            }
            catch (Exception er)
            {
                result = false;
                return er.Message;
            }
            try
            {
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                StreamReader responseReader = new StreamReader(response.GetResponseStream());
                string fullResponse = responseReader.ReadToEnd();
                response.Close();
                result = true;
                return fullResponse;
            }
            catch (System.Net.WebException e)
            {
                StreamReader responseReader = new StreamReader(e.Response.GetResponseStream());
                try
                {
                    result = false;
                    return responseReader.ReadToEnd();
                }
                finally
                {
                    responseReader.Close();
                }
            }
        }

        public List<SlemmaObject> GetSlemmaObjects(out string errInfo)
        {
            List<SlemmaObject> objectList = new List<SlemmaObject>();
            string jsonArr = Post();
            if (!result) errInfo = jsonArr;
            else errInfo = "";
            return objectList;
        }
    }

    // Класс описывает структуру объекта в базе Slemma
    public class SlemmaObject
    {
        int object_id;
        string object_name;
    }
}
