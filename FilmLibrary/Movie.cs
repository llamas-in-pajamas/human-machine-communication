using System;
using System.Runtime.Serialization;
using System.Xml.Serialization;

namespace FilmLibrary
{
    public enum Genre
    {
        Comedy,
        Action,
        Adventure,
        Drama,
        Horror
    }

    [DataContract(Name = "Movie")]
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
        [DataMember]
        public Genre Genre { get; set; }
    }
}
