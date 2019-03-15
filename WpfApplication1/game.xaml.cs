using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Media.Animation;
using System.Threading;
namespace WpfApplication1
{
    /// <summary>
    /// game.xaml 的交互逻辑
    /// </summary>
    public partial class game : Window
    {
        bool[] players = new bool[4];
        tplane[] zu = new tplane[16]{new tplane(0, 80), new tplane(0, 81), new tplane(0, 82),new tplane(0, 83),
			    		    			new tplane(1, 84), new tplane(1, 85), new tplane(1, 86), new tplane(1, 87),
				    		    		new tplane(2, 88), new tplane(2, 89), new tplane(2, 90), new tplane(2, 91),
					    		    	new tplane(3, 92) ,new tplane(3, 93), new tplane(3, 94), new tplane(3, 95) };
       
        Random ra = new Random();
        int len = 0;
        bool caozuo = false;
        public game(bool[] b)
        {
            this.InitializeComponent();
            players[0] = b[0];
            players[1] = b[1];
            players[2] = b[2];
            players[3] = b[3];
        }

        private void start(object sender, EventArgs e)
        {
            caozuo = true;
        }
        ~game() 
        {
            ra = null;
            //MessageBox.Show("1");
            players = null;
            // MessageBox.Show("1");
            for (int i = 15; i >= 0; i--)
            {
                zu[i] = null; //MessageBox.Show("1");
            }
            // MessageBox.Show("1");
            zu = null;
           
        }
        private void Window_Closed(object sender, System.EventArgs e)
        {
           
              ((MainWindow)Application.Current.MainWindow).Close();
              
        }
        private void playst(string target, int num)
        {
            Storyboard s = (Storyboard)FindResource("s" + num.ToString("00")) as Storyboard;
            Storyboard.SetTargetName(s, target);
            s.Begin();
        }

        private void playam(object sender, EventArgs e)
        {
            Storyboard s = (Storyboard)FindResource("bg") as Storyboard;
            s.Begin();
            s = (Storyboard)FindResource("board") as Storyboard;
            s.Begin();
            for (int i = 0; i < 15; i++)
            {
                Thread thr = new Thread(new ParameterizedThreadStart(w));
                thr.Start(i);
            }
        }

        private void w(object j)
        {
            int i = (int)j;
            Thread.Sleep(700 * i);
            Dispatcher.BeginInvoke(
                new Action(
                    delegate
                    {
                        Storyboard s = (Storyboard)FindResource("d" + i.ToString()) as Storyboard;
                        s.Begin();
                    }));

        }

        private void Button_Click(object sender, System.Windows.RoutedEventArgs e)
        {   
            this.Close();
        }

        private void alert(string a)
        {
            tishi.Content = a;
            Storyboard s = (Storyboard)FindResource("tishi") as Storyboard;
            s.Begin();
        }

        private void image_MouseLeftButtonDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                this.DragMove();
        }

       
        int count = 0;
        private void clickplane(object sender, MouseButtonEventArgs e)
        {
            if (!caozuo)
                return;

            if (len == 0)
            {
                alert("✘    请先掷骰子   ");
                return;
            }

            int bh = Convert.ToInt32((sender as Image).Name.Substring(1, 2));
            if (bh != count % 4 * 4 && bh != count % 4 * 4 + 1 && bh != count % 4 * 4 + 2 && bh != count % 4 * 4+3)
            {
                alert("✘    还没轮到你哦   ");
                return;
            }


            if (len != 5 && len != 6 && zu[ bh ].stat1() == 0)
            {
                alert("✘    操作错误   ");
                return;
            }
            else if (zu[ bh ].stat1() == 3)
            {
                alert("✘    该飞机飞完了   ");
                return;
            }
            else
            {
                int[] va = new int[16];
                for (int i = 0; i < 16; i++)
                    va[i] = zu[i].value();
                zu[ bh ].move(len);
                playst("i" +  bh.ToString("00"), zu[ bh ].value());

                for (int i = 0; i < 16; i++)
                    if (zu[i].value() != va[i])
                        playst("i" + i.ToString("00"), zu[i].value());
                if (zu[bh].stat1() == 3)
                {
                    Image im = FindName("i" + bh.ToString("00")) as Image;
                    im.Source = new BitmapImage(new Uri("resource\\image\\" + (bh / 4).ToString("0") + "w.png", UriKind.Relative));
                }
                
            }        
            if (zu[count % 4 * 4].stat1() == 3 && zu[count % 4 * 4 + 1].stat1() == 3 && zu[count % 4 * 4 + 2].stat1() == 3 && zu[count % 4 * 4 + 3].stat1() == 3)
            {
                string s="";
                ///////////////////////////////////////////////////////////////////////
                if (count % 4 == 0)
                    s = "蓝方";
                else if (count % 4 == 1)
                    s = "黄方";
                else if (count % 4 == 2)
                    s = "绿方";
                else if (count % 4 == 3)
                    s = "红方";
          
                MessageBox.Show("游戏结束，"+s+"获胜"+"请点击返回退出游戏！");

                return;
            }
            count++;
            if (len == 6)
                count--;
            touzibu.Visibility = Visibility.Visible;
            if (players[count % 4])
                zhitouzi(sender, e);
        }
		
