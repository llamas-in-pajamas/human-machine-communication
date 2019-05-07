using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Documents;
using System.Windows.Input;
using FilmLibrary;

namespace View.ViewModel
{
    public class ViewModel : BaseViewModel
    {
        public ObservableCollection<Author> Authors { get; set; }

        public ObservableCollection<Movie> Movies { get; set; }

        public List<Genre> Genres { get; set; }
        public String FirstNameTextBox { get; set; }
        public String LastNameTextBox { get; set; }
        public String TitleTextBox;
        public String DescriptionTextBox;
        public DateTime ReleaseDateDatePicker;
        public Double Budget;
        public Double Rating;
        public Author SelectedAuthor { get; set; }
        public Movie SelectedMovie { get; set; }

        public ICommand RemoveAuthor { get; }
        public ICommand RemoveMovie { get; }
        public ICommand AddAuthor { get; }

        public ViewModel()
        {
            RemoveAuthor = new RelayCommand(RemoveAuth);
            RemoveMovie = new RelayCommand(RemoveMov);
            AddAuthor = new RelayCommand(AddAuth);
             
            Genres = new List<Genre>(Enum.GetValues(typeof(Genre)).Cast<Genre>().ToList());
            _authors = new ObservableCollection<Author>()
            {
                new Author() { FirstName = "Adam", LastName = "Prezes" },
                new Author() { FirstName = "Karol", LastName = "Wielki" }
            };
            _movies = new ObservableCollection<Movie>(){
                new Movie()
                {
                    Title = "Dupa",
                    Description = "sdfghjk",
                    Author = new Author() { FirstName = "Adam", LastName = "Prezes" },
                }
            };
        }

        private void AddAuth()
        {
            Authors.Add(new Author()
            {
                FirstName = FirstNameTextBox,
                LastName = LastNameTextBox
            });

            FirstNameTextBox = String.Empty;
            LastNameTextBox = String.Empty;
        }

        private void RemoveAuth()
        {
            Authors.Remove(SelectedAuthor);
        }

        private void RemoveMov()
        {
            Movies.Remove(SelectedMovie);
        }
    }
}
