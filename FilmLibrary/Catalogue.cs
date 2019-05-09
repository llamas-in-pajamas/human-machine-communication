using System.Collections;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace FilmLibrary
{
    [DataContract(Name = "Catalogue", Namespace = "")]
    public class Catalogue
    {
        [DataMember] public AuthorRepository AuthorRepository;

        [DataMember] public MovieRepository MovieRepository;

        public Catalogue() { }
        public Catalogue(IList<Author> authors, IList<Movie> movies)
        {
            AuthorRepository = new AuthorRepository(authors);
            MovieRepository = new MovieRepository(movies);
        }
    }
}
