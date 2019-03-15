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
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApplication1
{
    /// <summary>
    /// MainWindow.xaml 的交互逻辑
    /// </summary>
	
	
	
    public partial class MainWindow : Window
    {
        MediaPlayer []playsv = new MediaPlayer[5];
        TimeSpan st = new TimeSpan(0);
        public double volum = 0.5;//音效

        public MainWindow()
        {
            InitializeComponent();
            mp.Play();
            
           for (int i = 0; i < 5; i++)
            {
                playsv[i] = new MediaPlayer();
                playsv[i].Volume = volum;
                playsv[i].Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
            }		
        }


        private void Button_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            mp.Close();
            Close();
        }

        private void Button_Click_1(object sender, System.Windows.RoutedEventArgs e)
        {
            help h = new help(this);
            Storyboard s = (Storyboard)FindResource("yincang") as Storyboard;
            s.Begin();
            h.ShowDialog();

        }
        public void playhuifu(){
            Storyboard s = (Storyboard)FindResource("huifu") as Storyboard;
            s.Begin();
        }

        private void Move(object sender, System.Windows.Input.MouseEventArgs e)
        {
        	if (e.LeftButton == MouseButtonState.Pressed)
                this.DragMove();
        }
 
        private void PlaySmallVoice(object sender, MouseEventArgs e)
        {
            var th = sender as Button;
            int i = Convert.ToInt32(th.Name.Substring(3));
            playsv[i].Play();
            playsv[i].Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
           
        }

        private void repaly(object sender, System.Windows.RoutedEventArgs e)
        {
            (sender as MediaElement).Position=st;
        }

        
        private void but4_Click(object sender, RoutedEventArgs e)
        {           
            Setting s = new Setting();
            s.ShowDialog();
        }

        private void but2_Click(object sender, RoutedEventArgs e)
        {
            about a = new about();
            a.ShowDialog();
        }  
        public void changevolum(){
            for (int i = 0; i < 5; i++)     
                playsv[i].Volume = volum;      	
        }

        private void but0_Click(object sender, System.Windows.RoutedEventArgs e)
        {
        	player p=new player();
			p.Show();
			Storyboard s = (Storyboard)FindResource("yincang") as Storyboard;
            s.Begin();
        }

        private void window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
        	mp.Close();
        }
    }
}
