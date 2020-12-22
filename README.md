# Project : 任意給定平面上三點, 判斷外心是否在三角形內.

  * input : 
  	
	>circumcenter
	
  	在[-1,1]*[-1,1]的螢幕上任意點相異三點
  
  * output :
  
  	三角形和外心的座標圖
	
	外心的點座標
		
	判斷外心是否在三角形內
	
	三角形的外接圓
      
      > 若三點共線，則重新執行輸入

## 做法:

1.開一個[-1,1]*[-1,1]的坐標軸 
	```  
	axis([-1,1,-1,1])
	``` 
		
2.使用者輸入三個點並存入x,y矩陣 : 
``` 
[x,y]=ginput(3);
``` 
  > 若三點共線，則重新執行輸入

3.標註三個點並連成三角形

``` 
plot(x,y,'o') 
plot([x(1),x(2)],[y(1),y(2)],[x(2),x(3)],[y(2),y(3)],[x(1),x(3)],[y(1),y(3)])
``` 

4.求出外心座標

三點座標 => 三條方程式

Ex. For 第1,2個點

	f(x,y)=(y(2)-y(1))*(y-y(1))/(x(2)-x(1))+y(1)-y

取其中兩條方程式的中垂線交點即是外心座標

> 先用勘根再用迭代法

* 注意：若中垂線方程式為鉛直線，則另外討論

5.判斷外心位置

對其中兩點形成的直線來說，第三點必須和外心在此方程式的同側

  => 第三點和外心代進方程式出來的值要同號 
  
  => f(x(3))*f(外心)>=0

若同時滿足三條不等式，則外心會落在三角形內

* 狀況:

	其中兩點x座標相同 or 取點均不在鉛直線上

* 注意：

	若有其中兩點x座標相同，則用斜率造出的方程式會有問題，需另外討論
