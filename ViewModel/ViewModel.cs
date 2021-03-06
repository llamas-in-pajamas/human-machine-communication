﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;
using FilmLibrary;

namespace ViewModel
{
    public class ViewModel : BaseViewModel
    {

        public ObservableCollection<Author> Authors { get; set; }
        public ObservableCollection<Movie> Movies { get; set; }

        public List<Genre> Genres { get; set; }
        private string _firstname;
        public string FirstNameTextBox
        {
            get => _firstname;
            set
            {
                _firstname = value;
                this.OnPropertyChanged(nameof(FirstNameTextBox));
            }
        }
        private string _lastname;
        public string LastNameTextBox
        {
            get => _lastname;
            set
            {
                _lastname = value;
                this.OnPropertyChanged(nameof(LastNameTextBox));
            }
        }
        private string _title;
        public string TitleTextBox {
            get => _title;
            set
            {
                _title = value;
                this.OnPropertyChanged(nameof(TitleTextBox));
            }
        }
        private string _description;
        public string DescriptionTextBox {
            get => _description;
            set
            {
                _description = value;
                this.OnPropertyChanged(nameof(DescriptionTextBox));
            }
        }
        public DateTime ReleaseDateDatePicker { get; set; }
        private int _budget;
        public int Budget
        {
            get => _budget;
            set
            {
                _budget = value;
                this.OnPropertyChanged(nameof(Budget));
            }
        }
        private double _rating;
        public double Rating
        {
            get => _rating;
            set
            {
                _rating = value;
                this.OnPropertyChanged(nameof(Rating));
            }
        }
        public Author SelectedAuthor { get; set; }
        public Movie SelectedMovie { get; set; }

        public ICommand RemoveAuthor { get; }
        public ICommand RemoveMovie { get; }
        public ICommand AddAuthor { get; }
        public ICommand AddMovie { get; }
        public ViewModel()
        {
            RemoveAuthor = new RelayCommand(RemoveAuth);
            RemoveMovie = new RelayCommand(RemoveMov);
            AddAuthor = new RelayCommand(AddAuth);
            AddMovie = new RelayCommand(AddMov);

            Genres = new List<Genre>(Enum.GetValues(typeof(Genre)).Cast<Genre>().ToList());
            Authors = new ObservableCollection<Author>()
            {
                new Author() { FirstName = "Adam", LastName = "Prezes" },
                new Author() { FirstName = "Karol", LastName = "Wielki" }
            };
            Movies = new ObservableCollection<Movie>(){
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

        private void AddMov()
        {
            Movies.Add(new Movie()
            {
                Title = TitleTextBox,
                Author = SelectedAuthor,
                Description = DescriptionTextBox,
                Budget = Budget,
                Rating = Rating,
                ReleaseDate = ReleaseDateDatePicker
            });

            TitleTextBox = String.Empty;
            DescriptionTextBox = String.Empty;
            Rating = 0;
            Budget = 0;
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
