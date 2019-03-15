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
    /// NB.xaml 的交互逻辑
    /// </summary>
    public partial class NB : Window
    {
        MediaPlayer playsv = new MediaPlayer();
        public NB(int x)
        {
            InitializeComponent();
            playsv.Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
            playsv.Volume = ((MainWindow)Application.Current.MainWindow).volum;
            if (x == 2)
            {
                im.Source = new BitmapImage(new Uri(@"resource\image\n2.jpg", UriKind.Relative));
                la.Content = "\n66666\n你赢了！";
            }		
        }
        private void playsmallvoice(object sender, MouseEventArgs e)
        {
            playsv.Play();
            playsv.Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
        }

        private void Button_Click(object sender, System.Windows.RoutedEventArgs e)
        {
        	Close();
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                this.DragMove();
        }
       
    }
}
