using System;
using System.Xml;
using System.Xml.Serialization;
using System.IO;
using System.Runtime.Serialization;
using System.Xml.Schema;

namespace XMLUtil
{
    public static class XML
    {
        public static T XmlDeserialize<T>(string path)
        {
            DataContractSerializer serializer = new DataContractSerializer(typeof(T));
            using (FileStream fileStream = new FileStream(path, FileMode.Open))
            {
                return (T)serializer.ReadObject(fileStream);
            }
        }

        public static void Serialize<T>(T source, string path, FileMode mode, string stylesheetName)
        {
            DataContractSerializer serializer = new DataContractSerializer(typeof(T));
            XmlWriterSettings settings = new XmlWriterSettings
            {
                Indent = true,
                IndentChars = " ",
                NewLineChars = "\r\n"
            };

            using (FileStream stream = new FileStream(path, mode, FileAccess.Write))
            using (XmlWriter writer = XmlWriter.Create(stream, settings))
            {
                serializer.WriteObject(writer, source);
            }
        }

        public static void ReadXMLwithDTD(string path)
        {
            // Set the validation settings.
            XmlReaderSettings settings = new XmlReaderSettings
            {
                XmlResolver = new XmlUrlResolver(),
                ValidationType = ValidationType.DTD,
                DtdProcessing = DtdProcessing.Parse
            };
            settings.ValidationEventHandler += new ValidationEventHandler(ValidationCallBack);
            settings.IgnoreWhitespace = true;

            // Create the XmlReader object.
            XmlReader reader = XmlReader.Create(path, settings);

            // Parse the file.
            while (reader.Read())
            {
                System.Console.WriteLine("{0}, {1}: {2} ", reader.NodeType, reader.Name, reader.Value);
            }
        }

        private static void ValidationCallBack(object sender, ValidationEventArgs e)
        {
            if (e.Severity == XmlSeverityType.Warning)
                Console.WriteLine("Warning: Matching schema not found.  No validation occurred." + e.Message);
            else // Error
                Console.WriteLine("Validation error: " + e.Message);
        }
    }
}
