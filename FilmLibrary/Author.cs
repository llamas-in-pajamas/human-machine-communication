using System;
using System.Runtime.Serialization;

namespace FilmLibrary
{
    [DataContract(IsReference = true)]
    public class Author
    {
        [DataMember]
        public String FirstName { get; set; }
        [DataMember]
        public String LastName { get; set; }

        public override string ToString()
        {
            return FirstName + ' ' + LastName;
        }
    }
}
