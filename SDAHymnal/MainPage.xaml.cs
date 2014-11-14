using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Microsoft.Phone.Controls;
using System.Windows.Navigation;
using System.IO;
using System.IO.IsolatedStorage;
using Microsoft.Phone.Tasks;
using System.Windows.Resources;
using System.Text;
using System.Globalization;
using System.Xml.Linq;
using System.Xml;
using SDAHymnal.ViewModels;
using System.ComponentModel;
using System.Threading;
using System.Windows.Controls.Primitives;

namespace SDAHymnal
{
    public partial class MainPage : PhoneApplicationPage
    {
        Popup myPopup;
        BackgroundWorker backroungWorker;
        bool enterNumber;
        IHymnRepository hymnRepository;
        
        public MainPage()
        {
            InitializeComponent();

            myPopup = new Popup() { IsOpen = true, Child = new AnimatedSplashScreen() };
            backroungWorker = new BackgroundWorker();
            RunBackgroundWorker();

            enterNumber = false;

            hymnRepository = new XmlHymnRepository();
        }

        private void RunBackgroundWorker()
        {
            backroungWorker.DoWork += ((s, args) =>
            {
                Thread.Sleep(4000);
            });

            backroungWorker.RunWorkerCompleted += ((s, args) =>
            {
                this.Dispatcher.BeginInvoke(() =>
                {
                    this.myPopup.IsOpen = false;
                }
            );
            });
            backroungWorker.RunWorkerAsync();
        }

        private void ButtonZero_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "0";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "0";
            }

        }

        private void ButtonOne_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "1";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "1";
            }

        }

        private void ButtonTwo_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "2";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "2";
            }

        }

        private void ButtonThree_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "3";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "3";
            }

        }

        private void ButtonFour_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "4";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "4";
            }

        }

        private void ButtonFive_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "5";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "5";
            }

        }

        private void ButtonSix_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "6";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "6";
            }

        }

        private void ButtonSeven_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "7";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "7";
            }

        }

        private void ButtonEight_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "8";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "8";
            }

        }

        private void ButtonNine_Click(object sender, RoutedEventArgs e)
        {
            if (!enterNumber)
            {
                textbox_number.Text = "9";
                enterNumber = true;
            }
            else
            {
                textbox_number.Text += "9";
            }

        }

        private void ButtonOk_Click(object sender, RoutedEventArgs e)
        {

            string hymn = textbox_number.Text.ToString();
            if (hymn.Equals("Selecione o Hino"))
            {
                MessageBox.Show("Selecione o hino primeiro");
            }
            else
            {
                try
                {
                    int temp = Int32.Parse(hymn);
                    if (temp > 610)
                    {
                        MessageBox.Show("Numeração inválida!");
                    }
                    else
                    {
                        NavigationService.Navigate(new Uri(string.Format("/OpenHymn.xaml?parameter={0}", temp), UriKind.Relative));
                        textbox_number.Text = "Selecione o Hino";
                        enterNumber = false;
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("Numeração inválida!");
                    //throw;
                }
            }
        }

        private void ButtonClear_Click(object sender, RoutedEventArgs e)
        {
            textbox_number.Text = "Selecione o Hino";
            enterNumber = false;
        }

        public Hymn GetHymnByNumber(int number)
        {
            return hymnRepository.GetHymnById(number);
        }

        private void ButtonHyperlink_Click(object sender, RoutedEventArgs e)
        {
            WebBrowserTask wbt = new WebBrowserTask();
            wbt.URL = "http://about.me/igorpontes";
            wbt.Show();
        }

        private void TextBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            // While user types, the app searchs.

        }

        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            // When user touch OK button the keyboard go away.
            this.Focus();
            listBox_Results.ItemsSource = hymnRepository.GetHymnListFilterBySentence(textBox_search.Text);
        }

        private void textBox_search_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                this.Focus();
            }
        }

        private void textBox_search_Tap(object sender, System.Windows.Input.GestureEventArgs e)
        {
            textBox_search.Text = "";
        }

        private void StackPanel_Tap(object sender, System.Windows.Input.GestureEventArgs e)
        {
            Hymn selectedItemData = (sender as ListBox).SelectedItem as Hymn;
            if (selectedItemData != null)
            {
                NavigationService.Navigate(new Uri(string.Format("/OpenHymn.xaml?parameter={0}", selectedItemData.Id), UriKind.Relative));
            }
        }

        private void listBox_Results_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Hymn selectedItemData = (sender as ListBox).SelectedItem as Hymn;
            if (selectedItemData != null)
            {
                NavigationService.Navigate(new Uri(string.Format("/OpenHymn.xaml?parameter={0}", selectedItemData.Id), UriKind.Relative));
            }
        }
    }
}