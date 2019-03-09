using System;
using System.Runtime.Serialization;
namespace FilmLibrary
{
    [DataContract]
    public class Movie
    {
        [DataMember]
        public Author Author { get; set; }
        [DataMember]
        public DateTime ReleaseDate { get; set; }
        [DataMember]
        public String Title { get; set; }
        [DataMember]
        public String Description { get; set; }
        [DataMember]
        public int Budget { get; set; }
        [DataMember]
        public double Rating { get; set; }
    }
}
