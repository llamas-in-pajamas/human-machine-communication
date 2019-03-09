using System.Runtime.Serialization;

namespace FilmLibrary
{
    [DataContract]
    public class Catalogue
    {
        [DataMember]
        public AuthorRepository AuthorRepository = new AuthorRepository();
        [DataMember]
        public MovieRepository MovieRepository = new MovieRepository();
    }
}
