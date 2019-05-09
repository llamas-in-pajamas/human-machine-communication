using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.Serialization;

namespace FilmLibrary
{
    [DataContract(Name="MovieRepository",IsReference = true)]
    public class MovieRepository
    {
        [DataMember]
        public ObservableCollection<Movie> Movies;
        public MovieRepository() { }
        public MovieRepository(IList<Movie> movies)
        {
            Movies = new ObservableCollection<Movie>(movies);
        }
        public void Add(Movie movie)
        {
            Movies.Add(movie);
        }
    }
}
