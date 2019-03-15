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
using System.Windows.Shapes;

namespace WpfApplication1
{
    /// <summary>
    /// Window1.xaml 的交互逻辑
    /// </summary>
    public partial class help : Window
    {
        private MainWindow maint;
		public bool swi=true;
        private int page = 1;
        MediaPlayer[] playsv = new MediaPlayer[4];
        public help( MainWindow m)
        {
            maint = m;
            InitializeComponent();
            for (int i = 0; i < 3; i++)
            {
                playsv[i] = new MediaPlayer();
                playsv[i].Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
                playsv[i].Volume = m.volum;
            }
        }

        private void Button_Click(object sender, System.Windows.RoutedEventArgs e)
        {
			if(swi){
				swi=false;
				Storyboard s2 =(Storyboard)this.FindResource("close") as Storyboard;
            	maint.playhuifu();
				s2.Begin();
        	}
		}
		
		private void close(object sender, EventArgs e){
			this.Close();
		}
		private void Move(object sender, System.Windows.Input.MouseEventArgs e)
        {
        	if (e.LeftButton == MouseButtonState.Pressed)
                this.DragMove();
        }

        private void next(object sender, System.Windows.RoutedEventArgs e)
        {
            if(swi&&page<=5)
            {
                swi = false;
                if(page == 5)
                    bnt2.Visibility=Visibility.Hidden;
                if (page == 1)
                    bln0.Visibility = Visibility.Visible;
                page++;
                lpage.Content = page.ToString() + " / 6";
                Storyboard s = (Storyboard)this.FindResource("page"+page.ToString()) as Storyboard;
                s.Begin();
            }
        }

        private void last(object sender, RoutedEventArgs e)
        {
            if (swi&&page>=2)
            {
                swi = false;
                if (page == 6)
                    bnt2.Visibility = Visibility.Visible;
                if (page == 2)
                    bln0.Visibility = Visibility.Hidden;
                page--;
                lpage.Content = page.ToString() + " / 6";
                Storyboard s = (Storyboard)this.FindResource("page" + page.ToString()) as Storyboard;
                s.Begin();
            }
        }

        private void cswi(object sender, EventArgs e)
        {
            swi = true;
        }

        private void playsmallvoice(object sender, MouseEventArgs e)
        {
            var th = sender as Button;
            int i = Convert.ToInt32(th.Name.Substring(3));
            playsv[i].Play();
            playsv[i].Open(new Uri(@"resource\music\smallvoice.mp3", UriKind.Relative));
        }

        private void window_Closed(object sender, System.EventArgs e)
        {
			if(swi)
        	maint.playhuifu();
        }
    }
}
