   M S B A M L   `   `   `  ����   WpfApplication1    WpfApplication1.help   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     -     �Name$  window�� � Title$ 游戏帮助��$��522.875��$	��525�� � WindowStyle$
 None=� � AllowsTransparency .  � 
ResizeMode$ NoResize=� � WindowStartupLocation$ CenterScreen=���Z�  � 	Resources    threeStateButton �� 
TargetType �� Property	 �� Value
 �� 
TargetType ��Name ��Name �� Triggers P� Property P� Value �� 
TargetName  help �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value 	 close 	 page2   EasingFunction-  'System.Windows.Media.Animation.BackEase7  1System.Windows.Media.Animation.EasingFunctionBase   
EasingMode   	Amplitude 	 page3 	 page4 	 page5 	 page6 	 page1��%�
  &	        &	 �    &	      &	 �    &	 �    &	 C    &	 �    &	 �    &	 r	    �� " ��.���  �@J�SnapsToDevicePixels	 . ��  �@�OverridesDefaultStyle	 . ��  � ��	 �� "
 ��.R�� .+��� $ 	ImgBtnBg3��$��resource/image/k1.png���� ._��� $ content��$��Center=�$��Center=�#��z�� P�  �@J�IsMouseOver . . ��� $ 	ImgBtnBg3�� � ��$	 resource/image/k2.png��P�  � �� . . ��� $ 	ImgBtnBg3�� � ��$	 resource/image/k3.png��P�  � {� .  . ��� $ 	ImgBtnBg3�� � ��$	 resource/image/k1.png���� .��U� $( "(Panel.Background).(Brush.Opacity)�$ grid1��.\�  $ 0��$ 0Q�  $ 0:0:0.5��$ 0.845Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid1��.\�  $ 0��$ 0Q�  $ 0:0:0.5��$ -3Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$ grid1��.\�  $ 0��$ 0Q�  $ 0:0:0.5��$	 -81Q�U� $ (UIElement.Opacity)�$ grid1��.\�  $ 0��$ 0Q�  $ 0:0:0.5��$ 1Q��� -   .��U� $( "(Panel.Background).(Brush.Opacity)�$ grid1��.\�  $ 0��$
 0.85Q�  $ 0:0:0.5��$ 0Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid1��.\�  $ 0:0:0.5��$ 0Q�U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�$ grid1��.\�  $ 0:0:0.5��$ 0Q�U� $ (UIElement.Opacity)�$ grid1��.\�  $ 0:0:0.5��$ 0Q��� -   .��U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid2��.\�  $ 0:0:0.5��$
 -512Q�   $ 	EaseInOut=�$	 0.5Q��� -   .��U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid2��.\�  $ 0:0:0.5��$ -1042.5Q�   $ 	EaseInOut=�$	 0.5Q��� -   .��U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid2��.\�  $ 0:0:0.5��$ -1576.5Q�   $ 	EaseInOut=�$	 0.5Q��� -   .��U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid2��.\�  $ 0:0:0.5��$ -2109Q�   $ 	EaseInOut=�$	 0.5Q��� -   .��U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid2��.\�  $ 0:0:0.5��$ -2635.5Q�   $ 	EaseInOut=�$	 0.5Q��� -   .��U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�$ grid2��.\�  $ 0:0:0.5��$ 0Q�   $ 	EaseInOut=�$	 0.5Q� � Triggers :�  :� RoutedEvent$ FrameworkElement.Loaded��.[��� #��[ .��� -	    �Name$
 grid�� J� RenderTransformOrigin$ 0.5,0.5&�$��522.875��$	��Top=�z�V� .~��� �� �� T� .+�� -
   $ grid1��$��0,83.375,0,0q�$ 0.5,0.5&�$��429.5��$	��Top=�z�V� .~��� �� �� T� ����  �� Color$ 	#FF0044A6�� �� Opacity$
 0.85Q�.+��� -    ��Name$
 but1��$��返回主菜单��$
��Left=�$��52��$��203,358,0,0q�$	��Top=�$	��115��#��[  $;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�$��13.333(����	#FFE8EEFF J� Opacity$ 0.995Q�$ 0.5,0.5&��� -   $
 bnt2��$��	下一页��$
��Left=�$��52��$��387,358,0,0q�$	��Top=�$	��115��#��[  $;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�$��13.333(����	#FFE8EEFF$ 0.995Q��� -   $
 bln0��$��	上一页��$
��Left=�$��52��$��
27,358,0,0q�$	��Top=�$	��115��#��[  $;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�$��13.333(����	#FFE8EEFF$y�Hidden=�� -   $ grid2��$
��Left=�$��275.122��$��26.667,54.794,-2734.834,0q�$	��Top=�$��3232.167��$ 0.5,0.5&�z�V� .~��� �� �� T� .+��� -     ��Name$  q��$��起飞��$
��Left=�$��37.167,23.957,0,0q�$	��Top=�$��26.667(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
��������� $c��]        只有在掷得5点或6点后，方可将一枚
棋子由基地起飞至起飞点。��$
��Left=�$��37.167,66.05,0,0q�$	��Top=�
�������$��21.333(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�$��397.313���� -   $  q_Copy��$��连投奖励��$
��Left=�$��37.167,134.625,0,0q�$	��Top=�$��26.667(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
��������� $����        在游戏进行过程中，掷得 6 点的游戏
者可以连续投掷骰子，直至显示点数不是
 6 点或回合结束。
��$
��Left=�$��37.167,176.718,0,0q�$	��Top=�$��397.313��$��21.333(�
�������$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)��� -   $  q_Copy1��$��撞子��$
��Left=�$��542.167,23.957,0,0q�$	��Top=�$��26.667(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
��������� $|��v        棋子在行进过程中走至一格时，若已有
敌方棋子停留，可将敌方的棋子逐回基地。��$
��Left=�$��542.167,64.06,0,0q�$	��Top=�
�������$��21.333(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�$��422.313��$��79.565���� -   $  q_Copy2��$��跳子��$
��Left=�$��542.167,134.625,0,0q�$	��Top=�$��26.667(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
��������� $����        棋子在地图行走时，如果停留在和自己
颜色相同格子，可以向前一个相同颜色格子
作跳跃。��$
��Left=�$��542.167,176.718,0,0q�$	��Top=�$��422.313��$��21.333(�
�������$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�$��87.083���� -   $  q_Copy3��$��飞棋��$
��Left=�$��1073.167,23.957,0,0q�$	��Top=�$��26.667(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
��������� $����        棋子若行进到颜色相同而有虚线连接的
一格，可照虚线箭头指示的路线，通过虚线
到前方颜色相同的的一格后，再跳至下一个
与棋子颜色相同的格内；若棋子是由上一个
颜色相同的格子跳至颜色相同而有虚线连接
的一格内，则棋子照虚线箭头指示的路线，
通过虚线到前方颜色相同的的一格后，棋子
就不再移动。��$
��Left=�$��1073.167,66.05,0,0q�$	��Top=�
�������$��21.333(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�$��423.313��$��206.751���� -   $  q_Copy4��$��迭子（一）��$
��Left=�$��1592.167,23.957,0,0q�$	��Top=�$��26.667(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
��������� $����        己方的棋子走至同一格内， 可迭在一起，
这类情况称为“迭子”。 敌方的棋子不能在迭
子上面飞过； 当敌方的棋子正好停留在“迭子
  ”上方时， 敌方棋子与2架迭子棋子同时返回
停机坪。 若其它游戏者所掷点数大于他的棋子
与迭子的相差步数，则多余格数为 由迭子处返
回的格数。
��$
��Left=�$��1592.167,66.05,0,0q�$	��Top=�
�������$��21.333(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�$��453.313��$��206.751���� -   $  q_Copy5��$��迭子（二）��$
��Left=�$��2126.167,23.957,0,0q�$	��Top=�$��26.667(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
��������� $����        但当其它游戏者所掷点数是6  而且大于他
得棋子与迭子的相差步数时，那么其它游戏者
的棋子可以停于迭子上面。如果棋子在准备通
过虚线时有其他棋子停留在虚线和通往终点线
路的交叉点时： A 、如果对方是一个棋子，则
将该棋子逐回基地，本方棋子继续行进到对岸
； B 、如果对方是两个棋子重叠则该棋子不能
穿越虚线、必须绕行。
��$
��Left=�$��2126.167,66.05,0,0q�$	��Top=�
�������$��21.333(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�$��441.98��$��206.751���� -   $  q_Copy6��$��终点��$
��Left=�$��2666.167,23.957,0,0q�$	��Top=�$��26.667(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
��������� $����    “终点”就是游戏棋子的目的地。当玩家
有棋子到达本格时候，表示到达终点，不能
再控制该棋子。如骰子点数多过于到终点的
格数，也不需要后退，可以直接胜利返回。��$
��Left=�$��2666.167,66.05,0,0q�$	��Top=�
�������$��21.333(�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�$��441.98��$��108.678���� -   $  label��$��游戏规则��$
��Left=�$��190.166,21.544,0,0q�$	��Top=�$ 0.5,0.5&�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
�������$��32(��� -   $  lpage��$��1 / 6��$
��Left=�$��237.166,329.916,0,0q�$	��Top=�$ 0.5,0.5&�$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�
�������$��21.333(�$��51��