		 private void sbending(object sender, EventArgs e)
        {
            //len = 0;
            if (count % 4 == 0)
            {
                lunci.Foreground = null;
                lunci.Foreground = new SolidColorBrush(Color.FromArgb(255,160, 217, 246));
                lunci.Content = "轮到蓝方";
            }
            else if(count%4==1)
            {
                lunci.Foreground = null;
                lunci.Foreground = new SolidColorBrush(Color.FromArgb(255,243, 154, 15));
                lunci.Content = "轮到黄方";
            }
            else if (count % 4 == 2)
            {
                lunci.Foreground = null;
                lunci.Foreground = new SolidColorBrush(Color.FromArgb(255,80, 179, 71));
                lunci.Content = "轮到绿方";
            }
            else if (count % 4 == 3)
            {
                lunci.Foreground = null;
                lunci.Foreground = new SolidColorBrush(Color.FromArgb(255,233, 88, 154));
                lunci.Content = "轮到红方";
            }
		}
		
        private void aftertouzi(object sender, EventArgs e)
        {
            touzict.Visibility = Visibility.Hidden;
            caozuo = true;
            //MessageBox.Show(len.ToString());
            if (len != 6 && len != 5 && (zu[count % 4 * 4].stat1() == 0 || zu[count % 4 * 4].stat1() == 3) && (zu[count % 4 * 4 + 1].stat1() == 0 || zu[count % 4 * 4 + 1].stat1() == 3) && (zu[count % 4 * 4 + 2].stat1() == 0 || zu[count % 4 * 4 + 2].stat1() == 3) && (zu[count % 4 * 4 + 3].stat1() == 0 || zu[count % 4 * 4 + 3].stat1() == 3))
            {
                
                alert("飞机不能移动!");
                count++;
                //len = 0;
                touzibu.Visibility = Visibility.Visible;
                sbending(sender, e);
                if (players[count % 4])
                    zhitouzi(sender, (MouseButtonEventArgs)e);
                return;
            }
            else if(players[count%4])
            {
                int[] evluate = new int[4] { -999999, -999999, -999999, -999999 };
                for (int i = 0; i < 4; i++)
                    if (((len == 5 || len == 6) && zu[count % 4 * 4 + i].stat1() != 3) || (((len != 5) && (len != 6)) && (zu[count % 4 * 4 + i].stat1() == 1 || zu[count % 4 * 4 + i].stat1() == 2)))
                        evluate[i] = zu[count % 4 * 4 + i].evalutaion(len);
                
                int max = returnmax(evluate);
                
                object tsender = FindName("i" + (count % 4 * 4 + max).ToString("00")) as object;
                clickplane(tsender,( MouseButtonEventArgs) e);

                ////////////////////////////////////////////////////////////////////
            }

        }

        int returnmax(int []a)
        {
            if (a[0] >= a[1] && a[0] >= a[2] && a[0] >= a[3])
                return 0;
            else if (a[1] >= a[0] && a[1] >= a[2] && a[1] >= a[3])
                return 1;
            else if (a[2] >= a[1] && a[2] >= a[0] && a[2] >= a[3])
                return 2;
            else if (a[3] >= a[1] && a[3] >= a[2] && a[3] >= a[0])
                return 3;
            return 0;
        }
        void playtouzidonghua(int i)
        {
            touzi.Source = new BitmapImage(new Uri(@"resource\image\"+i.ToString()+".png", UriKind.Relative));
            Storyboard s2 = (Storyboard)this.FindResource("touzidonghua") as Storyboard;
            touzict.Visibility = Visibility.Visible;
            s2.Begin();
        }

        private void zhitouzi(object sender, MouseButtonEventArgs e)
        {
            if (!caozuo)
                return;
            caozuo = false;
            len = ra.Next(1, 7);
            touzibu.Visibility = Visibility.Hidden;
            playtouzidonghua(len);
        }
    }

}