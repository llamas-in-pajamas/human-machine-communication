using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using FilmLibrary;
using XMLUtil;
using System.IO;

namespace UnitTestProject1
{
    [TestClass]
    public class FilmLibrarySerializationSpecs
    {
        private Random gen = new Random();
        private Catalogue catalogue = new Catalogue();

        DateTime RandomDay()
        {
            DateTime start = new DateTime(1995, 1, 1);
            int range = (DateTime.Today - start).Days;
            return start.AddDays(gen.Next(range));
        }

        Author AuthorFactory()
        {
            return new Author()
            {
                FirstName = Faker.Name.First(),
                LastName = Faker.Name.Last()
            };
        }

        Movie MovieFactory()
        {
            return new Movie()
            {
                Author = catalogue.AuthorRepository.Authors[gen.Next(4)],
                Budget = Faker.RandomNumber.Next(),
                ReleaseDate = RandomDay(),
                Description = Faker.Lorem.Paragraph(),
                Rating = Math.Round((gen.NextDouble() * 10.0), 2, MidpointRounding.ToEven),
                Title = Faker.Lorem.Sentence()
            };
        }

        [TestInitialize]
        public void Setup()
        {
            for (int i = 0; i < 4; i++)
            {
                catalogue.AuthorRepository.Add(AuthorFactory());
            }
            for (int i = 0; i < 25; i++)
            {
                catalogue.MovieRepository.Add(MovieFactory());
            }
        }

        [TestMethod]
        public void XmlSerializerTest()
        {
            string fileName = @"movies.xml";
            XML.Serialize(catalogue, fileName, System.IO.FileMode.Create, "movies");
        }

        [TestMethod]
        public void DtdXmlTest()
        {
            string workingDirectory = Environment.CurrentDirectory;
            string projectDirectory = Directory.GetParent(workingDirectory).Parent.FullName;
            XML.ReadXMLwithDTD($"{projectDirectory}/movies.xml");
        }
    }
}
