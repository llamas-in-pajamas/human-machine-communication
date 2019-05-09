using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.Serialization;

namespace FilmLibrary
{
    [DataContract(IsReference = true)]
    public class AuthorRepository
    {
        [DataMember] public ObservableCollection<Author> Authors;

        public AuthorRepository() { }
        public AuthorRepository(IList<Author> authors)
        {
            Authors = new ObservableCollection<Author>(authors);
        }

        public void Add(Author author)
        {
            Authors.Add(author);
        }
    }
}
