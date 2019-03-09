using System.Collections.Generic;
using System.Runtime.Serialization;

namespace FilmLibrary
{
    [DataContract(IsReference = true)]
    public class AuthorRepository
    {
        [DataMember]
        public List<Author> Authors = new List<Author>();

        public void Add(Author author)
        {
            Authors.Add(author);
        }
    }
}
