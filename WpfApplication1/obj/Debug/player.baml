   M S B A M L   `   `   `  ����  WpfApplication1    WpfApplication1.player   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5          � Title$  player��5   	   $	��236��6   $	��400��6%    � 
ResizeMode$ NoResize=�61    � WindowStartupLocation$ CenterScreen=�6G    � WindowStyle$
 None=�6l    � AllowsTransparency . ��6�   Z�  � 	Resources 5         threeStateButton �� 
TargetType �� Property �� Value	 �� 
TargetType
 ��Name ��Name �� Triggers P� Property P� Value �� 
TargetName��%`  &	        �� 5   
   " ��6)   .�5      ��  �@J�SnapsToDevicePixels . 64   �� 5       �@�OverridesDefaultStyle . 66   �� 5	       � �� 5
      �� 5      "	 ��6&   .R�5      � .+�5      �� $
 	ImgBtnBg3��6$   $��resource/image/k1.png��67   �� 5      ._�5   "   �� $ content��6,   $��Center=�6=   $��Center=�6Z   #��z��6u   5      5       5      P� 5       �@J�IsMouseOver . . �5   "   �� $ 	ImgBtnBg3��5   
    � ��$ resource/image/k2.png��5   
   5   
   5      P� 5       � �� . . �5   "   �� $ 	ImgBtnBg3��5   
    � ��$ resource/image/k3.png��5   
   5   
   5      P� 5       � {� .  . �5   "   �� $ 	ImgBtnBg3��5    
    � ��$ resource/image/k1.png��5   
   5    
   5!      5#      5%      5&      5'      .��5(      � ���	#FF1F3181.+�5)   
   �� -   5         ��Name$
 but1��5)      $��开 始��6   $
��Left=�6-   $��51��6H   $��44.167,178.803,0,0q�6T   $	��Top=�6p   $	��131��6�   #��[  6�   $;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�6�   $��14.667(�6  ���	#FFE8EEFF J� Opacity$ 0.995Q�6@   J� RenderTransformOrigin$ 0.5,0.5&�6P  6p  �� 5*   
   -   5        $
 but0��5*      $��返 回��6   $
��Left=�6-   $��51��6H   $��224.167,178.803,0,0q�6T   $	��Top=�6q   $	��131��6�   #��[  6�   $;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�6�   $��14.667(�6  ���	#FFE8EEFF$ 0.995Q�6@  $ 0.5,0.5&�6P  6p  �� 5+   
   $��玩家设置��6   $	��Top=�6    
�������$7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6K   $��24(�6�   $��Center=�6�   $��0,10,0,0q�6�   �� 5,   
   -   5        $
 i1��5,      $
��Left=�6   $��56��67   $��58.333,87.75,0,0q�6C   $	��Top=�6]   $��56��6u   $��resource/image/blue.png��6�   6�   �� 5-   
   -   5        $
 i2��5-      $
��Left=�6   $��56��67   $��135.667,87.75,0,0q�6C   $	��Top=�6^   $��56��6v   $��resource/image/yellow.png��6�   6�   �� 5.   
   -   5        $
 i3��5.      $
��Left=�6   $��56��67   $��210.332,87.75,0,0q�6C   $	��Top=�6^   $��56��6v   $��resource/image/green.png��6�   6�   �� 5/   
   -   5        $
 i4��5/      $
��Left=�6   $��56��67   $��286.332,87.75,0,0q�6C   $	��Top=�6^   $��56��6v   $��resource/image/red.png��6�   6�   �� 50   
   $��点击图标更换设置��6   $
��Left=�6#   $��141.999,47.093,0,0q�6>   $	��Top=�6Z   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6r   
�������$��13.333(�6�   �� 51   
   -   5         ��Name$ l1��51      $��玩家��6   $
��Left=�6)   $��66.333,148.75,0,0q�6D   $	��Top=�6_   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6w   
�������$��13.333(�6�   �� 52   
   -	   5        $ l2��52      $��电脑��6   $
��Left=�6)   $��145.332,148.75,0,0q�6D   $	��Top=�6`   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6x   
�������$��13.333(�6�   �� 53   
   -
   5        $ l3��53      $��电脑��6   $
��Left=�6)   $��220.249,148.75,0,0q�6D   $	��Top=�6`   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6x   
�������$��13.333(�6�   �� 54   
   -   5        $ l4��54      $��电脑��6   $
��Left=�6)   $��296.332,148.75,0,0q�6D   $	��Top=�6`   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6x   
�������$��13.333(�6�   56      57      