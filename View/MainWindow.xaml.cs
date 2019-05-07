using System;
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
using View.ViewModel;

namespace View
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        //private void AddAuthor_Click(object sender, RoutedEventArgs e)
        //{
        //    Authors.Add(new Author()
        //    {
        //        FirstName = textFirstName.Text,
        //        LastName = textLastName.Text
        //    });
        //    textFirstName.Text = String.Empty;
        //    textLastName.Text = String.Empty;
        //}

        //private void RemoveAuthor_Click(object sender, RoutedEventArgs e)
        //{
        //    Authors.Remove((Author)listOfAuthors.SelectedItem);
        //}

        //private void AddMovie_Click(object sender, RoutedEventArgs e)
        //{
        //    Movies.Add(new Movie()
        //    {

        //    });
        //}

        //private void RemoveMovie_Click(object sender, RoutedEventArgs e)
        //{
        //    Movies.Remove((Movie) listOfMovies.SelectedItem);
        //}
    }

    //public class Author
    //{
    //    public string FirstName { get; set; }
    //    public string LastName { get; set; }
    //    public override string ToString()
    //    {
    //        return FirstName + ' ' + LastName;
    //    }
    //}

    //public enum Genre
    //{
    //    Comedy,
    //    Action,
    //    Adventure,
    //    Drama,
    //    Horror
    //}

    //public class Movie
    //{
    //    public Author Author { get; set; }
    //    public DateTime ReleaseDate { get; set; }
    //    public String Title { get; set; }
    //    public String Description { get; set; }
    //    public int Budget { get; set; }
    //    public double Rating { get; set; }
    //    public Genre Genre { get; set; }
    //}
}
