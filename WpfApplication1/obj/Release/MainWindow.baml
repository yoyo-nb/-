   M S B A M L   `   `   `  ����   WpfApplication1     WpfApplication1.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     -     �Name$  window�� � Title$ 	飞行棋��$	��663��$	��580�� � WindowStyle$
 None=� � 
ResizeMode$ NoResize=�
������  � AllowsTransparency .  � WindowStartupLocation$ CenterScreen=� � 	Resources    threeStateButton �� 
TargetType �� Property	 �� Value
 �� 
TargetType ��Name �� Triggers P� Property P� Value �� 
TargetName  yincang �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value 	 huifu  loading��%P  &	        &	 �    &	 �    &	 4    �� " ��.���  �@J�SnapsToDevicePixels	 . ��  �@�OverridesDefaultStyle	 . ��  � ��	 �� "
 ��.R�� .+��� $��	ImgBtnBg3��$��resource/image/k1.png���� ._��� $ content��$��Center=�$��Center=�#��z�� P�  �@J�IsMouseOver . . ��� $ 	ImgBtnBg3�� � ��$	 resource/image/k2.png��P�  � �� . . ��� $ 	ImgBtnBg3�� � ��$	 resource/image/k3.png��P�  � {� .  . ��� $ 	ImgBtnBg3�� � ��$	 resource/image/k1.png���� .��U� $ (UIElement.Opacity)�$ grid1��.\�  $ 0��$ 0.995Q�  $ 0:0:0.5��$ 0Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid1��.\�  $ 0��$ 0Q�  $ 0:0:0.5��$	 4.5Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$ grid1��.\�  $ 0��$ 0Q�  $ 0:0:0.5��$ 66Q��� .��U� $ (UIElement.Opacity)�$ grid1��.\�  $ 0��$ 0Q�  $ 0:0:0.5��$ 0.995Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid1��.\�  $ 0��$	 4.5Q�  $ 0:0:0.5��$ 0Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$ grid1��.\�  $ 0��$ 66Q�  $ 0:0:0.5��$ 0Q��� .��U� $ (UIElement.Opacity)�$ image��.\�  $ 0��$ 0Q�  $ 0:0:0.4��$ 1Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ image1��.\�  $ 0��$
 -4.5Q�  $ 0:0:0.2��$
 -4.5Q�  $ 0:0:0.7��$ -6Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$ image1��.\�  $ 0��$ -43.5Q�  $ 0:0:0.2��$ -43.5Q�  $ 0:0:0.7��$	 7.5Q�U� $ (UIElement.Opacity)�$ image1��.\�  $ 0��$ 0Q�  $ 0:0:0.2��$ 0Q�  $ 0:0:0.7��$ 0.995Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$
 but0��.\�  $ 0��$
 25.5Q�  $ 0:0:0.3��$
 25.5Q�  $ 0:0:0.6��$ 6Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$
 but1��.\�  $ 0��$
 25.5Q�  $ 0:0:0.5��$
 25.5Q�  $ 0:0:0.8��$ 6Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$
 but2��.\��� $ 0��$
 25.5Q�  $ 0:0:0.9��$
 25.5Q�  $ 0:0:1.2��$ 6Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$
 but3��.\�  $ 0��$
 25.5Q�  $ 0:0:1.1��$
 25.5Q�  $ 0:0:1.4��$ 6Q�U� $ (UIElement.Opacity)�$
 but0��.\�  $ 0��$ 0Q�  $ 0:0:0.3��$ 0Q�  $ 0:0:0.6��$ 1Q�U� $ (UIElement.Opacity)�$
 but1��.\�  $ 0��$ 0Q�  $ 0:0:0.5��$ 0Q�  $ 0:0:0.8��$ 1Q�U� $ (UIElement.Opacity)�$
 but2��.\��� $ 0��$ 0Q�  $ 0:0:0.9��$ 0Q�  $ 0:0:1.2��$ 1Q�U� $ (UIElement.Opacity)�$
 but3��.\�  $ 0��$ 0Q�  $ 0:0:1.1��$ 0Q�  $ 0:0:1.4��$ 1Q�U� $V P(UIElement.RenderTransform).(TransformGroup.Children)[2].(RotateTransform.Angle)�$ image2��.\�  $ 0��$ -5.263Q�  $ 0:0:0.5��$ -5.263Q�  $ 0:0:1.4��$ -27.237Q�U� $V P(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleX)�$ image2��.\�  $ 0��$
 0.36Q�  $ 0:0:0.5��$
 0.36Q�  $ 0:0:1.4��$
 0.99Q�U� $V P(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleY)�$ image2��.\�  $ 0��$ 0.329Q�  $ 0:0:0.5��$ 0.329Q�  $ 0:0:1.4��$ 0.906Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ image2��.\�  $ 0��$ -24.703Q�  $ 0:0:0.5��$ -24.703Q�  $ 0:0:1.4��$ -10.696Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$ image2��.\�  $ 0��$ -55.88Q�  $ 0:0:0.5��$ -55.88Q�  $ 0:0:1.4��$ 6.065Q�U� $ (UIElement.Opacity)�$ image2��.\�  $ 0��$ 0Q�  $ 0:0:0.5��$ 0Q�  $ 0:0:1.4��$ 1Q�U� $V P(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleX)�$ image3��.\�  $ 0��$ 0.557Q�  $ 0:0:0.8��$ 0.557Q�  $ 0:0:1.7��$ 1.767Q�U� $V P(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleY)�$ image3��.\�  $ 0��$ 0.557Q�  $ 0:0:0.8��$ 0.557Q�  $ 0:0:1.7��$ 1.755Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ image3��.\�  $ 0��$ 5.888Q�  $ 0:0:0.8��$ 5.888Q�  $ 0:0:1.7��$ 5.276Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$ image3��.\�  $ 0��$ -21.883Q�  $ 0:0:0.8��$ -21.883Q�  $ 0:0:1.7��$ 85.887Q�U� $V P(UIElement.RenderTransform).(TransformGroup.Children)[2].(RotateTransform.Angle)�$ image3��.\�  $ 0��$ 7.327Q�  $ 0:0:0.8��$ 7.327Q�  $ 0:0:1.7��$ 51.719Q�U� $ (UIElement.Opacity)�$ image3��.\�  $ 0��$ 0Q�  $ 0:0:0.8��$ 0Q�  $ 0:0:1.7��$ 1Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$
 but4��.\�  $ 0��$
 25.5Q�  $ 0:0:0.7��$
 25.5Q�  $ 0:0:1��$ 6Q�U� $ (UIElement.Opacity)�$
 but4��.\�  $ 0��$ 0Q�  $ 0:0:0.7��$ 0Q�  $ 0:0:1��$ 1Q� � Triggers :�  :� RoutedEvent$ FrameworkElement.Loaded��.[��� #��[ .��� -    �Name$
 grid��$��0,0,10,0q� J� RenderTransformOrigin$ 0.5,0.5&�$	��863��$	��Top=�.+�� -   $ grid1��$
��Left=�$	��580��$	��Top=�$	��560�� J� Opacity$ 0.995Q�$ 0.5,0.5&�z�V� .~��� �� �� T� .+��� -    ��Name$ image��$
��Left=�$	��578��$	��Top=�$	��574��$#��resource/image/background.png��$��0,0,-474,-478q�$ 0.5,0.5&�z�V� .~��� �� �� T� �� -   $ image3��$
��Left=�$��156.544��$��358.751,292.728,0,0q�$	��Top=�$��192.998��$ 0.5,0.5&�$��resource/image/feiji2.png��z�V� .~��� �� ��  �� Angle$ 39.818Q�T� �� -   $ image1��$
��Left=�$��194.5��$��34,41.5,-14,0q�$	��Top=�$	��540��$��resource/image/title.png��$ 0.5,0.5&�z�V� .~��� �� �� T� �� -   $ image2��$
��Left=�$��355.832��$��-41.963,238.47,0,-14.302q�$	��Top=�$��348.499��$��resource/image/feiji1.png��$ 0.443,0.469&�z�V� .~��� �� �� $ -27.299Q�T�  T� X$ -2.911Q� T� Y$ 10.989Q��� -    ��Name$
 but0��$��开始游戏��$��Center=�$	��185��$��69��$��Center=�#��[  $��201,219,174,292q����	#FFD8E6FF$;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�$��20(�$ 0.5,0.5&�z�V� .~��� �� �� T� �� -	   $
 but1��$��游戏帮助��$��Center=�$	��185��$��69��$��Center=�#��[  $��201,280,174,231q����	#FFD8E6FF$;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�$��20(�$ 0.5,0.5&�z�V� .~��� �� �� T� �� -
   $
 but4��$��设  置��$��Center=�$	��185��$��69��$��Center=�#��[  $��201,340,174,171q����	#FFD8E6FF$;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�$��20(�$ 0.5,0.5&�z�V� .~��� �� �� T� �� -   $
 but2��$��关  于��$��Center=�$	��185��$��69��$��Center=�#��[  $��201,398,174,113q����	#FFD8E6FF$;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�$��20(�$ 0.5,0.5&�z�V� .~��� �� �� T� �� -   $
 but3��$��退出游戏��$��Center=�$	��185��$��67��$��Center=�#��[  $��201,457,174,56q����	#FFD8E6FF$;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�$��20(�$ 0.5,0.5&�z�V� .~��� �� �� T� r� -    r�Name$ mp��$
��Left=�$��33��$��271,190,0,0q�$	��Top=�$��32�� r� Source$ resource/music/bgm.mp3?�  r� LoadedBehavior$  Manual=�$y�Hidden=�! r� Volume$! 1Q