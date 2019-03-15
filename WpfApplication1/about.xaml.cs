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
using System.Windows.Media.Animation;

namespace WpfApplication1
{
    /// <summary>
    /// about.xaml 的交互逻辑
    /// </summary>
    public partial class about : Window
    {
        MediaPlayer playsv = new MediaPlayer();
        public about()
        {
            InitializeComponent();
            playsv.Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
            playsv.Volume = ((MainWindow)Application.Current.MainWindow).volum;
        }

        private void playsmallvoice(object sender, MouseEventArgs e)
        {
            playsv.Play();
            playsv.Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            int i=Convert.ToInt32((sender as Button).Name.Substring(3));
            NB n = new NB(i);
            n.ShowDialog();
            Close();
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                this.DragMove();
        }

        private void Label_MouseEnter(object sender, System.Windows.Input.MouseEventArgs e)
        {
        	(FindResource("move") as Storyboard).Begin();
        }

        private void Label_MouseLeave(object sender, System.Windows.Input.MouseEventArgs e)
        {
        	(FindResource("huifu") as Storyboard).Begin();
        }    
    }
}
