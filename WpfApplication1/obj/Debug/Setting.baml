   M S B A M L   `   `   `  ����  WpfApplication1    WpfApplication1.Setting   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  游戏设置��5   	   $	��300��6   $	��300��6#    � 
ResizeMode$ NoResize=�6/    � WindowStartupLocation$ CenterScreen=�6E    � WindowStyle$
 None=�6j    � AllowsTransparency . ��6�   Z�  � 	Resources 5         threeStateButton �� 
TargetType �� Property �� Value	 �� 
TargetType
 ��Name �� Triggers P� Property P� Value �� 
TargetName��%i  &	        �� 5   
   " ��6)   .�5      ��  �@J�SnapsToDevicePixels . 64   �� 5       �@�OverridesDefaultStyle . 66   �� 5	       � �� 5
      �� 5      "	 ��6&   .R�5      � .+�5      �� $��	ImgBtnBg3��6$   $��resource/image/k1.png��65   �� 5      ._�5   "   �� $
 content��6,   $��Center=�6=   $��Center=�6Z   #��z��6u   5   #   5      5       5      P� 5       �@J�IsMouseOver . . �5   "   �� $ 	ImgBtnBg3��5   )    � ��$ resource/image/k2.png��5   )   5   )   5      P� 5       � �� . . �5   "   �� $ 	ImgBtnBg3��5   )    � ��$ resource/image/k3.png��5   )   5   )   5      P� 5       � {� .  . �5   "   �� $ 	ImgBtnBg3��5!   )    � ��$ resource/image/k1.png��5    )   5!   )   5"      5$      5&      5'      5(      .��5)      � -   5        ���	#FF1F3181.+�5*   
   �� -   5         ��Name$ label��5*      $��游戏设置��6   $
��Left=�6.   $��
105,30,0,0q�6I   $	��Top=�6]    J� RenderTransformOrigin$ 0.5,0.5&�6u   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6�   
�������$��20(�6�   $��35��6�   $��90��6  �� 5+   
   -   5        $ 
label_Copy��5+      $��背景音乐音量：��6$   $
��Left=�66   $��
35,100,0,0q�6Q   $	��Top=�6e   $ 0.5,0.5&�6}   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6�   
�������$��25��6�   $	��100��6�   $��14(�6  �� 5,   
   -   5        $ label_Copy1��5,      $��游戏音效音量：��6%   $
��Left=�67   $��
35,145,0,0q�6R   $	��Top=�6f   $ 0.5,0.5&�6~   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6�   
�������$��25��6�   $	��100��6�   $��14(�6  �� 5-   
   -   5         ��Name$	 bgm��5-      $
��Left=�6   $��160,100,0,0q�69   $	��Top=�6N   $��75��6f   $��25��6q    � Maximum$ 1Q�6}   6�   �� 5.   
   -   5         ��Name$
 but1��5.      $��确 定��6   $
��Left=�6-   $��44��6H   $��
91,246,0,0q�6T   $	��Top=�6h   $	��117��6�   #��[  6�   $;��5/WpfApplication1;component/Fonts/#Tensentype LingHeiJ)�6�   $��13.333(�6�   ���	#FFE8EEFF J� Opacity$ 0.995Q�67  $ 0.5,0.5&�6G   �� IsCancel . 6�  �� 5/   
   -   5        $ cm��5/      $
��Left=�6   $��160,145,0,0q�68   $	��Top=�6M   $��75��6e   $��25��6p   $ 1Q�6|   6�   �� 50   
   -   5        $
 bgml��50      $��0��6   $
��Left=�6*   $��235,100,0,0q�6E   $	��Top=�6Z   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6r   
�������$��14(�6�   �� 51   
   -	   5        $ yinxiao��51      $��0��6!   $
��Left=�6-   $��235,145,0,0q�6H   $	��Top=�6]   $7��1/WpfApplication1;component/Fonts/#FZZhunYuan-M02S)�6u   
�������$��14(�6�   52      53      