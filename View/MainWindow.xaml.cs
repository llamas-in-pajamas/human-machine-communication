﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace View
{
    public partial class MainWindow : Window
    {
        private ObservableCollection<Author> Authors;
        public MainWindow()
        {
            InitializeComponent();
            Authors = new ObservableCollection<Author>()
            {
                new Author() { FirstName = "Adam", LastName = "Prezes" },
                new Author() { FirstName = "Karol", LastName = "Wielki" }

            };
            listOfAuthors.ItemsSource = Authors;
        }

        private void AddAuthor_Click(object sender, RoutedEventArgs e)
        {
            Authors.Add(new Author()
            {
                FirstName = textFirstName.Text,
                LastName = textLastName.Text
            });
            textFirstName.Text = String.Empty;
            textLastName.Text = String.Empty;
        }

        private void RemoveAuthor_Click(object sender, RoutedEventArgs e)
        {
            Authors.Remove((Author)listOfAuthors.SelectedItem);
        }
    }

    public class Person
    {
        public string Address { get; set; }
        public string Name { get; set; }
    }

    public class Author
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}