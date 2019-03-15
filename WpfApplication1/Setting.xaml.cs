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
    /// Setting.xaml 的交互逻辑
    /// </summary>
    public partial class Setting : Window
    {
        MediaPlayer playsv = new MediaPlayer();
        public Setting()
        {
            InitializeComponent();
            playsv.Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
            bgm.Value = ((MainWindow)Application.Current.MainWindow).mp.Volume;
            bgml.Content = Convert.ToInt32(bgm.Value * 100);
            cm.Value = ((MainWindow)Application.Current.MainWindow).volum;
            yinxiao.Content = Convert.ToInt32(cm.Value * 100);
        }

        private void playsmallvoice(object sender, MouseEventArgs e)
        {
            playsv.Play();
            playsv.Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Slider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            ((MainWindow)Application.Current.MainWindow).mp.Volume = bgm.Value;
            bgml.Content = Convert.ToInt32(bgm.Value * 100);
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                this.DragMove();
        }
        public void changevolum()
        {
            playsv.Volume = ((MainWindow)Application.Current.MainWindow).volum;
        }

        private void cm_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            ((MainWindow)Application.Current.MainWindow).volum = cm.Value;
            ((MainWindow)Application.Current.MainWindow).changevolum();
            yinxiao.Content = Convert.ToInt32(cm.Value * 100);
            this.changevolum();
        }
      

     
        
    }
}
