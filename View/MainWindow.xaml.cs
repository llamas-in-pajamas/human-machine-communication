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

namespace View
{
    public partial class MainWindow : Window
    {
        private ObservableCollection<Person> People;
        public MainWindow()
        {
            InitializeComponent();
            People = new ObservableCollection<Person>()
            {
                new Person() { Name = "Adam", Address = "Test Address 1" },
                new Person() { Name = "Karol", Address = "Test Address 2" }

            };
            listOfNames.ItemsSource = People;
        }

        private void ButtonNames_Click(object sender, RoutedEventArgs e)
        {
            People.Add(new Person()
            {
                Name = textName.Text,
                Address = textAddress.Text
            });
            textName.Text = String.Empty;
            textAddress.Text = String.Empty;
        }
    }

    public class Person
    {
        public string Address { get; set; }
        public string Name { get; set; }
    }
}
