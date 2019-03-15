using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace WpfApplication1
{
    /// <summary>
    /// player.xaml 的交互逻辑
    /// </summary>
    

    public partial class player : Window
    {
		bool swi=false;
        bool[] players = new bool[4];
        MediaPlayer[] playsv = new MediaPlayer[2];
        public player()
        {
            InitializeComponent();
            players[0] = false;
            players[1] = true;
            players[2] = true;
            players[3] = true;
            for (int i = 0; i < 2; i++)
            {
                playsv[i] = new MediaPlayer();
                playsv[i].Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
                playsv[i].Volume = ((MainWindow)Application.Current.MainWindow).volum;
            }
        }

        private void Button_Click(object sender, System.Windows.RoutedEventArgs e)
        {
        	Close();
        }

        private void Button_Click1(object sender, System.Windows.RoutedEventArgs e)
        {
            swi = true;
			Close();
            game g = new game(players);
            g.Show();
        }

        private void Window_Closed(object sender, System.EventArgs e)
        {
			if(!swi)
        	    ((MainWindow)Application.Current.MainWindow).playhuifu();
        }

        private void i1_MouseLeftButtonDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            int i = Convert.ToInt32((sender as Image).Name.Substring(1));
            changepl(i-1);
        }


        void changepl(int i)
        {
            Label l = FindName("l" + (i+1).ToString()) as Label;
            if (l.Content.ToString() == "玩家")
            {
                l.Content = "电脑";
                players[i] = true;
            }
            else
            {
                l.Content = "玩家";
                players[i] = false;
            }
        }

        private void but1_MouseEnter(object sender, MouseEventArgs e)
        {
            int i = Convert.ToInt32((sender as Button).Name.Substring(3));
            playsv[i].Play();
            playsv[i].Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
        }
    }
}
