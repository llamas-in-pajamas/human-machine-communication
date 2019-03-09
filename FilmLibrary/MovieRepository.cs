using System.Collections.Generic;
using System.Runtime.Serialization;
namespace FilmLibrary
{
    [DataContract(IsReference = true)]
    public class MovieRepository
    {
        [DataMember]
        public List<Movie> Movies = new List<Movie>();

        public void Add(Movie movie)
        {
            Movies.Add(movie);
        }
    }
}
